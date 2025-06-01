<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Shop</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .shop-banner {
            width: 100%;
            background: url('images/banner/b1.jpg') center/cover no-repeat;
            color: #ffffff;
            padding: 100px 0;
            text-align: center;
            position: relative;
        }

        .shop-banner::after {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0, 0, 0, 0.45);
            z-index: 1;
        }

        .shop-banner h2,
        .shop-banner p {
            position: relative;
            z-index: 2;
            color: #ffffff;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.9);
        }

        .shop-banner h2 {
            font-size: 48px;
            font-weight: bold;
            margin: 0;
        }

        .shop-banner p {
            font-size: 18px;
            margin-top: 10px;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            padding: 40px 60px;
            background: #f9f9f9;
            padding-bottom: 100px; /* thêm khoảng trống để footer không đè lên */
            min-height: 500px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            width: 250px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-bottom: 20px; /* tránh dính sát footer */
        }

        .product-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .product-card h3 {
            margin: 15px 0 10px;
            font-size: 20px;
        }

        .product-card p {
            margin: 5px 0;
        }

        .product-card form {
            margin-top: 15px;
        }

        .product-card input[type="number"] {
            width: 60px;
            padding: 5px;
            margin-right: 10px;
        }

        .product-card button {
            background-color: #00796b;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        .product-card button:hover {
            background-color: #004d40;
        }

        @media (max-width: 768px) {
            .product-grid {
                padding: 20px;
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

<div class="shop-banner">
    <h2>#stayhome</h2>
    <p>Save more with coupons & up to 70% off!</p>
</div>

<div class="product-grid">
    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        if (productList != null) {
            for (Product p : productList) {
    %>
    <div class="product-card">
        <img src="<%= request.getContextPath() %>/images/products/<%= p.getImage() %>" alt="Product">

        <h3><%= p.getName() %></h3>
        <p>$<%= p.getPrice() %></p>
        <p><%= p.getDescription() %></p>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <input type="number" name="quantity" value="1" min="1">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
    <%
            }
        } else {
    %>
        <p>No products available.</p>
    <%
        }
    %>
</div>

<div style="text-align: center; margin-top: 60px;">
    <a href="home" style="
        display: inline-block;
        padding: 10px 20px;
        background-color: #00796b;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
    ">Back to Home</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
