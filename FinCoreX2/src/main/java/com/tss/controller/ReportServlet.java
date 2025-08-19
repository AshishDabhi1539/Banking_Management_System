package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.service.AdminService;

@WebServlet(urlPatterns = { "/admin/reports" })
public class ReportServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("customers", adminService.getAllCustomers());
            req.setAttribute("accounts", adminService.getAllAccounts());
            req.setAttribute("loans", adminService.getAllLoans());
            req.setAttribute("complaints", adminService.getAllComplaints());
            req.getRequestDispatcher("/reports.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

