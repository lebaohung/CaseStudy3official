<%--
  Created by IntelliJ IDEA.
  User: sonnguyen
  Date: 5/20/2020
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <a href="index.jsp"><img src="images/lauphan_logo.png" class="brand_logo" alt="Logo"
                             style=" position: absolute;"></a>
</div>

<div id="confirmContent" style="margin-top: 6%; border-radius: 40px;">

    <h2 style="text-align: center;margin-left: 10%;margin-bottom: 5%;
    margin-top: 3%;width: 75% ; background-color: #fcac81;padding-left: 5%;
">ĐƠN HÀNG CỦA BẠN ĐÃ TỒN TẠI</h2>
    <form action="index.jsp">
        <div class="row">
            <div style="margin-bottom: 7%">
                <p style="background-color: #fcac81;font-style: italic;text-align: center;">
                    Mọi vấn đề xin quý khách vui lòng liên hệ với tổng đài hỗ trợ 19001007 </p>
            </div>
            <div class="row">
                <button style="float: left;margin-bottom: 20px;left: 50%" type="submit" class="button button1"
                >QUAY VỀ TRANG CHỦ
                </button>
            </div>
        </div>
    </form>
</div>


</body>
</html>
