<%@ page import="java.util.*, com.university.model.CartItem, com.university.model.Product, com.university.model.User, com.university.dao.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="css/style.css">

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CartDAO cartDAO = new CartDAO();
    List<CartItem> cart = cartDAO.getCartByUser(currentUser.getId());

    double total = 0; 
%>



<html>
<head>
    
    
    
    <title>Your Shopping Cart</title>
    

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .page-header {
            background-image: url('<%= request.getContextPath() %>/images/banner/b1.jpg');
            background-size: cover;
            background-position: center;
            height: 250px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .page-header h2 {
            font-size: 50px;
            font-weight: bold;
            margin: 0;
        }

        .page-header p {
            margin: 10px 0 0;
            font-size: 18px;
        }

        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #fafafa;
        }

        img {
            width: 70px;
            height: auto;
            border-radius: 5px;
        }

        .remove-btn {
            background: none;
            border: none;
            color: red;
            font-size: 18px;
            cursor: pointer;
        }

        .total-row td {
            font-weight: bold;
            background: #fafafa;
        }

        .actions {
            text-align: center;
            margin-bottom: 50px;
        }

        .btn {
            background-color: teal;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            margin: 0 10px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>



<!-- Banner -->
<div class="page-header">
    <h2>#cart</h2>
    <p>Add your coupon code & SAVE up to 70%!</p>
</div>

<!-- Cart Table -->
<table>
    <thead>
    <tr>
        <th>Remove</th>
        <th>Image</th>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>
    </thead>
    <tbody>
    <%
        if (!cart.isEmpty()) {
            for (CartItem item : cart) {
                double subtotal = item.getProduct().getPrice() * item.getQuantity();
                total += subtotal;
    %>
        <tr>
            <td>
                <form method="post" action="cart">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                    <button type="submit" class="remove-btn">&#10006;</button>
                </form>

            </td>
            <td>
                <img src="<%= request.getContextPath() + "/images/products/" + item.getProduct().getImage() %>" alt="Product">
            </td>
            <td><%= item.getProduct().getName() %></td>
            <td>$<%= String.format("%.2f", item.getProduct().getPrice()) %></td>
            <td>
    <form method="post" action="cart" style="display: inline;">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" style="width: 60px;" onchange="this.form.submit();">
    </form>
</td>

            <td>$<%= String.format("%.2f", subtotal) %></td>
        </tr>
    <%
            }
    %>
        <tr class="total-row">
            <td colspan="5" style="text-align: right;">Cart Total:</td>
            <td>$<%= String.format("%.2f", total) %></td>
        </tr>
    <%
        } else {
    %>
        <tr>
            <td colspan="6">Your cart is empty.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<!-- Cart Actions -->
<div class="actions">
    <a href="shop" class="btn">Continue Shopping</a>
    <a href="checkout.jsp" class="btn">Proceed to Checkout</a>
</div>


</body>
</html>