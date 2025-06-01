<section id="header">
    <a href="index.jsp"><img src="images/logo.png" class="logo" alt="Logo" width="100"></a>
    <ul id="navbar">
        <li><a class="active" href="home">Home</a></li>
        <li><a href="shop">Shop</a></li>
        <li><a href="blog.jsp">Blog</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="cart.jsp">Cart</a></li>
      <%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser != null) {
%>
    <li><a href="profile.jsp">Profile</a></li>
    <li><a href="logout">Logout (<%= currentUser.getName() %>)</a></li>

            <% if ("admin".equals(currentUser.getRole())) { %>
                <li><a href="admin">Admin</a></li>
            <% } %>
        <%
            } else {
        %>
            <li><a href="login.jsp">Login</a></li>
        <% } %>
    </ul>
</section>