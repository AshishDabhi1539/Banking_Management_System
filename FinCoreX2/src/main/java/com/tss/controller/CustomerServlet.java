package com.tss.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.model.User;
import com.tss.service.AccountService;
import com.tss.service.AdminService;
import com.tss.service.AuthService;
import com.tss.util.Constants;

@WebServlet(urlPatterns = {
    "/customer/dashboard", "/customer/deposit", "/customer/withdraw", "/customer/transfer", "/customer/open-account"
})
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final AccountService accountService = new AccountService();
    private final AdminService adminService = new AdminService();
    @SuppressWarnings("unused")
	private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            if ("/customer/dashboard".equals(path)) {
                User u = (User) req.getSession().getAttribute(Constants.SESSION_USER);
                if (u == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }
                req.setAttribute("summary", adminService.getDashboardSummary());
                req.getRequestDispatcher("/customer_dashboard.jsp").forward(req, resp);
                return;
            }
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        User u = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (u == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }
        try {
            switch (path) {
                case "/customer/deposit":
                    int accIdD = Integer.parseInt(req.getParameter("accountId"));
                    BigDecimal amtD = new BigDecimal(req.getParameter("amount"));
                    accountService.deposit(u.getUserId(), accIdD, amtD);
                    resp.sendRedirect(req.getContextPath() + "/accounts.jsp?success=1");
                    break;
                case "/customer/withdraw":
                    int accIdW = Integer.parseInt(req.getParameter("accountId"));
                    BigDecimal amtW = new BigDecimal(req.getParameter("amount"));
                    accountService.withdraw(u.getUserId(), accIdW, amtW);
                    resp.sendRedirect(req.getContextPath() + "/accounts.jsp?success=1");
                    break;
                case "/customer/transfer":
                    int fromId = Integer.parseInt(req.getParameter("fromAccountId"));
                    String toAcc = req.getParameter("toAccountNumber");
                    BigDecimal amtT = new BigDecimal(req.getParameter("amount"));
                    accountService.transfer(u.getUserId(), fromId, toAcc, amtT);
                    resp.sendRedirect(req.getContextPath() + "/accounts.jsp?success=1");
                    break;
                case "/customer/open-account":
                    int customerId = Integer.parseInt(req.getParameter("customerId"));
                    String accNo = req.getParameter("accountNumber");
                    String type = req.getParameter("accountType");
                    accountService.openAccount(customerId, accNo, type);
                    resp.sendRedirect(req.getContextPath() + "/accounts.jsp?opened=1");
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

