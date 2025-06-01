<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ page import="com.university.dao.ProductDAO" %>
<%@ page import="com.university.model.Product" %>
<%@ page import="java.util.List" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"admin".equals(currentUser.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<Product> productList = new ProductDAO().getAllProducts();
%>
<html>
<head>
    <title>All Products - Admin View</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fb;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #222;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #00796b;
            color: white;
        }

        img {
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
        }

        .btn {
            padding: 6px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.2s ease-in-out;
            margin: 2px;
        }

        .edit-btn {
            background-color: #ffc107;
            color: #222;
        }

        .edit-btn:hover {
            background-color: #e0a800;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .back-btn {
            display: block;
            margin: 30px auto 0;
            text-align: center;
            text-decoration: none;
            background-color: #00796b;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            width: fit-content;
        }

        .back-btn:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
<h2>All Products</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    <%
        for (Product p : productList) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getName() %></td>
        <td>$<%= p.getPrice() %></td>
        <td><%= p.getDescription() %></td>
        <td>
            <img src="<%= request.getContextPath() %>/images/products/<%= p.getImage() %>" alt="<%= p.getName() %>">
        </td>
        <td>
            <a href="edit-product.jsp?id=<%= p.getId() %>" class="btn edit-btn">✏️ Edit</a>
            <form action="../delete-product" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <button type="submit" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this product?');">🗑️ Delete</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="dashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</body>
</html>
