<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Management Application</title>
</head>
<body>
<center>
    <h1>Admin Delete</h1>
    <h2>
        <a href="/admins?action=admins">List All Admins</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>
        <table style="border: 2px solid blue" cellpadding="5">
            <caption>
                <h2>
                    Are you sure ?
                </h2>
            </caption>
            <%--            <c:if test="${deleteAdmin != null}">--%>
            <%--                <input type="hidden" name="adName" value="<c:out value='${deleteAdmin.adName}' />" readonly/>--%>
            <%--            </c:if>--%>
            <tr>
                <th>Admin Name: </th>
                <td>
                    <input type="text" name="adName" size="45"
                           value="<c:out value='${deleteAdmin.adName}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <th>Password: </th>
                <td>
                    <input type="text" name="password" size="45"
                           value="<c:out value='${deleteAdmin.password}' />" readonly
                    />
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Delete"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>