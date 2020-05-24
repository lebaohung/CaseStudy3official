<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Management Application</title>
</head>
<body>
<center>
    <h1>Order Delete</h1>
    <h2>
        <a href="/dashboard?action=orders">List All Oders</a>
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
                    <input type="submit" value="Delete"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>