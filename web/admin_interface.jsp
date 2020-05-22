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
    <div class="admin_name">
        <p> Hello Admin: + "${admin.getUsername}"</p>
        <input type="submit" name="addadmin" id="addadmin" value="Add Admin" class="btn-primary">
    </div>
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
</div>
<div class="container">
    <table class="table table-hover" id="">
        <tr class="table_header">
            <td colspan="7"> Danh sách đặt bàn</td>
        </tr>
        <tr>
            <th> STT</th>
            <th> Mã đơn</th>
            <th> Thời gian</th>
            <th> Chi nhánh</th>
            <th> Tên khách hàng</th>
            <th> Số điện thoại</th>
            <th> Thao tác</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <input type="submit" name="edit" id="edit" value="edit" class="btn-success">
                <input type="submit" name="delete" id="delete" value="delete" class="btn-success">
            </td>
        </tr>
    </table>
</div>
</body>
</html>
