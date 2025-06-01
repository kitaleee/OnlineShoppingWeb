<%@ page import="java.util.List" %>
<%@ page import="com.university.model.CartItem, com.university.model.User, com.university.dao.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = currentUser;

    CartDAO cartDAO = new CartDAO();
    List<CartItem> cart = cartDAO.getCartByUser(currentUser.getId());
    double total = 0;
%>
<html>
<head>
    <title>Edit Profile</title>
    

    <style>
      body {
    font-family: Arial;
    background: #f0f0f0;
    padding: 40px;
    }

    .container {
        background: #fff;
        padding: 50px;
        max-width: 700px;
        margin: auto;
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(0,0,0,0.15);
    }

    h2 {
        text-align: center;
        font-size: 28px;
        margin-bottom: 30px;
    }

    input, select, label {
        display: block;
        width: 100%;
        font-size: 18px;
        margin-bottom: 20px;
    }

    input, select {
        padding: 12px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    .actions {
        text-align: center;
        margin-top: 30px;
    }

    .btn {
        background: #00796b;
        color: white;
        border: none;
        padding: 12px 30px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        margin: 0 10px;
        transition: background 0.2s ease;
    }

    .btn:hover {
        background: #004d40;
    }

    .btn.cancel {
        background: #757575;
    }

    .btn.cancel:hover {
        background: #5e5e5e;
    }

    </style>
</head>
<body>

<div class="container">
    <h2>Edit Your Profile</h2>
    <form action="update-profile" method="post">
        <label>Full Name</label>
        <input type="text" name="name" value="<%= currentUser.getName() %>" required>

        <label>Date of Birth</label>
        <input type="date" name="dob" value="<%= currentUser.getDob() != null ? currentUser.getDob() : "" %>">

        <label>Gender</label>
        <select name="gender">
            <option value="">-- Select --</option>
            <option value="male" <%= "male".equals(currentUser.getGender()) ? "selected" : "" %>>Male</option>
            <option value="female" <%= "female".equals(currentUser.getGender()) ? "selected" : "" %>>Female</option>
            <option value="other" <%= "other".equals(currentUser.getGender()) ? "selected" : "" %>>Other</option>
        </select>

        <label>New Password</label>
        <input type="password" name="password" placeholder="Leave blank to keep current">

        <div class="actions">
            <button class="btn" type="submit">Save Changes</button>
            <a href="profile.jsp" class="btn cancel">Cancel</a>
        </div>
    </form>
</div>


</body>
</html>
