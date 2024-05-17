package com.example.crud_servlet.model;

import com.example.crud_servlet.entity.Product;

import java.util.List;

public interface ProductDAO {
    public List<Product> getAllProducts();
    public void addProduct(Product product);
    Product getProductById(int id);
    public void updateProduct(Product product);
    public void deleteProduct(int id);


}
