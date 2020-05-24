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
        <a href="/admins?action=admins">List All Guests</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/admins?action=create">
        <p>
            <c:if test="${message != null}">
                <span class="message"><c:out value="${message}"/></span>
            </c:if>
        </p>
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Admin</h2>
            </caption>
            <tr>
                <th>Admin Name: </th>
                <td>
                    <input type="text" name="adName" id="adName" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Password: </th>
                <td>
                    <input type="text" name="password" id="password" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>