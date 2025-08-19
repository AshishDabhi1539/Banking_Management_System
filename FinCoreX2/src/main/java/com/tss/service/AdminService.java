package com.tss.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tss.dao.AccountDAO;
import com.tss.dao.ActivityLogDAO;
import com.tss.dao.ComplaintDAO;
import com.tss.dao.CustomerDAO;
import com.tss.dao.LoanDAO;
import com.tss.dao.TransactionDAO;
import com.tss.model.Account;
import com.tss.model.ActivityLog;
import com.tss.model.Complaint;
import com.tss.model.Customer;
import com.tss.model.Loan;
import com.tss.model.Transaction;

public class AdminService {
    private final CustomerDAO customerDAO = new CustomerDAO();
    private final AccountDAO accountDAO = new AccountDAO();
    private final TransactionDAO transactionDAO = new TransactionDAO();
    private final LoanDAO loanDAO = new LoanDAO();
    private final ComplaintDAO complaintDAO = new ComplaintDAO();
    private final ActivityLogDAO logDAO = new ActivityLogDAO();

    public Map<String, Integer> getDashboardSummary() throws SQLException {
        Map<String, Integer> summary = new HashMap<>();
        summary.put("customers", customerDAO.findAll().size());
        summary.put("accounts", accountDAO.findAll().size());
        summary.put("transactions", transactionDAO.findAll().size());
        summary.put("loans", loanDAO.findAll().size());
        return summary;
    }

    public List<Customer> getAllCustomers() throws SQLException { return customerDAO.findAll(); }
    public List<Account> getAllAccounts() throws SQLException { return accountDAO.findAll(); }
    public List<Transaction> getAllTransactions() throws SQLException { return transactionDAO.findAll(); }
    public List<Loan> getAllLoans() throws SQLException { return loanDAO.findAll(); }
    public List<Complaint> getAllComplaints() throws SQLException { return complaintDAO.findAll(); }
    public List<ActivityLog> getRecentActivityLogs(int limit) throws SQLException { return logDAO.findAll(limit); }
}

