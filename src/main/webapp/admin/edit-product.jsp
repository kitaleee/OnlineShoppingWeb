<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.dao.ProductDAO" %>
<%@ page import="com.university.model.Product" %>
<%@ page import="com.university.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"admin".equals(currentUser.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("view-product.jsp");
        return;
    }
    int id = Integer.parseInt(idStr);
    Product product = new ProductDAO().getProductById(id);
    if (product == null) {
        response.sendRedirect("view-product.jsp");
        return;
    }
%>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 420px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #00796b;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #005f56;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit Product</h2>
   <form action="../update-product" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="<%= product.getId() %>" />
        <input type="hidden" name="oldImage" value="<%= product.getImage() %>" />
        <input type="text" name="name" value="<%= product.getName() %>" placeholder="Product Name" required />
        <input type="text" name="description" value="<%= product.getDescription() %>" placeholder="Description" required />
        <input type="number" name="price" step="0.01" value="<%= product.getPrice() %>" placeholder="Price" required />
        <button type="submit">Update Product</button>
    </form>

</div>
</body>
</html>
