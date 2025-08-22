// src/main/java/com/tss/controller/StatementServlet.java

package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.dao.TransactionDAO;
import com.tss.model.User;
import com.tss.service.AccountService;
import com.tss.util.Constants;

@WebServlet(urlPatterns = { "/customer/statements" })
public class StatementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final TransactionDAO transactionDAO = new TransactionDAO();
    private final AccountService accountService = new AccountService(); // ✅ Initialized

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String accountIdStr = req.getParameter("accountId");
        try {
            if (accountIdStr != null && !accountIdStr.isEmpty()) {
                int accountId = Integer.parseInt(accountIdStr);

                // ✅ Ownership check
                accountService.getAccount(accountId, user.getUserId());

                // Fetch transactions
                req.setAttribute("transactions", transactionDAO.findByAccountId(accountId, 50));
            }
            req.getRequestDispatcher("/statements.jsp").forward(req, resp);
        } catch (SQLException e) {
            req.setAttribute("error", "Failed to load statements: " + e.getMessage());
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid Account ID.");
            req.getRequestDispatcher("/statements.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp); // Reuse doGet logic
    }
}