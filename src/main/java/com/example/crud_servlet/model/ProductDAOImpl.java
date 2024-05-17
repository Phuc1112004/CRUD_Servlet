package com.example.crud_servlet.model;

import com.example.crud_servlet.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO{
    private  static final Connection conn;

    static {
        try {
            conn = DBConnect.getMySQLConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price")
                );
                products.add(product);
            }

            // Đóng ResultSet và Statement sau khi sử dụng
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }




    public void addProduct(Product product) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO products (name, description, price) VALUES (?, ?, ?)");
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(int id) {
        Product product = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    public void updateProduct(Product product) {
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE products SET name = ?, description = ?, price = ? WHERE id = ?");
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
