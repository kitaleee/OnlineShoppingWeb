package com.university.dao;

import com.university.model.Product;
import com.university.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getString("image")
                );
                productList.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
    
    public Product getProductById(int id) {
    String sql = "SELECT * FROM products WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Product(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getString("description"),
                rs.getString("image")
            );
        }

    } catch (Exception e) {
        e.printStackTrace();
        }

    return null;
    }
    
    public void insertProduct(Product p) {
    String sql = "INSERT INTO products(name, price, description, image) VALUES (?, ?, ?, ?)";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, p.getName());
        stmt.setDouble(2, p.getPrice());
        stmt.setString(3, p.getDescription());
        stmt.setString(4, p.getImage());
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    public void deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Product> getFeaturedProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY id ASC LIMIT 4";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getString("image")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getNewArrivals() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY id DESC LIMIT 4";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getString("image")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean addProduct(Product product) {
    boolean result = false;
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "INSERT INTO products (name, price, description, image) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, product.getName());
        stmt.setDouble(2, product.getPrice());
        stmt.setString(3, product.getDescription());
        stmt.setString(4, product.getImage());

        int rowsInserted = stmt.executeUpdate();
        result = rowsInserted > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}
public boolean updateProduct(Product product) {
    boolean result = false;
    String sql = "UPDATE products SET name = ?, description = ?, price = ?, image = ? WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, product.getName());
        stmt.setString(2, product.getDescription());
        stmt.setDouble(3, product.getPrice());
        stmt.setString(4, product.getImage());
        stmt.setInt(5, product.getId());

        int rows = stmt.executeUpdate();
        result = (rows > 0);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

public boolean deleteProductByAdmin(int id) {
    String sql = "DELETE FROM products WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, id);
        int rows = stmt.executeUpdate();
        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

}





