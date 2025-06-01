<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"admin".equals(currentUser.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fb;
        }

        .top-bar {
            background-color: #00796b;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout-btn {
            background-color: #f44336;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .logout-btn:hover {
            background-color: #d32f2f;
        }

        .admin-dashboard {
            text-align: center;
            padding-top: 40px;
        }

        .admin-dashboard h1 {
            font-size: 38px;
            color: #222;
            margin-bottom: 30px;
        }

        .admin-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px 40px;
        }

        .admin-box {
            width: 220px;
            height: 160px;
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: center;
            align-items: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .admin-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

        .admin-box a {
            text-decoration: none;
            color: #00796b;
            font-weight: bold;
            font-size: 17px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .admin-box a span.emoji {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .admin-box:nth-child(odd) {
            background-color: #e9f5f2;
        }

        .admin-box:nth-child(even) {
            background-color: #fff7e6;
        }
    </style>
</head>
<body>

<div class="top-bar">
    <div><strong>Welcome, <%= currentUser.getName() %></strong></div>
    <div><a href="../logout" class="logout-btn">Logout</a></div>
</div>

<%
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) {
%>
    <p style="color: green; font-weight: bold; text-align: center;">
        ✅ Product added successfully!
    </p>
<%
    }
%>

<div class="admin-dashboard">
    <h1>Admin Dashboard</h1>
    <div class="admin-options">
        <div class="admin-box">
            <a href="add-product.jsp">
                <span class="emoji">➕</span>
                Add Product
            </a>
        </div>
        <div class="admin-box">
            <a href="view-product.jsp">
                <span class="emoji">📘</span>
                View Products
            </a>
        </div>
        <div class="admin-box">
            <a href="orders-product.jsp">
                <span class="emoji">📦</span>
                Orders
            </a>
        </div>
        <div class="admin-box">
            <a href="manage-users.jsp">
                <span class="emoji">👥</span>
                Users
            </a>
        </div>
        <div class="admin-box">
            <a href="add-admin.jsp">
                <span class="emoji">👤➕</span>
                Admin
            </a>
        </div>
    </div>
</div>

</body>
</html>
