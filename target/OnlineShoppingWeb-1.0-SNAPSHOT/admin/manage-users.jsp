<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ page import="com.university.dao.UserDAO" %>
<%@ page import="java.util.List" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"admin".equals(currentUser.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    List<User> userList = new UserDAO().getAllUsers();
%>
<html>
<head>
    <title>Manage Users - Admin View</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6fb;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #222;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #00796b;
            color: white;
        }

        .btn {
            padding: 6px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.2s ease-in-out;
            margin: 2px;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .toggle-btn {
            background-color: #007bff;
            color: white;
        }

        .toggle-btn:hover {
            background-color: #0056b3;
        }

        .back-btn {
            display: block;
            margin: 30px auto 0;
            text-align: center;
            text-decoration: none;
            background-color: #00796b;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            width: fit-content;
        }

        .back-btn:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
<h2>All Users</h2>
<table>
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Active</th>
        <th>Action</th>
    </tr>
    <%
        for (User u : userList) {
    %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getName() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getRole() %></td>
        <td><%= u.isActive() ? "Yes" : "No" %></td>
        <td>
            <form action="../toggle-user" method="post">
                <input type="hidden" name="id" value="<%= u.getId() %>" />
                <button type="submit" class="btn toggle-btn">
                <%= u.isActive() ? "Deactivate" : "Activate" %>
                </button>
            </form>

            <form action="../delete-user" method="post" style="display:inline-block" onsubmit="return confirm('Are you sure you want to delete this user?');">
                <input type="hidden" name="id" value="<%= u.getId() %>" />
                <button type="submit" class="btn delete-btn">🗑️ Delete</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="dashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</body>
</html>
