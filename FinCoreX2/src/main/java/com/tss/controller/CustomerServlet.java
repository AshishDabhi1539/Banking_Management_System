package com.tss.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.exception.InsufficientBalanceException;
import com.tss.model.Customer;
import com.tss.model.User;
import com.tss.service.AccountService;
import com.tss.service.AdminService;
import com.tss.service.AuthService;
import com.tss.service.ComplaintService;
import com.tss.service.CustomerService;
import com.tss.service.LoanService;
import com.tss.util.Constants;

@WebServlet(urlPatterns = {
    "/customer/dashboard", "/customer/deposit", "/customer/withdraw", "/customer/transfer", 
    "/customer/open-account", "/customer/complaints", "/customer/loan_status", 
    "/customer/apply_loan", "/customer/repay_loan"
})
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AccountService accountService = new AccountService();
    private final AdminService adminService = new AdminService();
    @SuppressWarnings("unused")
    private final AuthService authService = new AuthService();
    private final ComplaintService complaintService = new ComplaintService();
    private final CustomerService customerService = new CustomerService();
    private final LoanService loanService = new LoanService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        User u = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int customerId = getCustomerId(u.getUserId(), req);
            Customer customer = customerService.get(customerId);
            if (customer == null) {
                req.setAttribute(Constants.ATTR_ERRORS, "Customer not found.");
                req.getRequestDispatcher("/error.jsp").forward(req, resp);
                return;
            }

            switch (path) {
                case "/customer/dashboard":
                    try {
                        req.setAttribute("summary", adminService.getDashboardSummary());
                    } catch (SQLException e) {
                        System.out.println("Error fetching dashboard summary: " + e.getMessage());
                        req.setAttribute("error", "Failed to load dashboard summary.");
                    }
                    req.getRequestDispatcher("/customer_dashboard.jsp").forward(req, resp);
                    break;
                case "/customer/complaints":
                    req.setAttribute("complaints", complaintService.findByCustomer(customerId));
                    req.getRequestDispatcher("/complaints.jsp").forward(req, resp);
                    break;
                case "/customer/loan_status":
                    req.setAttribute("loans", loanService.getLoansByCustomer(customerId));
                    req.getRequestDispatcher("/loan_status.jsp").forward(req, resp);
                    break;
                case "/customer/apply_loan":
                    req.setAttribute("customerId", customerId);
                    req.getRequestDispatcher("/apply_loan.jsp").forward(req, resp);
                    break;
                case "/customer/repay_loan":
                    req.setAttribute("customerId", customerId);
                    req.setAttribute("loans", loanService.getLoansByCustomer(customerId));
                    req.getRequestDispatcher("/repay_loan.jsp").forward(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        try {
            int userId = u.getUserId(); // Get userId from session
            int customerId = getCustomerId(userId, req);
            switch (req.getServletPath()) {
                case "/customer/deposit":
                    int accIdD = Integer.parseInt(req.getParameter("accountId"));
                    BigDecimal amtD = new BigDecimal(req.getParameter("amount"));
                    accountService.deposit(userId, accIdD, amtD);
                    resp.sendRedirect(req.getContextPath() + "/accounts?success=1");
                    break;
                case "/customer/withdraw":
                    int accIdW = Integer.parseInt(req.getParameter("accountId"));
                    BigDecimal amtW = new BigDecimal(req.getParameter("amount"));
                    try {
                        accountService.withdraw(userId, accIdW, amtW);
                        resp.sendRedirect(req.getContextPath() + "/accounts?success=1");
                    } catch (InsufficientBalanceException e) {
                        req.setAttribute("error", "Insufficient balance for withdrawal.");
                        req.getRequestDispatcher("/error.jsp").forward(req, resp);
                    }
                    break;
                case "/customer/transfer":
                    int fromId = Integer.parseInt(req.getParameter("fromAccountId"));
                    String toAcc = req.getParameter("toAccountNumber");
                    BigDecimal amtT = new BigDecimal(req.getParameter("amount"));
                    try {
                        accountService.transfer(userId, fromId, toAcc, amtT);
                        resp.sendRedirect(req.getContextPath() + "/accounts?success=1");
                    } catch (InsufficientBalanceException e) {
                        req.setAttribute("error", "Insufficient balance for transfer.");
                        req.getRequestDispatcher("/error.jsp").forward(req, resp);
                    }
                    break;
                case "/customer/open-account":
                    String type = req.getParameter("accountType");
                    accountService.openAccount(customerId, type);
                    resp.sendRedirect(req.getContextPath() + "/accounts?opened=1");
                    break;
                case "/customer/complaints":
                    String subject = req.getParameter("subject");
                    String message = req.getParameter("message");
                    if (subject == null || message == null || subject.trim().isEmpty() || message.trim().isEmpty()) {
                        req.setAttribute("error", "Subject and message are required.");
                        req.getRequestDispatcher("/complaints.jsp").forward(req, resp);
                        return;
                    }
                    complaintService.createComplaint(userId, subject, message);
                    resp.sendRedirect(req.getContextPath() + "/customer/complaints?created=1");
                    break;
                case "/customer/apply_loan":
                    String loanType = req.getParameter("loanType");
                    BigDecimal amount = new BigDecimal(req.getParameter("amount"));
                    BigDecimal interestRate = new BigDecimal(req.getParameter("interestRate"));
                    int tenureMonths = Integer.parseInt(req.getParameter("tenureMonths"));
                    loanService.applyLoan(userId, customerId, loanType, amount, interestRate, tenureMonths);
                    resp.sendRedirect(req.getContextPath() + "/customer/apply_loan?applied=1");
                    break;
                case "/customer/repay_loan":
                    int loanId = Integer.parseInt(req.getParameter("loanId"));
                    BigDecimal repayAmount = new BigDecimal(req.getParameter("amount"));
                    loanService.repay(userId, loanId, repayAmount);
                    resp.sendRedirect(req.getContextPath() + "/customer/repay_loan?repaid=1");
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid numeric input.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

    private int getCustomerId(int userId, HttpServletRequest req) throws SQLException {
        Customer customer = customerService.getByUserId(userId);
        if (customer == null) {
            throw new IllegalArgumentException("No customer linked to this user");
        }
        return customer.getCustomerId();
    }
}