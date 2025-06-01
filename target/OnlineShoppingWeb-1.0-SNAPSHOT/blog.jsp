<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Blog – Online Shopping Web</title>

    <!-- Font Awesome (for icons) -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <!-- Your custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>

    <!-- Header (same as in about.jsp) -->
    <section id="header">
        <a href="index.jsp">
            <img src="images/logo.png?v=2" class="logo" alt="Logo" width="100">
        </a>
        <ul id="navbar">
            <li><a href="home">Home</a></li>
            <li><a href="shop">Shop</a></li>
            <li><a class="active" href="blog.jsp">Blog</a></li>
            <li><a href="about.jsp">About</a></li>
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
                %>
            <%
                } else {
            %>
                <li><a href="login.jsp">Login</a></li>
            <%
                }
            %>
        </ul>
    </section>

    <!-- Page Header for Blog -->
    <section id="page-header" class="blog-header section-p1">
        <h2>#readmore</h2>
        <p>Read all case studies about our products!</p>
    </section>

    <!-- Blog Listing Section -->
    <section id="blog" class="section-p1">
        <div class="blog-box">
            <div class="blog-img">
                <img src="images/blog/b1.jpg" alt="Blog Post 1">
            </div>
            <div class="blog-details">
                <h4>The Cotton-Jersey Zip-Up Hoodie</h4>
                <p>
                    Kickstarter man braid godard coloring book. Raclette waistcoat selfies
                    yr wolf chartreuse hexagon irony, godard...
                </p>
                <a href="#" class="continue-reading">CONTINUE READING</a>
            </div>
            <h1>13/01</h1>
        </div>

        <div class="blog-box">
            <div class="blog-img">
                <img src="images/blog/b2.jpg" alt="Blog Post 2">
            </div>
            <div class="blog-details">
                <h4>How to Style a Quiff</h4>
                <p>
                    Kickstarter man braid godard coloring book. Raclette waistcoat selfies
                    yr wolf chartreuse hexagon irony, godard...
                </p>
                <a href="#" class="continue-reading">CONTINUE READING</a>
            </div>
            <h1>13/04</h1>
        </div>

        <div class="blog-box">
            <div class="blog-img">
                <img src="images/blog/b3.jpg" alt="Blog Post 3">
            </div>
            <div class="blog-details">
                <h4>Must-Have Skater Girl Items</h4>
                <p>
                    Kickstarter man braid godard coloring book. Raclette waistcoat selfies
                    yr wolf chartreuse hexagon irony, godard...
                </p>
                <a href="#" class="continue-reading">CONTINUE READING</a>
            </div>
            <h1>12/01</h1>
        </div>

        <div class="blog-box">
            <div class="blog-img">
                <img src="images/blog/b4.jpg" alt="Blog Post 4">
            </div>
            <div class="blog-details">
                <h4>Runway-Inspired Trends</h4>
                <p>
                    Kickstarter man braid godard coloring book. Raclette waistcoat selfies
                    yr wolf chartreuse hexagon irony, godard...
                </p>
                <a href="#" class="continue-reading">CONTINUE READING</a>
            </div>
            <h1>16/01</h1>
        </div>

        <div class="blog-box">
            <div class="blog-img">
                <img src="images/blog/b6.jpg" alt="Blog Post 5">
            </div>
            <div class="blog-details">
                <h4>AW20 Menswear Trends</h4>
                <p>
                    Kickstarter man braid godard coloring book. Raclette waistcoat selfies
                    yr wolf chartreuse hexagon irony, godard...
                </p>
                <a href="#" class="continue-reading">CONTINUE READING</a>
            </div>
            <h1>10/03</h1>
        </div>
    </section>

    <!-- Pagination -->
    <section id="pagination" class="section-p1">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#"><i class="fas fa-long-arrow-alt-right"></i></a>
    </section>
    <!-- Footer (same as in about.jsp) -->
    <footer class="section-p1">
        <div class="copyright">
            <p>© 2025, OnlineShoppingWeb – Java EE Project</p>
        </div>
    </footer>

</body>
</html>
