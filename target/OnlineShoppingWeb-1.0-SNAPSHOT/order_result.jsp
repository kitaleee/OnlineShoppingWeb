<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List, com.university.model.CartItem, com.university.model.Product" %>
<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    String message = (String) request.getAttribute("message");
%>
<html>
<head>
    <title>Order Result</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 30px; }
        .container { background: #fff; padding: 30px; max-width: 800px; margin: auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border-bottom: 1px solid #ddd; text-align: center; }
        th { background-color: #f2f2f2; }
        img { width: 60px; }
        .message { color: red; font-weight: bold; text-align: center; margin: 20px 0; }
    </style>
</head>
<body>
<div class="container">
    <h2>Order Result</h2>

    <% if (message != null) { %>
        <p class="message"><%= message %></p>
    <% } else if (cartItems != null) { %>
        <p>Thank you for your purchase! Here is your order summary:</p>

        <table>
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
            <%
                double total = 0;
                for (CartItem item : cartItems) {
                    Product product = item.getProduct();
                    int quantity = item.getQuantity();
                    double subtotal = product.getPrice() * quantity;
                    total += subtotal;
            %>
            <tr>
                <td><img src="images/products/<%= product.getImage() %>" /></td>
                <td><%= product.getName() %></td>
                <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                <td><%= quantity %></td>
                <td>$<%= String.format("%.2f", subtotal) %></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="4" style="text-align: right;"><strong>Total:</strong></td>
                <td><strong>$<%= String.format("%.2f", total) %></strong></td>
            </tr>
        </table>
    <% } else { %>
        <p class="message">Something went wrong. Please try again.</p>
    <% } %>

    <div style="text-align: center; margin-top: 30px;">
        <a href="home" style="margin-right: 20px;">Back to Home</a>
        <a href="shop">Continue Shopping</a>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
