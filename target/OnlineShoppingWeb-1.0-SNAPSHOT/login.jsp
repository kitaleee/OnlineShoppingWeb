
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            flex-wrap: wrap;
        }

        .form-section, .info-section {
            flex: 1;
            padding: 40px;
            min-width: 300px;
        }

        .form-section {
            border-right: 1px solid #ddd;
        }

        h2 {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .checkbox-group {
            margin-top: 10px;
        }

        .checkbox-group label {
            font-weight: normal;
        }

        .form-actions {
            margin-top: 30px;
        }

        input[type="submit"] {
            background-color: #000;
            color: #fff;
            width: 100%;
            padding: 12px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            border-radius: 6px;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        .form-links {
            margin-top: 15px;
            font-size: 14px;
        }

        .form-links a {
            text-decoration: underline;
            color: #000;
        }

        .info-section h2 {
            font-size: 24px;
        }

        .info-section p {
            margin: 20px 0;
        }

        .info-section a {
            display: inline-block;
            background: #000;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 6px;
        }

        @media screen and (max-width: 768px) {
            .container {
                flex-direction: column;
                padding: 20px;
            }

            .form-section {
                border-right: none;
                border-bottom: 1px solid #ddd;
            }
        }
    </style>

    <script>
        function validateLoginForm() {
            let email = document.forms["loginForm"]["email"].value.trim();
            let password = document.forms["loginForm"]["password"].value.trim();
            document.getElementById("loginError").innerText = "";

            if (!email || !password) {
                document.getElementById("loginError").innerText = "Please enter both email and password.";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="container">
    <div class="form-section">
        <h2>Login</h2>
        <form name="loginForm" action="login" method="post" onsubmit="return validateLoginForm()">
            <input type="hidden" name="redirect" value="<%= request.getParameter("redirect") != null ? request.getParameter("redirect") : "" %>">

            <label>Email Address *</label>
            <input type="text" name="email" required>

            <label>Password *</label>
            <input type="password" name="password" required>

            <div class="checkbox-group">
                <label><input type="checkbox" onclick="document.loginForm.password.type = this.checked ? 'text' : 'password';"> Show Password</label>
            </div>

            <div class="form-actions">
                <input type="submit" value="Login">
            </div>

            <div class="form-links">
                <a href="#">Terms of Use</a> &nbsp;|&nbsp; <a href="#">Privacy Policy</a>
            </div>
            
            
            <div class="error" id="loginError" style="color:red;margin-top:10px;"></div>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="error" style="color:red; margin-top:10px; font-weight:bold;">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

        </form>
    </div>

    <div class="info-section">
        <h2>Create an Account</h2>
        <p>Sign up now to track orders, save items, and receive exclusive member-only benefits!</p>
        <a href="register.jsp">Register</a>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
