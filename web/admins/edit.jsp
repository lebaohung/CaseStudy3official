<%--
  Created by IntelliJ IDEA.
  User: phdan
  Date: 21/05/2020
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="css/admin_interface.css">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

<center>
    <h1>Admin Management</h1>
    <h2>
        <a class="btn btn-info btn-lg" href="/admins?action=admins">List All Admins</a>
    </h2>
</center>
<div class="container">
    <form method="post">
        <p>
            <c:if test="${message != null}">
                <span class="message"><c:out value="${message}"/></span>
            </c:if>
        </p>
        <table class="table table-hover" id="">
            <tr class="table_header">
                <td colspan="7"> Edit Admin </td>
            </tr>
            <c:if test="${guest != null}">
                <input type="hidden" name="adName" value="<c:out value='${adName}' />"/>
            </c:if>
            <tr style="text-align: center">
                <th>Admin Name: </th>
                <td>
                    <input type="text" name="adName1" size="45"
                           value="<c:out value='${admin.adName}' />"
                    />
                </td>
            </tr>
            <tr style="text-align: center">
                <th>Password: </th>
                <td>
                    <input type="text" name="password" size="45"
                           value="<c:out value='${admin.password}' />"
                    />
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-success btn-lg">Save</button>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
