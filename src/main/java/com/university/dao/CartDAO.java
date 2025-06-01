package com.university.dao;

import com.university.model.CartItem;
import com.university.model.Product;
import com.university.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    public void addToCart(int userId, int productId, int quantity) {
        try (Connection conn = DBConnection.getConnection()) {
            // Kiểm tra sản phẩm đã tồn tại trong giỏ chưa
            String check = "SELECT * FROM cart_items WHERE user_id = ? AND product_id = ?";
            PreparedStatement ps = conn.prepareStatement(check);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // nếu có rồi thì cập nhật số lượng
                String update = "UPDATE cart_items SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(update);
                ps2.setInt(1, quantity);
                ps2.setInt(2, userId);
                ps2.setInt(3, productId);
                ps2.executeUpdate();
            } else {
                String insert = "INSERT INTO cart_items(user_id, product_id, quantity) VALUES (?, ?, ?)";
                PreparedStatement ps3 = conn.prepareStatement(insert);
                ps3.setInt(1, userId);
                ps3.setInt(2, productId);
                ps3.setInt(3, quantity);
                ps3.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CartItem> getCartByUser(int userId) {
        List<CartItem> cart = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM cart_items WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Product product = productDAO.getProductById(productId);
                cart.add(new CartItem(product, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public void removeItem(int userId, int productId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM cart_items WHERE user_id = ? AND product_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clearCart(int userId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM cart_items WHERE user_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateQuantity(int userId, int productId, int quantity) {
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, quantity); // Ghi đè, KHÔNG + thêm
        ps.setInt(2, userId);
        ps.setInt(3, productId);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}




}
