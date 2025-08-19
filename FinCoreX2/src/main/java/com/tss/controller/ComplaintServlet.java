package com.tss.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tss.model.User;
import com.tss.service.ComplaintService;
import com.tss.util.Constants;

@WebServlet(urlPatterns = { "/complaint/create", "/complaint/update-status" })
public class ComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final ComplaintService complaintService = new ComplaintService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        User u = (User) req.getSession().getAttribute(Constants.SESSION_USER);
        if (u == null) { resp.sendRedirect(req.getContextPath() + "/login.jsp"); return; }
        try {
            switch (path) {
                case "/complaint/create":
                    int customerId = Integer.parseInt(req.getParameter("customerId"));
                    String subject = req.getParameter("subject");
                    String message = req.getParameter("message");
                    complaintService.createComplaint(u.getUserId(), customerId, subject, message);
                    resp.sendRedirect(req.getContextPath() + "/complaints.jsp?created=1");
                    break;
                case "/complaint/update-status":
                    int complaintId = Integer.parseInt(req.getParameter("complaintId"));
                    String status = req.getParameter("status");
                    complaintService.updateStatus(u.getUserId(), complaintId, status);
                    resp.sendRedirect(req.getContextPath() + "/complaints.jsp?updated=1");
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}

