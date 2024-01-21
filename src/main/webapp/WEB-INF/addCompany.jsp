<%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/10/24
  Time: 7:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Company</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
Add Company <br>
<form method="post" action="/addCompany">
    Company name: <input type="text" name="companyName"> <br>
    Company address: <input type="text" name="companyAddress"> <br>
    <input type="submit" name="add">
</form>
</body>
</html>
