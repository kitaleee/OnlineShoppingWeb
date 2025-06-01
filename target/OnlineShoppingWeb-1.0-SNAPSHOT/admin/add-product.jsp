<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"admin".equals(currentUser.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    String errorMsg = (String) session.getAttribute("errorMsg");
    if (errorMsg != null) {
        session.removeAttribute("errorMsg");
    }
%>
<html>
<head>
    <title>Add Product</title>
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
        .form-container input,
        .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 6px;
        }
        .form-container input {
            border: 1px solid #ccc;
        }
        .form-container button {
            background-color: #00796b;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #005f56;
        }
        .form-container p.error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .form-container .back-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #00796b;
            font-weight: bold;
        }
        .form-container .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Product</h2>
    <% if (errorMsg != null) { %>
        <p class="error"><%= errorMsg %></p>
    <% } %>
    <form method="post" action="../upload-product" enctype="multipart/form-data">
        <input type="text" name="name" placeholder="Product Name" required />
        <input type="text" name="description" placeholder="Description" required />
        <input type="number" name="price" step="0.01" placeholder="Price" required />
        <input type="file" name="image" accept="image/*" required />
        <button type="submit">➕ Add Product</button>
    </form>
    <a href="dashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
</div>
</body>
</html>
