package com.university.dao;

import com.university.model.User;
import com.university.util.DBConnection;

import java.sql.*;

public class UserDAO {
    
    public User getUserById(int id) {
    String sql = "SELECT * FROM users WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setDob(rs.getString("dob"));
            user.setGender(rs.getString("gender"));
            return user;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}


    public User getUserByEmailAndPassword(String email, String password) {
    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setDob(rs.getString("dob"));      
            user.setGender(rs.getString("gender")); 
            return user;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}


    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void updateProfile(User user) {
    String sql = "UPDATE users SET name = ?, dob = ?, gender = ?, password = ? WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, user.getName());
        stmt.setString(2, user.getDob());
        stmt.setString(3, user.getGender());
        stmt.setString(4, user.getPassword());
        stmt.setInt(5, user.getId());

        stmt.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}


}


  

