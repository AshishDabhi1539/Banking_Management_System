package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.service.AdminService;

@WebServlet(urlPatterns = {
    "/admin/dashboard", "/admin/customers", "/admin/accounts", "/admin/transactions", "/admin/loans", "/admin/complaints", "/admin/logs"
})
public class AdminServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            switch (path) {
                case "/admin/dashboard":
                    req.setAttribute("summary", adminService.getDashboardSummary());
                    req.getRequestDispatcher("/admin_dashboard.jsp").forward(req, resp);
                    break;
                case "/admin/customers":
                    req.setAttribute("customers", adminService.getAllCustomers());
                    req.getRequestDispatcher("/manage_customers.jsp").forward(req, resp);
                    break;
                case "/admin/accounts":
                    req.setAttribute("accounts", adminService.getAllAccounts());
                    req.getRequestDispatcher("/manage_accounts.jsp").forward(req, resp);
                    break;
                case "/admin/transactions":
                    req.setAttribute("transactions", adminService.getAllTransactions());
                    req.getRequestDispatcher("/transactions.jsp").forward(req, resp);
                    break;
                case "/admin/loans":
                    req.setAttribute("loans", adminService.getAllLoans());
                    req.getRequestDispatcher("/loan_approval.jsp").forward(req, resp);
                    break;
                case "/admin/complaints":
                    req.setAttribute("complaints", adminService.getAllComplaints());
                    req.getRequestDispatcher("/complaints.jsp").forward(req, resp);
                    break;
                case "/admin/logs":
                    req.setAttribute("logs", adminService.getRecentActivityLogs(200));
                    req.getRequestDispatcher("/logs.jsp").forward(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

