package com.tss.service;

import java.sql.SQLException;
import java.util.List;

import com.tss.dao.ActivityLogDAO;
import com.tss.dao.CustomerDAO;
import com.tss.model.ActivityLog;
import com.tss.model.Customer;

public class CustomerService {
    private final CustomerDAO customerDAO = new CustomerDAO();
    private final ActivityLogDAO logDAO = new ActivityLogDAO();

    public int create(int userId, Customer c) throws SQLException {
        int id = customerDAO.create(c);
        c.setCustomerId(id);
        log(userId, "Created customer #" + id + " (" + c.getFullName() + ")");
        return id;
    }

    public void update(int userId, Customer c) throws SQLException {
        customerDAO.update(c);
        log(userId, "Updated customer #" + c.getCustomerId());
    }

    public void delete(int userId, int customerId) throws SQLException {
        customerDAO.delete(customerId);
        log(userId, "Deleted customer #" + customerId);
    }

    public Customer get(int id) throws SQLException { return customerDAO.findById(id); }
    public Customer getByUserId(int userId) throws SQLException { return customerDAO.findByUserId(userId); }
    public List<Customer> getAll() throws SQLException { return customerDAO.findAll(); }

    private void log(int userId, String action) {
        try {
            ActivityLog l = new ActivityLog();
            l.setUserId(userId);
            l.setAction(action);
            logDAO.create(l);
        } catch (SQLException ignored) { }
    }
}

