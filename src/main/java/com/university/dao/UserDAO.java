package com.university.dao;

import com.university.model.User;
import com.university.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            boolean active = rs.getBoolean("is_active");
            if (!active) {
               
                User user = new User();
                user.setEmail(email);
                user.setActive(false); 
                return user;
            }

            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setDob(rs.getString("dob"));
            user.setGender(rs.getString("gender"));
            user.setActive(true); 
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
       public User validateAdmin(String email, String password) {
    String sql = "SELECT * FROM user WHERE email=? AND password=? AND role='admin'";
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
            return user;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

       public void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void toggleUserStatus(int id) {
    String sql = "UPDATE users SET is_active = NOT is_active WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setDob(rs.getString("dob"));
                u.setGender(rs.getString("gender"));
                u.setActive(rs.getBoolean("is_active"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
}
    
    public void insertUser(User user) {
    String sql = "INSERT INTO users (name, email, password, role, is_active) VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, user.getName());
        stmt.setString(2, user.getEmail());
        stmt.setString(3, user.getPassword());
        stmt.setString(4, user.getRole());
        stmt.setBoolean(5, user.isActive());

        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    
}


  

