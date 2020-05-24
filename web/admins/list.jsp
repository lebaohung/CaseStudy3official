<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Management Application</title>
</head>
<body>
<center>
    <h1>Admin Management</h1>
    <h2>
        <a href="/admins?action=create">Add New Admin</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Admins</h2></caption>
        <tr>
            <th>Admin Name</th>
            <th>Password</th>
            <th colspan="2">Actions</th>
        </tr>
        <c:forEach var="admin" items="${listAdmin}">
            <tr>
                <td><c:out value="${admin.adName}"/></td>
                <td><c:out value="${admin.password}"/></td>

                <td>
                    <a href="/admins?action=edit&adName=${admin.adName}">Edit</a>
                    <a href="/admins?action=delete&adName=${admin.adName}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>