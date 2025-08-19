package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.dao.AccountDAO;
import com.tss.model.User;
import com.tss.util.Constants;

@WebServlet(urlPatterns = { "/admin/account/status", "/admin/account/update" })
public class AccountAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User admin = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (admin == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }
        String path = req.getServletPath();
        try {
            switch (path) {
                case "/admin/account/status": {
                    int accountId = Integer.parseInt(req.getParameter("accountId"));
                    String status = req.getParameter("status");
                    accountDAO.updateStatus(accountId, status);
                    resp.sendRedirect(req.getContextPath() + "/admin/accounts?updated=1");
                    break;
                }
                case "/admin/account/update": {
                    int accountId = Integer.parseInt(req.getParameter("accountId"));
                    String accountNumber = req.getParameter("accountNumber");
                    String accountType = req.getParameter("accountType");
                    accountDAO.updateDetails(accountId, accountNumber, accountType);
                    resp.sendRedirect(req.getContextPath() + "/admin/accounts?updated=1");
                    break;
                }
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

