package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.model.Customer;
import com.tss.model.User;
import com.tss.service.CustomerService;
import com.tss.util.Constants;

@WebServlet(urlPatterns = { "/admin/customer/create", "/admin/customer/update", "/admin/customer/delete" })
public class CustomerAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        User admin = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (admin == null) { 
            resp.sendRedirect(req.getContextPath() + "/login.jsp"); 
            return; 
        }
        try {
            switch (path) {
                case "/admin/customer/create":
                    Customer c = new Customer();
                    c.setUserId(Integer.parseInt(req.getParameter("userId")));
                    c.setFullName(req.getParameter("fullName"));
                    c.setEmail(req.getParameter("email"));
                    c.setPhone(req.getParameter("phone"));
                    c.setAddress(req.getParameter("address"));
                    c.setAadharNo(req.getParameter("aadhar"));
                    c.setPanNo(req.getParameter("pan"));
                    customerService.create(c); // No accountNumber needed here
                    resp.sendRedirect(req.getContextPath() + "/admin/customers?created=1");
                    break;
                case "/admin/customer/update":
                    Customer u = new Customer();
                    u.setCustomerId(Integer.parseInt(req.getParameter("customerId")));
                    u.setFullName(req.getParameter("fullName"));
                    u.setEmail(req.getParameter("email"));
                    u.setPhone(req.getParameter("phone"));
                    u.setAddress(req.getParameter("address"));
                    u.setAadharNo(req.getParameter("aadhar"));
                    u.setPanNo(req.getParameter("pan"));
                    customerService.update(admin.getUserId(), u);
                    resp.sendRedirect(req.getContextPath() + "/admin/customers?updated=1");
                    break;
                case "/admin/customer/delete":
                    int customerId = Integer.parseInt(req.getParameter("customerId"));
                    customerService.delete(admin.getUserId(), customerId);
                    resp.sendRedirect(req.getContextPath() + "/admin/customers?deleted=1");
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}