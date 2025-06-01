<%@ page import="java.util.*, com.university.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard – Product Management</h2>

    <form action="admin" method="post">
        <input type="hidden" name="action" value="add">
        Name: <input type="text" name="name" required><br>
        Price: <input type="number" name="price" step="0.01" required><br>
        Desc: <input type="text" name="description" required><br>
        Image: <input type="text" name="image" required><br>
        <button type="submit">Add Product</button>
    </form>

    <hr>

    <table border="1" cellpadding="10">
        <tr><th>ID</th><th>Name</th><th>Price</th><th>Action</th></tr>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            for (Product p : products) {
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td>$<%= p.getPrice() %></td>
                <td>
                    <form action="admin" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= p.getId() %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
