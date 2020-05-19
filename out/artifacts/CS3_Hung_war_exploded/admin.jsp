<%--
  Created by IntelliJ IDEA.
  User: hung
  Date: 19/05/2020
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Admin</title>
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-bg-dark static-top" style="background-color: #005cbf">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img height="100" width="120" src="images/Capture.PNG" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><svg class="bi bi-house-door-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path d="M6.5 10.995V14.5a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-7a.5.5 0 01.146-.354l6-6a.5.5 0 01.708 0l6 6a.5.5 0 01.146.354v7a.5.5 0 01-.5.5h-4a.5.5 0 01-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z"/>
                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 01.5-.5h1a.5.5 0 01.5.5z" clip-rule="evenodd"/></svg>Trang chu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Khuyen mai</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Dich vu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Lien he</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div id="all">
    <div style="text-align: center">
        <h1>Danh sach cua hang</h1>
    </div>
    <div  id="contex">
        <table align="center" cellpadding="5" border="5px" style="background-color: orange">
            <tr>
                <th>SO TT</th>
                <th>Cua hang</th>
            </tr>
            <tr>
                <td width="300px" height="60px">1</td>
                <td width="300px" height="60px"><a href="#">cua hang 1</a></td>
            </tr>
            <tr>
                <td width="300px" height="60px">2</td>
                <td width="300px" height="60px"><a href="#">cua hang 2</a></td>
            </tr>
            <tr>
                <td width="300px" height="60px">3</td>
                <td width="300px" height="60px"><a href="3">cua hang 3</a></td>
            </tr>
        </table>
    </div>


</div>
<!-- /.container -->

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
