<%@ page import="com.example.crud_servlet.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Product List</h1>
    <a href="product?action=new" class="btn btn-success mb-3">Add New Product</a>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            for (Product product : products) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td>
                <a href="product?action=edit&id=<%= product.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="product?action=delete&id=<%= product.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <p>Total Products: <%= products.size() %></p>
    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
</div>
</body>
</html>
