<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Online Shopping Web</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<!-- Header -->
<section id="header">
    <a href="index.jsp"><img src="images/logo.png?v=2" class="logo" alt="Logo" width="100"></a>
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

<!-- Hero -->
<section id="hero">
    <h4>Trade-in-offer</h4>
    <h2>Super value deals</h2>
    <h1>On all products</h1>
    <p>Save more with coupons & up to 70% off!</p>
    <button>Shop Now</button>
</section>

<!-- Features -->
<section id="feature" class="section-p1">
    <div class="fe-box"><img src="images/features/f1.png"><h6>Free Shipping</h6></div>
    <div class="fe-box"><img src="images/features/f2.png"><h6>Online Order</h6></div>
    <div class="fe-box"><img src="images/features/f3.png"><h6>Save Money</h6></div>
    <div class="fe-box"><img src="images/features/f4.png"><h6>Promotions</h6></div>
    <div class="fe-box"><img src="images/features/f5.png"><h6>Happy Sell</h6></div>
    <div class="fe-box"><img src="images/features/f6.png"><h6>24/7 Support</h6></div>
</section>

<!-- Featured Products -->
<section id="product1" class="section-p1">
    <h2>Featured Products</h2>
    <p>Summer Collection New Modern Design</p>
    <div class="pro-container">
        <c:forEach var="p" items="${productListFeatured}">
            <div class="pro">
                <img src="images/products/${p.image}" alt="${p.name}">
                <div class="des">
                    <span>adidas</span>
                    <h5>${p.name}</h5>
                    <div class="star">⭐⭐⭐⭐⭐</div>
                    <h4>$${p.price}</h4>
                </div>
                <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
            </div>
        </c:forEach>
    </div>
</section>

<!-- New Arrivals -->
<section id="product1" class="section-p1">
    <h2>New Arrivals</h2>
    <p>Summer Collection New Modern Design</p>
    <div class="pro-container">
        <c:forEach var="p" items="${productListNew}">
            <div class="pro">
                <img src="images/products/${p.image}" alt="${p.name}">
                <div class="des">
                    <span>adidas</span>
                    <h5>${p.name}</h5>
                    <div class="star">⭐⭐⭐⭐⭐</div>
                    <h4>$${p.price}</h4>
                </div>
                <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
            </div>
        </c:forEach>
    </div>
</section>

<!-- Banner -->
<section id="banner" class="section-m1">
    <h4>Repair Services</h4>
    <h2>Up to <span>70% Off</span> – All T-Shirts & Accessories</h2>
    <button class="normal">Explore More</button>
</section>

<!-- Small Banners -->
<section id="sm-banner" class="section-p1">
    <div class="banner-box">
        <h4>Crazy deals</h4>
        <h2>Buy 1 Get 1 Free</h2>
        <span>Best classic dress is on sale</span>
        <button class="white">Learn More</button>
    </div>
    <div class="banner-box">
        <h4>Spring/Summer</h4>
        <h2>Upcoming Season</h2>
        <span>Best classic dress is on sale</span>
        <button class="white">Collection</button>
    </div>
</section>

<!-- Triple Banner -->
<section id="banner3">
    <div class="banner-box">
        <h2>Seasonal Sale</h2>
        <h3>Winter Collection - 50% OFF</h3>
    </div>
    <div class="banner-box">
        <h2>New Footwear</h2>
        <h3>Spring/Summer 2025</h3>
    </div>
    <div class="banner-box">
        <h2>T-Shirts</h2>
        <h3>New Trendy Prints</h3>
    </div>
</section>

<!-- Newsletter -->
<section id="newsletter" class="section-p1 section-m1">
    <div class="newstext">
        <h4>Sign Up For Newsletters</h4>
        <p>Get E-mail updates about our latest shop and <span>special offers</span></p>
    </div>
    <div class="form">
        <input type="email" placeholder="Your email address">
        <button class="normal">Sign Up</button>
    </div>
</section>

<!-- Footer -->
<%@ include file="footer.jsp" %>

</body>
</html>
