<%@ page import="java.util.List" %>
<%@ page import="org.example.companyemployeeee.model.Employee" %><%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/9/24
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
%>
Employees | <a href="/addEmployee">Add employee</a>

<%
    if (employees != null && !employees.isEmpty()) { %>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Picture</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Company Name</th>
        <th>Company Address</th>
        <th>Delete</th>
    </tr>
    <tr>
            <%
                for (Employee employee : employees) { %>
    <tr>
        <td><%=employee.getId()%></td>
        <td><% if (employee.getPicName() != null) { %>
        <img src="/downloadImage?imageName=<%=employee.getPicName()%>" width="45px">
        <% } else {%>
            <span>No picture</span>
            <%} %>
        </td>
        <td><%=employee.getName()%></td>
        <td><%=employee.getSurname()%></td>
        <td><%=employee.getEmail()%></td>
        <td><%=employee.getCompany().getName()%></td>
        <td><%=employee.getCompany().getAddress()%></td>
        <td><a href="/deleteEmployee?id=<%=employee.getId()%>">delete</a></td>
    </tr>
    <%
    }
    %>
    </tr>
</table>
<% } %>
</body>
</html>
