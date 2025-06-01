<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.university.model.User, java.util.List, com.university.dao.CartDAO, com.university.model.CartItem, com.university.model.Product" %>


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
    <title>Checkout</title>
    

    <style>
        body { font-family: Arial; background: #f4f4f4; padding: 30px; }
        .container { background: #fff; padding: 30px; max-width: 900px; margin: auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }

        h2 { text-align: center; margin-bottom: 30px; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }

        img {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }

        label { display: block; margin-top: 10px; font-weight: bold; }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .cards img { height: 30px; margin: 5px 10px 10px 0; }

        .total {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }

        .submit-btn {
            background-color: teal;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Order Summary</h2>

    <table>
        <thead>
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartItem item : cart) {
                Product product = item.getProduct();
                double subtotal = product.getPrice() * item.getQuantity();
                total += subtotal;
        %>
            <tr>
                <td><img src="<%= request.getContextPath() + "/images/products/" + product.getImage() %>" alt="Product Image"></td>
                <td><%= product.getName() %></td>
                <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= String.format("%.2f", subtotal) %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="total">
        Total: $<%= String.format("%.2f", total) %>
    </div>

    <h2>Payment Information</h2>
    <form method="post" action="order">
        <div class="cards">
            <label>Payment Method:</label>
            <img src="images/pay/visa.png" alt="Visa">
            <img src="images/pay/mastercard.png" alt="MasterCard">
            <img src="images/pay/jcb.png" alt="JCB">
            <img src="images/pay/amex.png" alt="Amex">
        </div>

        <label>Card Number *</label>
        <input type="text" name="card_number" required placeholder="1234 5678 9012 3456">

        <label>Expiry Date *</label>
        <input type="text" name="expiry" required placeholder="MM/YY">

        <label>CVV *</label>
        <input type="text" name="cvv" required placeholder="3 digits">

        <label>Cardholder Name *</label>
        <input type="text" name="card_name" required placeholder="Full name as shown on card">

        <button type="submit" class="submit-btn">Confirm Payment</button>
    </form>
</div>

</body>
</html>
