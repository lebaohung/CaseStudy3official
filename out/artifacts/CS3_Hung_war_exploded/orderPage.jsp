<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="css/orderStyle.css" rel="stylesheet" type="text/css">
    <title>Order Page</title>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            text-align: center;
            position: relative;
            background-color: #fefefe;
            margin:0 auto;
            border: 1px solid #888;
            width: 40%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s
        }

        /* Add Animation */
        @-webkit-keyframes animatetop {
            from {top:-300px; opacity:0}
            to {top:0; opacity:1}
        }

        @keyframes animatetop {
            from {top:-300px; opacity:0}
            to {top:0; opacity:1}
        }

        .modal-header,.modal-footer  {
            text-align: center;
            background-color: #5cb85c;
            color: white;
        }
        .modal-header h2,.modal-footer h2  {
            text-align: center;
            background-color: #5cb85c;
            color: white;
        }

        .modal-body {padding: 2px 16px;}



    </style>
</head>
<body onload="displayTime()">
<%--<header></header>--%>
<%--<section></section>--%>
<%--<nav></nav>--%>
<article>
    <div>
        <table>
            <tr>
                <td class="orderTab"><a href="#selectBranch">SELECT BRANCH</a></td>
                <td class="orderTab"><a href="#selectTime">SELECT TIME</a></td>
                <td class="orderTab"><a href="#customerInfo">CUSTOMER INFORMATION</a></td>
            </tr>
        </table>
    </div>

    <div style="margin-top: 20px">
        <h1 style="text-align: center">LẨU PHAN</h1>
        <h3 style="text-align: center">Buffet bò úc ăn đến lúc phải bò thì thôi</h3>
    </div>

    <form class="form">
        <div style="margin-top: 50px;margin-bottom: 50px">
            <section class="form plan">
                <p style="font-style: oblique;font-size: 20px" id="selectBranch">
                    <span style="color: red;font-size: 30px">*</span> SELECT ONE BRANCH </p>
                <input type="radio" name="branchRadio" id="1" value="addr1" required>
                <label class="col" for="1">
                    <h3>Lẩu Phan Moncity</h3>
                    <h5>TT02 MonCity, ngõ 4 Hàm Nghi, Mỹ Đình 1, Cầu Giấy, Hà Nội</h5>
                </label>

                <input type="radio" name="branchRadio" id="2" value="addr2" required>
                <label class="col" for="2">
                    <h3>Lẩu Phan Hải Phòng</h3>
                    <h5>SN21 LÔ 8A4 ĐƯỜNG LÊ HỒNG PHONG</h5>
                </label>
                <input type="radio" name="branchRadio" id="3" value="addr3" required>
                <label class="col" for="3">
                    <h3>Lẩu Phan Phùng Khoang</h3>
                    <h5>21/2 Ngõ 67 Phùng Khoang,Từ Liêm,Hà Nội</h5>
                </label>
                <input type="radio" name="branchRadio" id="4" value="addr4" required>
                <label class="col" for="4">
                    <h3>Lẩu Phan Ðào Duy Anh</h3>
                    <h5>Số 7 Ðào Duy Anh , Ðống Ða, Hà Nội</h5>
                </label>
                <input type="radio" name="branchRadio" id="5" value="addr5" required>
                <label class="col" for="5">
                    <h3> Lẩu Phan Nguyễn Văn Cừ </h3>
                    <h5>Số 485 Nguyễn Văn Cừ , Long Biên , Hà Nội</h5>
                </label>
            </section>
        </div>
        <div style="margin-top: 50px;margin-bottom: 50px">
            <section class="plan">
                <p style="font-style: oblique;font-size: 20px" id="selectTime">
                    <span style="color: red;font-size: 30px">*</span> SELECT TIME </p>
                <div style="margin:0 auto;width: 70%">
                    <input type="radio" name="timeRadio" id="11" value="11" required>
                    <label class="colTime" for="11" id="label11">11:00</label>
                    <input type="radio" name="timeRadio" id="12" value="12" required>
                    <label class=" colTime" for="12" id="label12">12:00</label>
                    <input type="radio" name="timeRadio" id="13" value="13" required>
                    <label class="colTime" for="13" id="label13">13:00</label>
                    <input type="radio" name="timeRadio" id="14" value="14" required>
                    <label class="colTime" for="14" id="label14">14:00</label>
                    <input type="radio" name="timeRadio" id="15" value="15" required>
                    <label class="colTime" for="15" id="label15">15:00</label>
                    <input type="radio" name="timeRadio" id="16" value="16" required>
                    <label class="colTime" for="16" id="label16">16:00</label>
                    <input type="radio" name="timeRadio" id="17" value="17" required>
                    <label class="colTime" for="17" id="label17">17:00</label>
                    <input type="radio" name="timeRadio" id="18" value="18" required>
                    <label class="colTime" for="18" id="label18">18:00</label>
                    <input type="radio" name="timeRadio" id="19" value="19" required>
                    <label class="colTime" for="19" id="label19">19:00</label>
                    <input type="radio" name="timeRadio" id="20" value="20" required>
                    <label class="colTime" for="20" id="label20">20:00</label>
                    <input type="radio" name="timeRadio" id="21" value="21" required>
                    <label class="colTime" for="21" id="label21">21:00</label>
                    <input type="radio" name="timeRadio" id="22" value="22" required>
                    <label class="colTime" for="22" id="label22">22:00</label>
                </div>
            </section>
        </div>
        <div style="margin-top: 50px;margin-bottom: 10px">
            <p style="font-style: oblique;font-size: 20px" id="customerInfo">
                <span style="color: red;font-size: 30px">*</span> CUSTOMER INFORMATION </p>
            <table class="infoTable">
                <tr>
                    <td class="infoTd" style="background:#fcac81;">
                        <span style="color: red;background:#fcac81;">*</span>Customer Name
                        <p style="font-style: oblique; font-size: 20px;text-align: center;background:#fcac81;">
                            (<50 characters)</p>
                    </td>
                    <td class="infoTd" style="background:#fcac81;">
                        <span style="color: red;background:#fcac81;">*</span> Phone Number
                        <p style="font-style: oblique; font-size: 20px;text-align: center;background:#fcac81;">
                            (9-12 digits)</p>
                    </td>
                    <td class="infoTd" style="background:#fcac81;">
                        <span style="color: red;background:#fcac81;">*</span> Number Of People
                        <p style="font-style: oblique; font-size: 20px;text-align: center;background:#fcac81;">
                            (1-20 people)</p>
                    </td>
                </tr>
                <tr>
                    <td class="infoTd"><input type="text" name="nameText" id="nameText" style="width: 100%"
                                              minlength="5"
                                              maxlength="50" pattern="[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻ
                                              ẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜở
                                              ỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ\s]+"
                                              required></td>
                    <td class="infoTd">
                        <input type="text" name="phoneNum" id="phoneNum" style="width: 100%"
                               pattern="[0-9]{9,12}" required>
                    </td>

                    <td class="infoTd">
                        <input type="number" id="quantity" name="quantity" min="1" max="20" style="width: 100%"
                               required>

                    </td>
                </tr>
            </table>
        </div>

        <div style="margin-top: 50px;margin-bottom: 10px">
            <button type="submit" class="button button1">NEXT</button>
        </div>
    </form>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>WE ARE CLOSED!</h2>
                <span class="close">&times;</span>
            </div>
            <div class="modal-body">
                <h3>Sorry it's too late</h3>
                <h3>Please comeback tomorrow </h3>
            </div>
            <div class="modal-footer">
                <h2>LAU PHAN</h2>
            </div>
        </div>
    </div>
    </div>

</article>
<%--<aside></aside>--%>
<%--<footer></footer>--%>


<script>
    function displayTime() {
        const CLOSED_TIME =22;
        let d = new Date();
        let h = d.getHours();
        let day = d.getDate();
        let min = d.getMinutes()
        let radioButtons = document.getElementsByName("timeRadio");
        let modal = document.getElementById("myModal");
        let btn = document.getElementById("myBtn");
        let span = document.getElementsByClassName("close")[0];

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        for (let i = 0; i < radioButtons.length; i++) {
            if (h >= radioButtons[i].value) {
                radioButtons[i].disabled = true;
                radioButtons[i].style.background = 'red';
                document.getElementById("label" + (i + 11)).style.background = '#ff4141';
            }
            if  (h>=CLOSED_TIME){
                modal.style.display = "block";
            }
        }
    }
</script>
</body>
</html>