<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ page import="com.university.dao.OrderDAO" %>
<%@ page import="com.university.model.Order" %>
<%@ page import="com.university.model.CartItem" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Lấy danh sách đơn hàng
    OrderDAO orderDAO = new OrderDAO();
    List<Order> orderList = orderDAO.getOrdersByUser(user.getId());
%>
<html>
<head>
    <title>User Profile</title>
    

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 30px;
        }

        .profile-container {
            background: #fff;
            max-width: 900px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-item {
            margin-bottom: 15px;
            font-size: 18px;
        }

        .label {
            font-weight: bold;
        }

        .actions {
            margin-top: 30px;
            text-align: center;
        }

        .actions a {
            text-decoration: none;
            padding: 10px 20px;
            background: #00796b;
            color: white;
            border-radius: 6px;
            margin: 0 5px;
        }

        .actions a:hover {
            background: #004d40;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
        }

        .order-header {
            background-color: #e0f7fa;
            font-weight: bold;
        }

        img.product-img {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <h2>Your Profile</h2>
    <div class="profile-item"><span class="label">Full Name:</span> <%= user.getName() %></div>
    <div class="profile-item"><span class="label">Email:</span> <%= user.getEmail() %></div>
    <div class="profile-item"><span class="label">Date of Birth:</span> <%= user.getDob() != null ? user.getDob() : "Not Provided" %></div>
    <div class="profile-item"><span class="label">Gender:</span> <%= user.getGender() != null ? user.getGender() : "Not Selected" %></div>

    <div class="actions">
        <a href="home">Back to Home</a>
        <a href="edit-profile.jsp">Edit Profile</a>
        <a href="logout">Logout</a>
    </div>
</div>

<!-- Lịch sử đơn hàng -->
<div class="profile-container" style="margin-top: 40px;">
    <h2>Order History</h2>
<%
    if (orderList != null && !orderList.isEmpty()) {
        for (Order order : orderList) {
%>
        <table>
            <tr class="order-header">
                <td colspan="6">Order ID: <%= order.getId() %> | Date: <%= order.getCreatedAt() %></td>
            </tr>
            <tr>
                <th>Product</th>
                <th>Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
<%
            double total = 0;
            for (CartItem item : order.getItems()) {
                double subtotal = item.getProduct().getPrice() * item.getQuantity();
                total += subtotal;
                String image = item.getProduct().getImage();
                if (image == null || image.trim().isEmpty()) image = "default.jpg";
%>
            <tr>
                <td><%= item.getProduct().getName() %></td>
                <td><img class="product-img" src="images/products/<%= image %>" alt="product image"></td>
                <td>$<%= item.getProduct().getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= subtotal %></td>
            </tr>
<%
            }
%>
            <tr>
                <td colspan="4" style="text-align: right;"><strong>Total:</strong></td>
                <td><strong>$<%= total %></strong></td>
            </tr>
        </table>
        <br>
<%
        }
    } else {
%>
    <p>You have no orders yet.</p>
<%
    }
%>
</div>

</body>
</html>
