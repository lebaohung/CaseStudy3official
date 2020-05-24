<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Management Application</title>
</head>
<body>
<center>
    <h1>Order Management</h1>
    <h2>
        <a href="/dashboard?action=orders">List All Orders</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <p>
            <c:if test="${message != null}">
                <span class="message"><c:out value="${message}"/></span>
            </c:if>
        </p>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Order
                </h2>
            </caption>
            <c:if test="${order != null}">
                <input type="hidden" name="id" value="<c:out value='${order.orderId}' />"/>
            </c:if>
            <tr>
                <th>GuestId: </th>
                <td>
                    <input type="text" name="guestId" size="45"
                           value="<c:out value='${order.guestId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>BranchId: </th>
                <td>
                    <input type="text" name="branchId" size="45"
                           value="<c:out value='${order.branchId}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Date: </th>
                <td>
                    <input type="text" name="date" size="15"
                           value="<c:out value='${order.date}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Time: </th>
                <td>
                    <input type="text" name="time" size="45"
                           value="<c:out value='${order.time}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Guest number: </th>
                <td>
                    <input type="text" name="guestNum" size="45"
                           value="<c:out value='${order.guestNum}' />"
                    />
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