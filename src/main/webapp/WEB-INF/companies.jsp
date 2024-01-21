<%@ page import="org.example.companyemployeeee.model.Company" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: narekgalstyan
  Date: 1/9/24
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Companies</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%
    List<Company> companies = (List<Company>) request.getAttribute("companies");
%>
Companies | <a href="/addCompany">Add company</a>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Address</th>
        <th>Added by</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    <tr>
        <%
            if (companies != null && !companies.isEmpty()) {
                for (Company company : companies) { %>
        <tr>
    <td><%=company.getId()%></td>
    <td><a href="/singleCompany?id=<%=company.getId()%>"><%=company.getName()%></a> </td>
    <td><%=company.getAddress()%></td>
    <td>
        <% if (company.getUser() != null) { %>
        <%=company.getUser().getName() + " " + company.getUser().getSurname()%>
        <% }%>
    </td>
    <td> <a href="/deleteCompany?id=<%=company.getId()%>">delete</a> </td>
    <td> <a href="/updateCompany?id=<%=company.getId()%>">update</a> </td>
</tr>
        <% }
        }
        %>
    </tr>
</table>
</body>
</html>
