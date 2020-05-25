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
        <a class="btn btn-warning btn-lg" href="/admins?action=create">Add New Admin</a>
    </h2>
</center>
<div class="container">
    <table class="table table-hover" id="">
        <tr class="table_header">
            <td colspan="7"> Danh sách admin</td>
        </tr>
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
                    <a class="btn btn-primary" href="/admins?action=edit&adName=${admin.adName}">Edit</a>
                    <a class="btn btn-danger" href="/admins?action=delete&adName=${admin.adName}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3" align="center">
                <a href="/dashboard?action=orders" class="btn btn-success btn-lg">Quay lại danh sách đơn hàng</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>