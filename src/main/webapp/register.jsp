<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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

        .register-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 32px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .checkbox-group, .radio-group {
            margin-top: 12px;
        }

        .checkbox-group label, .radio-group label {
            font-weight: normal;
            margin-right: 15px;
        }

        input[type="checkbox"],
        input[type="radio"] {
            margin-right: 5px;
        }

        .form-actions {
            margin-top: 25px;
        }

        input[type="submit"],
        .back-button {
            background-color: #00796b;
            color: white;
            width: 100%;
            padding: 12px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        input[type="submit"]:hover,
        .back-button:hover {
            background-color: #004d40;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: 8px;
        }

        @media screen and (max-width: 600px) {
            .register-container {
                padding: 20px;
            }
        }
    </style>

    <script>
        function validateRegisterForm() {
            const name = document.forms["registerForm"]["name"].value.trim();
            const email = document.forms["registerForm"]["email"].value.trim();
            const password = document.forms["registerForm"]["password"].value.trim();
            const agree = document.forms["registerForm"]["agree"].checked;
            document.getElementById("regError").innerText = "";

            if (!name || !email || !password) {
                document.getElementById("regError").innerText = "Please fill in all required fields.";
                return false;
            }
            if (!agree) {
                document.getElementById("regError").innerText = "You must agree to the terms and privacy policy.";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="register-container">
    <h2>Create Your Account</h2>
    <form name="registerForm" action="register" method="post" onsubmit="return validateRegisterForm()">
        <label>Full Name *</label>
        <input type="text" name="name" required>

        <label>Email Address *</label>
        <input type="email" name="email" required>

        <label>Password *</label>
        <input type="password" name="password" required>

        <label>Date of Birth</label>
        <input type="date" name="dob">

        <label>Gender</label>
        <div class="radio-group">
            <label><input type="radio" name="gender" value="male"> Male</label>
            <label><input type="radio" name="gender" value="female"> Female</label>
            <label><input type="radio" name="gender" value="other" checked> Other</label>
        </div>

        <div class="checkbox-group">
            <label><input type="checkbox" name="newsletter"> Subscribe to our newsletter</label>
        </div>

        <div class="checkbox-group">
            <label><input type="checkbox" name="agree" required> I agree to the <a href="#">Terms</a> and <a href="#">Privacy Policy</a> *</label>
        </div>

        <div class="form-actions">
            <input type="submit" value="Register">
            <button type="button" class="back-button" onclick="window.location.href='login.jsp'">Back to Login</button>
        </div>

        <div class="error" id="regError"></div>
    </form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
