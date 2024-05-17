<%@ page import="com.example.crud_servlet.model.ProductDAO" %>
<%@ page import="com.example.crud_servlet.entity.Product" %>
<%@ page import="com.example.crud_servlet.model.ProductDAOImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Edit Product</h1>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAOImpl();
        Product product = productDAO.getProductById(id);
    %>
    <form action="product?action=update" method="post" class="mt-3">
        <input type="hidden" name="id" value="<%= product.getId() %>">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" class="form-control" value="<%= product.getName() %>" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <input type="text" name="description" id="description" class="form-control" value="<%= product.getDescription() %>" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" name="price" id="price" class="form-control" value="<%= product.getPrice() %>" required>
        </div>
        <button type="submit" class="btn btn-warning">Update Product</button>
        <a href="product?action=list" class="btn btn-secondary">Back to Product List</a>
    </form>
</div>
</body>
</html>
