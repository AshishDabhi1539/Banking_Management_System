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

@WebServlet(urlPatterns = { "/admin/account/status" })
public class AccountAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User admin = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (admin == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }
        int accountId = Integer.parseInt(req.getParameter("accountId"));
        String status = req.getParameter("status");
        try {
            accountDAO.updateStatus(accountId, status);
            resp.sendRedirect(req.getContextPath() + "/admin/accounts?updated=1");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

