<%@ page import="java.util.List" %>
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
    <title>Add Employee</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<% List<Company> companies = (List<Company>) request.getAttribute("companies");%>
Add Employee <br>
<form method="post" action="/addEmployee" enctype="multipart/form-data">
    Name: <input type="text" name="name"> <br>
    Surname: <input type="text" name="surname"> <br>
    Email: <input type="email" name="email"> <br>
    <select name="companyId">
        <%
            for (Company company : companies) { %>
        <option value="<%=company.getId()%>"><%=company.getName()%></option>
        <% }%>
    </select> <br>
    <input type="file" name="avatar" accept="image/jpeg">
    <input type="submit" name="add">
</form>
</body>
</html>
