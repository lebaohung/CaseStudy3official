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
    <link rel="stylesheet" href="css/signup-signin.css">
</head>
<body>
<div class="container h-100">
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex logo_box">
                <div class="brand_logo_container">
                    <img src="images/lauphan_logo.png" class="brand_logo" alt="Logo">
                </div>

            </div>
            <div class="message">
                <br><br><br><h4> Sign-in for more information </h4><br>
            </div>
            <div class="d-flex justify-content-center form_container">
                <form class="login_form">
                    <div class="input-group mb-3 user_box">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="" class="form-control input_user" value="" placeholder="username">
                    </div>
                    <div class="input-group mb-2 pass_box">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="" class="form-control input_pass" value="" placeholder="password">
                    </div>
                    <div class="d-flex justify-content-center mt-3 login_container btn_box">
                        <button type="button" name="button" class="btn btn-success">Login</button>
                    </div>
                </form>
            </div>
            <div class="mt-4 signup_box">
                <div class="d-flex justify-content-center links">
                    Don't have an account? <a href="#" class="ml-2">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>