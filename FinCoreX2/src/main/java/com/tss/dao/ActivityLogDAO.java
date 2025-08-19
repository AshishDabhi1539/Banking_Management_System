package com.tss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tss.database.DBConnection;
import com.tss.model.ActivityLog;

public class ActivityLogDAO {
    public int create(ActivityLog log) throws SQLException {
        String sql = "INSERT INTO activity_logs (user_id, action) VALUES (?,?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, log.getUserId());
            ps.setString(2, log.getAction());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    public List<ActivityLog> findAll(int limit) throws SQLException {
        String sql = "SELECT * FROM activity_logs ORDER BY log_id DESC LIMIT ?";
        List<ActivityLog> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        }
        return list;
    }

    private ActivityLog mapRow(ResultSet rs) throws SQLException {
        ActivityLog l = new ActivityLog();
        l.setLogId(rs.getInt("log_id"));
        l.setUserId(rs.getInt("user_id"));
        l.setAction(rs.getString("action"));
        l.setLogDate(rs.getTimestamp("log_date"));
        return l;
    }
}

