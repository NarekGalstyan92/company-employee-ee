<%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/9/24
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<% if (session.getAttribute("msg") != null) {%>
<span style="color: red"> <%=session.getAttribute("msg")%></span>
<%session.removeAttribute("msg");%>
<%}%>

<form action="/login" method="post">
    Email: <input type="email" name="email"> <br>
    Password: <input type="password" name="password"> <br>
    <input type="submit" value="login">
</form>
<br>
<br>
<br>
<form action="/register" method="post">
    Name: <input type="text" name="name"> <br>
    Surname: <input type="text" name="surname"> <br>
    Email: <input type="email" name="email"> <br>
    Password: <input type="password" name="password"> <br>
    <input type="submit" value="register">
</form>
</body>
</html>
