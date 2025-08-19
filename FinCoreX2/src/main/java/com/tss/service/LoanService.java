package com.tss.service;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import com.tss.dao.ActivityLogDAO;
import com.tss.dao.LoanDAO;
import com.tss.dao.LoanRepaymentDAO;
import com.tss.exception.LoanNotFoundException;
import com.tss.model.ActivityLog;
import com.tss.model.Loan;
import com.tss.model.LoanRepayment;

public class LoanService {
    private final LoanDAO loanDAO = new LoanDAO();
    private final LoanRepaymentDAO repaymentDAO = new LoanRepaymentDAO();
    private final ActivityLogDAO logDAO = new ActivityLogDAO();

    public int applyLoan(int userId, int customerId, String loanType, BigDecimal amount, BigDecimal interestRate, int tenureMonths) throws SQLException {
        Loan loan = new Loan();
        loan.setCustomerId(customerId);
        loan.setLoanType(loanType);
        loan.setAmount(amount);
        loan.setInterestRate(interestRate);
        loan.setTenureMonths(tenureMonths);
        loan.setStatus("PENDING");
        int loanId = loanDAO.create(loan);
        log(userId, "Applied for loan #" + loanId + " (" + loanType + ")");
        return loanId;
    }

    public void approveLoan(int userId, int loanId) throws SQLException {
        ensureLoanExists(loanId);
        loanDAO.updateStatus(loanId, "APPROVED");
        log(userId, "Approved loan #" + loanId);
    }

    public void rejectLoan(int userId, int loanId) throws SQLException {
        ensureLoanExists(loanId);
        loanDAO.updateStatus(loanId, "REJECTED");
        log(userId, "Rejected loan #" + loanId);
    }

    public void closeLoan(int userId, int loanId) throws SQLException {
        ensureLoanExists(loanId);
        loanDAO.updateStatus(loanId, "CLOSED");
        log(userId, "Closed loan #" + loanId);
    }

    public void repay(int userId, int loanId, BigDecimal amount) throws SQLException {
        ensureLoanExists(loanId);
        LoanRepayment r = new LoanRepayment();
        r.setLoanId(loanId);
        r.setAmountPaid(amount);
        repaymentDAO.create(r);
        log(userId, "Repayment for loan #" + loanId + ": " + amount);
    }

    public Loan getLoan(int loanId) throws SQLException {
        Loan l = loanDAO.findById(loanId);
        if (l == null) throw new LoanNotFoundException("Loan not found");
        return l;
    }

    public List<Loan> getLoansByCustomer(int customerId) throws SQLException {
        return loanDAO.findByCustomerId(customerId);
    }

    public List<Loan> getAllLoans() throws SQLException {
        return loanDAO.findAll();
    }

    private void ensureLoanExists(int loanId) throws SQLException {
        if (loanDAO.findById(loanId) == null) {
            throw new LoanNotFoundException("Loan not found");
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

