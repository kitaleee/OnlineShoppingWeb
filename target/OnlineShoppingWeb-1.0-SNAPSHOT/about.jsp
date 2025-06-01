<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>About Us – Online Shopping Web</title>

    <!-- Font Awesome (for any icons) -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <!-- Your custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <!-- Header (copied from index.jsp) -->
    <section id="header">
        <a href="index.jsp">
            <img src="images/logo.png?v=2" class="logo" alt="Logo" width="100">
        </a>
        <ul id="navbar">
            <li><a href="home">Home</a></li>
            <li><a href="shop">Shop</a></li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a class="active" href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <%
                User currentUser = (User) session.getAttribute("currentUser");
                if (currentUser != null) {
            %>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="logout">Logout (<%= currentUser.getName() %>)</a></li>
            <%
                    if ("admin".equals(currentUser.getRole())) {
            %>
            <li><a href="admin">Admin</a></li>
            <%
                    }
                } else {
            %>
            <li><a href="login.jsp">Login</a></li>
            <%
                }
            %>
        </ul>
    </section>

    <!-- Page Header for About -->
    <section id="page-header" class="about-header section-p1">
        <h2>#KnowMoreAboutUs</h2>
        <p>Pain itself is love, it is the principal component of pure difference</p>
    </section>

    <!-- About Head Section -->
    <section id="about-head" class="section-p1">
        <!-- Make sure this image exists at: webapp/images/about/a6.jpg -->
        <img src="images/about/a6.jpg" alt="About Us Image">
        <div>
            <h2>Who We Are?</h2>
            <p>
                Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain.
            </p><br>
            <marquee bgcolor="#ccc" loop="-1" scrollamount="5" width="100%">
                Create stunning images with as much or as little control as you like thanks to a choice
                of Basic and Creative modes.
            </marquee>
        </div>
    </section>

    <!-- About App Section -->
    <section id="about-app" class="section-p1">
        <h1>Download our <a href="#">App</a></h1>
        <div class="video">
            <!-- Make sure this video exists at: webapp/images/about/1.mp4 -->
            <video autoplay muted loop src="images/about/1.mp4" width="100%"></video>
        </div>
    </section>

    <!-- Feature Section -->
    <section id="feature" class="section-p1">
        <div class="fe-box">
            <img src="images/features/f1.png" alt="Free Shipping">
            <h6>Free Shipping</h6>
        </div>
        <div class="fe-box">
            <img src="images/features/f2.png" alt="Online Order">
            <h6>Online Order</h6>
        </div>
        <div class="fe-box">
            <img src="images/features/f3.png" alt="Save Money">
            <h6>Save Money</h6>
        </div>
        <div class="fe-box">
            <img src="images/features/f4.png" alt="Promotions">
            <h6>Promotions</h6>
        </div>
        <div class="fe-box">
            <img src="images/features/f5.png" alt="Happy Sell">
            <h6>Happy Sell</h6>
        </div>
        <div class="fe-box">
            <img src="images/features/f6.png" alt="24/7 Support">
            <h6>24/7 Support</h6>
        </div>
    </section>
    <!-- Footer (copied from index.jsp) -->
    <footer class="section-p1">
        <div class="copyright">
            <p>© 2025, OnlineShoppingWeb – Java EE Project</p>
        </div>
    </footer>

</body>
</html>
