<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 18/05/2020
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Form</title>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/signin.css">
</head>
<body style="background-image: url(images/cover.jpg); background-size: cover; background-repeat: no-repeat">
<div class="user_card">
    <div class="d-flex logo_box">
        <div class="brand_logo_container">
            <a href="index.jsp">
                <img src="images/lauphan_logo.png"  class="brand_logo" alt="Logo">
            </a>
        </div>
    </div>
    <div class="message">
        <br><br><br><h4> Đăng nhập </h4><br>
    </div>
    <div class="d-flex justify-content-center form_container">
        <form class="login_form" method="post">
            <div class="input-group mb-3 user_box">
                <div class="input-group-append">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" name="username" class="form-control input_user" value="" placeholder="Tài khoản"
                       minlength="4" maxlength="30">
            </div>
            <div class="input-group mb-2 pass_box">
                <div class="input-group-append">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" name="password" class="form-control input_pass" value="" placeholder="Mật khẩu">
            </div>
            <div class="d-flex justify-content-center mt-3 login_container btn_box">
                <button name="button" class="btn btn-success"> Đăng nhập </button>
            </div>
        </form>
    </div>
    <div class="mt-4 signup_box">
        <div class="d-flex justify-content- center links">
            <a href="index.jsp" class="ml-2"> Quay lại trang chủ</a>
        </div>
    </div>
</div>
</body>
</html>