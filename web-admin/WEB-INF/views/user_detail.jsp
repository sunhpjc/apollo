<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 用户详情</title>
    <jsp:include page="../commons/header.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="box-body">
        <table id="dataTable" class="table">
            <tbody>
            <tr>
                <td>ID</td>
                <td>${user.id}</td>
            </tr>
            <tr>
                <td>姓名</td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td>${user.email}</td>
            </tr>
            </tbody>
        </table>
    </div>
<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>