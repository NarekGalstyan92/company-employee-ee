<%@ page import="org.example.companyemployeeee.model.Company" %>
<%@ page import="org.example.companyemployeeee.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/12/24
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Company company = (Company) request.getAttribute("company");%>
<%List <Employee> employees = (List <Employee>) request.getAttribute("employees");%>
<html>
<head>
    <title><%=company.getName()%></title>
</head>
<body>

<h2><%=company.getName()%> | ID: <%=company.getId()%></h2>
Address: <span><%=company.getAddress()%></span>
Employees:

<%
    if (employees != null && !employees.isEmpty()) { %>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>

    </tr>
    <tr>
            <%
                for (Employee employee : employees) { %>
    <tr>
        <td><%=employee.getId()%></td>
        <td><%=employee.getName()%></td>
        <td><%=employee.getSurname()%></td>
        <td><%=employee.getEmail()%></td>

    </tr>
    <% }

    %>
    </tr>
</table>
<% } %>
</body>
</html>
