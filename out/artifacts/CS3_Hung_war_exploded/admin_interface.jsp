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
<div class="header">
    <table>
        <tr>
            <td style="width: 90%">
                <form class="admin_name">
                    <p> Hello Admin </p>
                    <a class="btn btn-success" href="/admins">Danh sách admin</a>
                </form>
            </td>
            <td style="width: 5%;">
                <div class="sort_menu">
                    <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            Sắp xếp
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#"> Mã đơn </a>
                            <a class="dropdown-item" href="#"> Thời gian </a>
                            <a class="dropdown-item" href="#"> Chi nhánh </a>
                            <a class="dropdown-item" href="#"> Tên khách hàng</a>
                        </div>
                    </div>
                </div>
            </td>
            <td style="width: 5%">
                <form method="post" class="log_out">
                    <button name="button" class="btn btn-success"> Thoát </button>
                </form>
            </td>
        </tr>
    </table>
</div>
<div class="container">
    <table class="table table-hover" id="">
        <tr class="table_header">
            <td colspan="7"> Danh sách đặt bàn</td>
        </tr>
        <tr>
            <th> Mã đơn</th>
            <th> Thời gian</th>
            <th> Chi nhánh</th>
            <th> Tên khách hàng</th>
            <th> Ngày order </th>
            <th> Số lượng khách</th>
            <th colspan="2"> Thao tác</th>
        </tr>
        <c:forEach var="order" items="${listOrder}">
            <tr>
                <td><c:out value="${order.orderId}"/></td>
                <td><c:out value="${order.time}"/></td>
                <td><c:out value="${order.branchId}"/></td>
                <td><c:out value="${order.guestId}"/></td>
                <td><c:out value="${order.date}"/></td>
                <td><c:out value="${order.guestNum}"/></td>
                <td>
                    <a class="btn btn-primary" href="/dashboard?action=edit&id=${order.orderId}">Edit</a>
                    <a class="btn btn-danger" href="/dashboard?action=delete&id=${order.orderId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
