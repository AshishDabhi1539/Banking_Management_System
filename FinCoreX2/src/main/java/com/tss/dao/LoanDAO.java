package com.tss.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tss.database.DBConnection;
import com.tss.model.Loan;

public class LoanDAO {
    public int create(Loan loan) throws SQLException {
        String sql = "INSERT INTO loans (customer_id, loan_type, amount, interest_rate, tenure_months, status) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, loan.getCustomerId());
            ps.setString(2, loan.getLoanType());
            ps.setBigDecimal(3, loan.getAmount() == null ? BigDecimal.ZERO : loan.getAmount());
            ps.setBigDecimal(4, loan.getInterestRate() == null ? BigDecimal.ZERO : loan.getInterestRate());
            ps.setInt(5, loan.getTenureMonths());
            ps.setString(6, loan.getStatus());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    public void updateStatus(int loanId, String status) throws SQLException {
        String sql = "UPDATE loans SET status=? WHERE loan_id=?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, loanId);
            ps.executeUpdate();
        }
    }

    public Loan findById(int id) throws SQLException {
        String sql = "SELECT * FROM loans WHERE loan_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        }
        return null;
    }

    public List<Loan> findByCustomerId(int customerId) throws SQLException {
        String sql = "SELECT * FROM loans WHERE customer_id = ? ORDER BY loan_id DESC";
        List<Loan> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        }
        return list;
    }

    public List<Loan> findAll() throws SQLException {
        String sql = "SELECT * FROM loans ORDER BY loan_id DESC";
        List<Loan> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    private Loan mapRow(ResultSet rs) throws SQLException {
        Loan l = new Loan();
        l.setLoanId(rs.getInt("loan_id"));
        l.setCustomerId(rs.getInt("customer_id"));
        l.setLoanType(rs.getString("loan_type"));
        l.setAmount(rs.getBigDecimal("amount"));
        l.setInterestRate(rs.getBigDecimal("interest_rate"));
        l.setTenureMonths(rs.getInt("tenure_months"));
        l.setStatus(rs.getString("status"));
        l.setAppliedDate(rs.getTimestamp("applied_date"));
        return l;
    }
}

