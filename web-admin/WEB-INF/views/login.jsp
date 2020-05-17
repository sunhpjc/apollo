<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的商城 | 登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../static/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../static/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <%--
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    --%>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>我的商城</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">欢迎管理员登录</p>

            <form action="/login" method="post" >
                <div class="alert alert-danger alert-dismissible" ${message==null ? "style='display:none';":"style=''"}>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>${message}
                </div>
                <div class="input-group mb-3">
                    <input name="email" type="email" class="form-control" placeholder="Email" value="${email}">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input name="password" type="password" class="form-control" placeholder="Password" value="${password}">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember" name="isEmpty" ${isEmpty==true?"checked":""}>
                            <label for="remember">
                                记住我
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <p class="mb-1">
                <a href="forgot-password.html">忘记密码</a>
            </p>
            <p class="mb-0">
                <a href="register.html" class="text-center">注册</a>
            </p>
        </div>
        <!-- /.login-card-body -->
    </div>
</div>
</div>
<!-- jQuery -->
<script src="../static/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../static/js/adminlte.min.js"></script>
</body>
</html>