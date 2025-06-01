<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Result</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <h2>Order Result</h2>

    <%
        String message = (String) request.getAttribute("message");
    %>

    <p><strong><%= message != null ? message : "No message." %></strong></p>

    <p>
        <a href="index.jsp">Back to Home</a> |
        <a href="shop">Continue Shopping</a>
    </p>
<%@ include file="footer.jsp" %>
</body>
</html>
