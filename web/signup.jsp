<%--
  Created by IntelliJ IDEA.
  User: phdan
  Date: 20/05/2020
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register Form</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/signup.css">
</head>
<body style="background-image: url(images/cover.jpg)">
<div class="container">
    <div class="logo_brand">
        <a href="index.jsp">
            <img src="images/lauphan_logo.png" id="logo" height="120" width="120"/>
        </a>
    </div>
    <div class="card-header">
        <h2>Register</h2>
    </div>
    <form class="infor_box" method="post" action="#">
        <div class="input-group name">
            <label for="name" class="cols-sm-2 control-label">Họ và Tên </label>
            <input type="text" class="form-control" name="name" id="name"
                   placeholder="Tên của bạn..." minlength="5" maxlength="50" pattern="[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầ
                                                      ẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLm
                                                      MnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪử
                                                      ỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ\s]+" required/>
        </div>
        <div class="input-group email">
            <label for="email" class="cols-sm-2 control-label">Email</label>
            <input type="text" class="form-control" name="email" id="email"
                   placeholder="Email của bạn..." pattern="^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$" required/>
        </div>
        <div class="input-group dob">
            <label for="dob" class="cols-sm-2 control-label">Ngày sinh</label>
            <input type="text" class="form-control" name="dob" id="dob"
                   placeholder="Ngày sinh của bạn: dd-mm-yyyy..." pattern="^[0-9][0-9]-[0-1][0-9]-[1-2][0-9]{3}$"
                   required/>
        </div>
        <div class="input-group phonenumber">
            <label for="phonenumber" class="cols-sm-2 control-label">SĐT</label>
            <input type="text" class="form-control" name="phonenumber" id="phonenumber"
                   placeholder="Số điện thoại của bạn..." minlength="10" maxlength="12" pattern="[0-9]{10-12}" required/>
        </div>
        <div class="input-group username">
            <label for="username" class="cols-sm-2 control-label">Tài khoản</label>
            <input type="text" class="form-control" name="username" id="username"
                   placeholder="Tài khoản của bạn..." minlength="4" maxlength="30" pattern="[a-zA-Z0-9]+" required/>
        </div>

        <div class="input-group password">
            <label for="password" class="cols-sm-2 control-label">Mật khẩu</label>
            <input type="password" class="form-control" name="password" id="password"
                   placeholder="Mật khẩu của bạn..." minlength="5" maxlength="50" required/>
        </div>
        <div class="form-group btn_regis">
            <button type="submit" class="btn btn-success login-button">Đăng ký</button>
        </div>
    </form>
</div>
</body>
</html>
