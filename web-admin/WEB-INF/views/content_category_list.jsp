<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 内容管理</title>
    <jsp:include page="../commons/header.jsp"></jsp:include>
    <link href="../static/plugins/treetable/css/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <link href="../static/plugins/treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="../commons/nav.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">内容管理</h1>
                        <c:if test="${save!=null}">
                            <div class="alert alert-${save.status==200 ? "success":"danger"} alert-dismissible" style="margin-top: 15px;margin-bottom: -10px">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    ${save.message}
                            </div>
                        </c:if>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">分类列表</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">分类列表</h3>
                                    <div style="padding-top: 30px">
                                        <a href="#" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>添加</a>&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <table id="treeTable" class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>名字</th>
                                            <th>排序</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${tbContentCategoryList}" var="category">
                                            <tr data-tt-id="${category.id}" data-tt-parent-id="${category.parentId}">
                                                <td>${category.id}</td>
                                                <td>${category.name}</td>
                                                <td>${category.sortOrder}</td>
                                                <td>
                                                    <a href="#" type="button" class="btn btn-primary btn-xs text-white"><i class="fas fa-edit"></i>编辑</a>&nbsp;&nbsp;&nbsp;
                                                    <a href="#" type="button" class="btn btn-danger btn-xs text-white"><i class="fas fa-trash"></i>删除</a>&nbsp;&nbsp;&nbsp;
                                                    <a href="#" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>新增</a>&nbsp;&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- Main Footer -->
    <jsp:include page="../commons/copyright.jsp"></jsp:include>
</div>
<jsp:include page="../commons/footer.jsp"></jsp:include>
<%--自定义对话框需要jquery，放在footer下面或者在对话框种引入jquery--%>
<sys:myModel></sys:myModel>
<script src="../static/plugins/treetable/js/jquery.treetable.js"></script>
<script>
    $("#treeTable").treetable({
        expandable : true,
        clickableNodeNames:true,
        column:1,
    });
</script>
</body>
</html>
