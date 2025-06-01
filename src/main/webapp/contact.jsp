<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.university.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us – Online Shopping Web</title>

    <!-- Font Awesome (for icons) -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <!-- Your custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

  
    <section id="header">
        <a href="index.jsp">
            <img src="images/logo.png?v=2" class="logo" alt="Logo" width="100">
        </a>
        <ul id="navbar">
            <li><a href="home">Home</a></li>
            <li><a href="shop">Shop</a></li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a class="active" href="contact.jsp">Contact</a></li>
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

    <!-- Page Header for Contact -->
    <section id="page-header" class="about-header section-p1">
        <h2>#let's_talk</h2>
        <p>LEAVE A MESSAGE, We love to hear from you!</p>
    </section>

    <!-- Contact Details & Map Section -->
    <section id="contact-details" class="section-p1">
        <div class="details">
            <span>GET IN TOUCH</span>
            <h2>Visit one of our agency locations or contact us today.</h2>
            <h3>Head Office</h3>
            <div>
                <li>
                    <i class="fas fa-map"></i>
                    <p>Thu Duc, Viet Nam 700000</p>
                </li>
                <li>
                    <i class="fas fa-envelope"></i>
                    <p>nkershop@gmail.com</p>
                </li>
                <li>
                    <i class="fas fa-phone-alt"></i>
                    <p>+84 98765432 </p>
                </li>
                <li>
                    <i class="fas fa-clock"></i>
                    <p>Monday to Saturday: 8:00 to 22:00</p>
                </li>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.1317197881317!2d106.79904467690218!3d10.877584789277392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d8a415a9d221%3A0x550c2b41569376f9!2sInternational%20University%20-%20VNU-HCM!5e0!3m2!1sen!2sus!4v1748764678694!5m2!1sen!2sus" 
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>

    <!-- Contact Form & Team Section -->
    <section id="form-details" class="section-p1">
        <form action="#" method="post">
            <span>LEAVE A MESSAGE</span>
            <h2>We love to hear from you</h2>
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="E-mail" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="message" cols="30" rows="10" placeholder="Your Message" required></textarea>
            <button type="submit" class="normal">Submit</button>
        </form>
        <div class="people">
            <div>
                <img src="images/people/1.png?v=2" alt="John Doe">
                <p><span>Kita Le</span> Senior Marketing Manager<br>
                   Phone: +84 987654321 <br>
                   Email: kitale@gmail.com
                </p>
            </div>
            <div>
                <img src="images/people/2.png?v=2" alt="William Smith">
                <p><span>MTonzz</span> Senior Marketing Manager<br>
                   Phone: +84 123456789<br>
                   Email: mtonzz@gmail.com
                </p>
            </div>
           
        </div>
    </section>
  
    <footer class="section-p1">
        <div class="col">
            <img class="logo" src="images/logo.png?v=2" alt="Logo" width="120">
            <h4>Contact</h4>
            <p><strong>Address:</strong> 123 Main Street, HCMC</p>
            <p><strong>Phone:</strong> +84 987654321</p>
            <p><strong>Hours:</strong> 8:00 – 22:00, Mon – Sat</p>
            <div class="follow">
                <h4>Follow Us</h4>
                <i class="fab fa-facebook-f"></i>
                <i class="fab fa-instagram"></i>
                <i class="fab fa-twitter"></i>
            </div>
        </div>
        <div class="col install">
            <p>Secured Payment Gateways</p>
            <img src="images/pay/pay.png" alt="Payment Gateway">
            <div class="row">
                <img src="images/pay/app.jpg" alt="App Store">
                <img src="images/pay/play.jpg" alt="Google Play">
            </div>
        </div>
        <div class="copyright">
            <p>© 2025, OnlineShoppingWeb – Java EE Project</p>
        </div>
    </footer>

</body>
</html>
