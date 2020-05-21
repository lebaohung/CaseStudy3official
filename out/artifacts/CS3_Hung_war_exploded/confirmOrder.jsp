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
    <form action="servlet.java" onsubmit="openForm()">
        <div class="row">
            <div class="col-40">
                <label for="nameText" style="padding-left: 10px">Tên khách hàng </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%;font-size: 20px" id="nameText" name="nameText" value="" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="phone" style="padding-left: 10px">Điện thoại </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%; " name="phoneNum" id="phone" value="" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="quantity" style="padding-left: 10px">Số người ăn </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%; " name="quantity" id="quantity" value="" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="branchRadio" style="padding-left: 10px ;" >Chi nhánh </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%; font-size: 20px"name="branchRadio" id="branchRadio" value="" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="timeRadio" style="padding-left: 10px">Ngày nhận bàn </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%;font-size: 20px" name="dateOrder" id="dateOrder" value=""
                       readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-40">
                <label for="timeRadio" style="padding-left: 10px">Giờ nhận bàn (Giờ) </label>
            </div>
            <div class="col-60">
                <input type=" text" style="width: 70%;font-size: 20px" name="timeRadio" id="timeRadio" value=""
                       readonly>
            </div>
        </div>

        <div class="row">
            <button style="float: left;margin-bottom: 20px;left: 30%" type="submit" class="button button1"
                   >XÁC NHẬN</button>
        </div>

        <div class="row">
                <button style="float: left;margin-bottom: 20px;left: 40%" class="button button1" type="button"
                onclick="history.back()"
                >QUAY LẠI</button>
        </div>
    </form>
</div>
        <div id="confirmPopUp">
            <h2 style="text-align: center;margin-bottom: 50px;margin-top: 10px;  background-color: #fcac81;
">BẠN ĐÃ ĐẶT BÀN THÀNH CÔNG</h2>
            <p style="background-color: #fcac81"> Khách hàng: </p>
            <p style="background-color: #fcac81"> Mã khách: </p>
            <p style="background-color: #fcac81">Địa chỉ chi nhánh: </p>
            <p style="background-color: #fcac81">Trong trường hợp quý khách muốn hủy đơn hoặc chuyển giờ xin vui lòng liên hệ với tổng đài hỗ trợ
                muộn nhất 15 phút trước giờ ăn. </p>
            <div class="row">
                <a href="index.jsp">
                <button  style="float: left;margin-bottom: 20px;" class="button button1">OK</button></a>
            </div>
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
                    document.getElementById("timeRadio").value = getParameterByName('timeRadio');
                    document.getElementById("dateOrder").value = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDate();

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

                function openForm() {
                    alert("Đặt hàng thành công")
                    document.getElementById("confirmContent").style.display = "none";
                    document.getElementById("confirmPopUp").style.display = "block";
                }
            </script>

</body>
</html>
