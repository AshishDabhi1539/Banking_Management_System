package com.tss.service;

import java.sql.SQLException;
import java.util.List;

import com.tss.dao.ActivityLogDAO;
import com.tss.dao.ComplaintDAO;
import com.tss.exception.ComplaintNotFoundException;
import com.tss.model.ActivityLog;
import com.tss.model.Complaint;

public class ComplaintService {
    private final ComplaintDAO complaintDAO = new ComplaintDAO();
    private final ActivityLogDAO logDAO = new ActivityLogDAO();

    public int createComplaint(int userId, int customerId, String subject, String message) throws SQLException {
        Complaint c = new Complaint();
        c.setCustomerId(customerId);
        c.setSubject(subject);
        c.setMessage(message);
        c.setStatus("OPEN");
        int id = complaintDAO.create(c);
        log(userId, "Complaint raised #" + id + ": " + subject);
        return id;
    }

    public void updateStatus(int userId, int complaintId, String status) throws SQLException {
        ensureExists(complaintId);
        complaintDAO.updateStatus(complaintId, status);
        log(userId, "Complaint #" + complaintId + " status updated to " + status);
    }

    public Complaint get(int complaintId) throws SQLException {
        Complaint c = complaintDAO.findById(complaintId);
        if (c == null) throw new ComplaintNotFoundException("Complaint not found");
        return c;
    }

    public List<Complaint> findByCustomer(int customerId) throws SQLException {
        return complaintDAO.findByCustomerId(customerId);
    }

    public List<Complaint> findAll() throws SQLException {
        return complaintDAO.findAll();
    }

    private void ensureExists(int id) throws SQLException {
        if (complaintDAO.findById(id) == null) {
            throw new ComplaintNotFoundException("Complaint not found");
        }
    }

    private void log(int userId, String action) {
        try {
            ActivityLog l = new ActivityLog();
            l.setUserId(userId);
            l.setAction(action);
            logDAO.create(l);
        } catch (SQLException ignored) {
        }
    }
}

