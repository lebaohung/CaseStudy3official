<%--
  Created by IntelliJ IDEA.
  User: sonnguyen
  Date: 5/20/2020
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm</title>
    <link rel="stylesheet" href="/css/orderStyles.css">
    <link rel="stylesheet" href="/css/confirmPopUp.css">
</head>
<body onload="myFunction()"
        style="background-image: url(images/cover.jpg);
background-repeat: no-repeat;
background-size: cover;
">

<div style="position: fixed; margin-left:5%;margin-top: 50px">
<%--    <div class="brand_logo_container">--%>
        <a href="index.jsp"><img src="images/lauphan_logo.png" class="brand_logo" alt="Logo"
                                  style=" position: absolute;"></a>
<%--    </div>--%>
</div>

<div id="confirmContent">
    <h2 style="text-align: center;margin-bottom: 50px;margin-top: 10px;  background-color: #fcac81;
">XÁC NHẬN THÔNG TIN ĐẶT BÀN</h2>
    <div class="row">
        <div class="col-40">
            <label for="customerName">Tên khách hàng </label>
        </div>
        <div class="col-60">
            <input type=" text" style="width: 70%;"
                   id="customerName" value="" readonly>
        </div>
    </div>

    <div class="row">
        <div class="col-40">
            <label for="phone">Điện thoại </label>
        </div>
        <div class="col-60">
            <input type=" text" style="width: 70%; "  id="phone" value="" readonly>
        </div>
    </div>

    <div class="row">
        <div class="col-40">
            <label for="quantity">Số người ăn </label>
        </div>
        <div class="col-60">
            <input type=" text" style="width: 70%; "  id="quantity" value="" readonly>
        </div>
    </div>

    <div class="row">
        <div class="col-40">
            <label for="branch">Chi nhánh </label>
        </div>
        <div class="col-60">
            <input type=" text" style="width: 70%; font-size: 20px"  id="branch" value="" readonly>
        </div>
    </div>

    <div class="row">
        <div class="col-40">
            <label for="timeOrder">Giờ nhận bàn </label>
        </div>
        <div class="col-60">
            <input type=" text" style="width: 70%;font-size: 20px"  id="timeOrder" value="" readonly>
        </div>
    </div>

    <div class="row">
<%--        <button style="float: left ;background-color: #ff0101" class="button button1" type="submit">Xác nhận</button>--%>
        <button style="float: left;margin-bottom: 20px;" type="submit" class="button button1" onclick="openForm()">
            XÁC NHẬN</button>
    </div>

</div>
<script>
    function myFunction() {

        let d = new Date();
        let h = d.getHours();
        let day = d.getDate();
        let min = d.getMinutes()
        document.getElementById("customerName").value = getParameterByName('nameText');
        document.getElementById("phone").value = getParameterByName('phoneNum');
        document.getElementById("quantity").value =getParameterByName('quantity') + " người";
        document.getElementById("branch").value =getParameterByName('branchRadio');
        document.getElementById("timeOrder").value =getParameterByName('timeRadio')
            + "h "+ d.getFullYear() +"-"+d.getMonth()+"-"+ d.getDate();
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
