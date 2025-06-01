package com.university.dao;

import com.university.model.CartItem;
import com.university.model.Order;
import com.university.model.Product;
import com.university.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderDAO {
    public void saveOrder(int userId, List<CartItem> cart) {
        String insertOrderSQL = "INSERT INTO orders(user_id) VALUES (?)";
        String insertItemSQL = "INSERT INTO order_items(order_id, product_id, quantity) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            PreparedStatement orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.executeUpdate();

            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            PreparedStatement itemStmt = conn.prepareStatement(insertItemSQL);
            for (CartItem item : cart) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProduct().getId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();

            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Order> getOrdersByUser(int userId) {
    List<Order> orderList = new ArrayList<>();
    String sql = "SELECT o.id as order_id, o.order_date, " +
                 "p.id as product_id, p.name as product_name, p.price, p.image, oi.quantity " +
                 "FROM orders o " +
                 "JOIN order_items oi ON o.id = oi.order_id " +
                 "JOIN products p ON oi.product_id = p.id " +
                 "WHERE o.user_id = ? ORDER BY o.order_date DESC";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        // Dùng Map để gom nhiều sản phẩm vào 1 đơn hàng
        Map<Integer, Order> orderMap = new HashMap<>();

        while (rs.next()) {
            int orderId = rs.getInt("order_id");

            Order order = orderMap.get(orderId);
            if (order == null) {
                order = new Order();
                order.setId(orderId);
                order.setUserId(userId);
                order.setCreatedAt(rs.getTimestamp("order_date"));
                order.setItems(new ArrayList<>());
                orderMap.put(orderId, order);
            }

            // Tạo đối tượng Product từ kết quả SQL
            Product product = new Product();
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getDouble("price"));
            product.setImage(rs.getString("image"));

            // Gán product + quantity vào CartItem
            CartItem item = new CartItem();
            item.setProduct(product);
            item.setQuantity(rs.getInt("quantity"));

            // Thêm CartItem vào danh sách đơn hàng
            order.getItems().add(item);
        }

        // Trả kết quả đã gom xong
        orderList.addAll(orderMap.values());

    } catch (Exception e) {
        e.printStackTrace();
    }

    return orderList;
}

}
