<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add New Product</h2>

    <form action="admin" method="post">
        <input type="hidden" name="action" value="add">
        Name: <input type="text" name="name" required><br>
        Price: <input type="number" name="price" step="0.01" required><br>
        Description: <input type="text" name="description" required><br>
        Image filename (in /images/): <input type="text" name="image" required><br>
        <button type="submit">Save Product</button>
    </form>

    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
