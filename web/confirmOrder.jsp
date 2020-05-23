<%--
  Created by IntelliJ IDEA.
  User: sonnguyen
  Date: 5/20/2020
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm</title>
    <link rel="stylesheet" href="/css/orderStyles.css">
    <link rel="stylesheet" href="/css/confirmPopUp.css">
</head>
<body onload="myFunction()" style="background-image: url(images/cover.jpg);
background-repeat: no-repeat;
background-size: cover;
">

<div style="position: fixed; margin-left:5%;margin-top: 50px">
    <%--    <div class="brand_logo_container">--%>
    <a href="index.jsp"><img src="images/lauphan_logo.png" class="brand_logo" alt="Logo"
                             style=" position: absolute;"></a>
    <%--    </div>--%>
</div>

<div id="confirmContent" style=" border-radius: 40px;margin-top: 6%;">
    <h2 style="text-align: center;margin-left: 10%;margin-bottom: 5%;
    margin-top: 3%;width: 75% ; background-color: #fcac81;padding-left: 5%;
">ĐẶT BÀN THÀNH CÔNG</h2>
    <form action="/index.jsp" method="get" onsubmit="openForm()">
        <div class="row">
            <div class="col-40">
                <label for="orderId" style="padding-left: 100px;background-color: #fcac81;">Mã đơn </label>
            </div>
            <div class="col-60">
                <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="orderId" name="orderId">
                    ${order.orderId}
                </span>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="nameText" style="padding-left: 100px;background-color: #fcac81;">Tên khách hàng </label>
            </div>
            <div class="col-60">
                <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="nameText" name="nameText">
                    ${guestName}
                </span>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="quantity" style="padding-left: 100px;background-color: #fcac81;">Số người ăn </label>
            </div>
            <div class="col-60">
                <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="quantity" name="nameText">
                    ${order.guestNum}
                </span>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="branchRadio" style="padding-left: 100px ;background-color: #fcac81;">Chi nhánh </label>
            </div>
            <div class="col-60">
               <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="branchRadio" name="nameText">

                    <c:choose>

                        <c:when test="${order.branchId == 1}">
                            Lẩu Phan Moncity
                        </c:when>

                        <c:when test="${order.branchId == 2}">
                            Lẩu Phan Hải Phòng
                        </c:when>

                        <c:when test="${order.branchId == 3}">
                            Lẩu Phan Phùng Khoang
                        </c:when>
                        <c:when test="${order.branchId == 4}">
                            Lẩu Phan Ðào Duy Anh
                        </c:when>
                        <c:when test="${order.branchId == 5}">
                            Lẩu Phan Nguyễn Văn Cừ
                        </c:when>
                    </c:choose>

               </span>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="dateRadio" style="padding-left: 100px;background-color: #fcac81;">Ngày nhận bàn </label>
            </div>
            <div class="col-60">
                 <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="dateRadio" name="dateRadio">
                    <c:set var="dateOrder" value="${order.date}"/>
                    <c:set var="year" value="${fn:substring(dateOrder, 0, 4)}"/>
                    <c:set var="month" value="${fn:substring(dateOrder, 5, 7)}"/>
                    <c:set var="day" value="${fn:substring(dateOrder, 8, 10)}"/>
                     ${day}/${month}/${year}
<%--                    <c:set var="dateFormat" value="${fn:join(day, '/',month,'/',year)}"/>--%>

                 </span>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="timeRadio" style="padding-left: 100px;background-color: #fcac81;">Giờ nhận bàn </label>
            </div>
            <div class="col-60">
              <span style="font-size: 20px;background-color: #fcac81;padding-left: 50px;font-weight: bold" id="timeRadio" name="timeRadio">
                 <c:set var="orderTimeString" value="${order.time}"/>
                  ${fn:substring(orderTimeString, 0, 5)}
              </span>
            </div>
        </div>

        <div class="row">
            <div style="margin-bottom: 2%">
                <p style="background-color: #fcac81;font-style: italic;text-align: center">
                    Mọi vấn đề xin quý khách vui lòng liên hệ với tổng đài hỗ trợ 19001007 </p>
            </div>
            <div class="row">
                <button style="float: left;margin-bottom: 20px;left: 50%" type="submit" class="button button1"
                >OK
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function myFunction() {
        let d = new Date();
        let h = d.getHours();
        let day = d.getDate();
        let min = d.getMinutes()
        document.getElementById("nameText").value = getParameterByName('nameText');
        document.getElementById("phone").value = getParameterByName('phoneNum');
        document.getElementById("quantity").value = getParameterByName('quantity');
        document.getElementById("branchRadio").value = getParameterByName('branchRadio');
        document.getElementById("timeRadio").value = getParameterByName('timeRadio') + ":00";
        document.getElementById("dateOrder").value = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
    }

    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }
</script>

</body>
</html>
