<%@ page import="org.example.companyemployeeee.model.Company" %><%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/10/24
  Time: 7:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Company</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<% Company company = (Company) request.getAttribute("company");%>

Update Company <br>
<form method="post" action="/updateCompany">
    <input type="hidden" name="companyId" value="<%=company.getId()%>"> <br>
    Company name: <input type="text" name="companyName" value="<%=company.getName()%>"> <br>
    Company address: <input type="text" name="companyAddress" value="<%=company.getAddress()%>"> <br>
    <input type="submit" name="update">
</form>
</body>
</html>
