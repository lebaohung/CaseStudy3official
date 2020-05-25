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
    <h1>Order Management</h1>
    <h2>
        <a class="btn btn-info btn-lg" href="/dashboard?action=orders">List All Orders</a>
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
                <td colspan="7"> Xóa đơn hàng này ? </td>
            </tr>
            <c:if test="${deleteOrder != null}">
                <input type="hidden" name="id" value="<c:out value='${deleteOrder.orderId}' />" readonly/>
            </c:if>
            <tr>
                <th>GuestId: </th>
                <td>
                    <input type="text" name="guestId" size="45"
                           value="<c:out value='${deleteOrder.guestId}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <th>BranchId: </th>
                <td>
                    <input type="text" name="branchId" size="45"
                           value="<c:out value='${deleteOrder.branchId}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <th>Date: </th>
                <td>
                    <input type="text" name="date" size="15"
                           value="<c:out value='${deleteOrder.date}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <th>Time: </th>
                <td>
                    <input type="text" name="time" size="45"
                           value="<c:out value='${deleteOrder.time}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <th>Guest number: </th>
                <td>
                    <input type="text" name="guestNum" size="45"
                           value="<c:out value='${deleteOrder.guestNum}' />" readonly
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-success btn-lg">Delete</button>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
