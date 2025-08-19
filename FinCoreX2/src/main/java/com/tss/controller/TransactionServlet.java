package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.dao.TransactionDAO;
import com.tss.model.Transaction;

@WebServlet(urlPatterns = { "/transactions/account" })
public class TransactionServlet extends HttpServlet {
    private final TransactionDAO transactionDAO = new TransactionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accountId = Integer.parseInt(req.getParameter("accountId"));
            int limit = 50;
            try {
                limit = Integer.parseInt(req.getParameter("limit"));
            } catch (Exception ignored) {}
            List<Transaction> list = transactionDAO.findByAccountId(accountId, limit);
            req.setAttribute("transactions", list);
            req.getRequestDispatcher("/statements.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

