<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys"%>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 内容管理</title>
    <jsp:include page="../commons/header.jsp"></jsp:include>
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
                            <li class="breadcrumb-item active">内容列表</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <%--搜索框--%>
                <div class="row my_search" style="display: none">
                    <div class="col-md-12">
                        <div class="card card-info">
                            <%--搜索功能--%>
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        <input id="title" class="form-control" placeholder="请输入主标题"></input>
                                    </div>
                                    <div class="col-sm-3">
                                        <input id="subTitle" class="form-control" placeholder="请输入小标题"></input>
                                    </div>
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-default" onclick="dataTableSearch()"><i class="fas fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>

                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">内容列表</h3>
                                    <div style="padding-top: 30px">
                                        <a href="/content/form" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>添加</a>&nbsp;&nbsp;&nbsp;
                                        <button onclick="Check.deleteMulti('#')" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>删除</button>&nbsp;&nbsp;&nbsp;
                                        <a href="#" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>导入</a>&nbsp;&nbsp;&nbsp;
                                        <a href="#" type="button" class="btn btn-default btn-xs"><i class="fas fa-plus"></i>导出</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-primary btn-xs text-white" onclick="$('.my_search').css('display')=='none' ? $('.my_search').show('fast') : $('.my_search').hide('fast')"><i class="fas fa-search"></i>搜索</button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <table id="dataTable" class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>
                                                <%--          <label>
                                                              <input type="checkbox" class="check check_master">
                                                          </label>--%>
                                            </th>
                                            <th>ID</th>
                                            <th>标题</th>
                                            <th>小标题</th>
                                            <th>标题描述</th>
                                            <th>链接</th>
                                            <th>图片1</th>
                                            <th>图片2</th>
                                            <th>更新时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
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
<script>
    //成员变量，因为搜索方法需要使用变量，必须暴露出来
    var dataTable;
    $(function () {
        var columns = [
            {"data":function ( row, type, val, meta ) {
                    return '<label>' +
                        '<input type="checkbox" class="check check_one" id="'+row.id+'">'+
                        '<label>'
                }
            },
            { "data": "id" },
            { "data": "title" },
            { "data": "subTitle" },
            { "data": "titleDesc" },
            { "data": function (row, type, val, meta) {
                    return '<a href="'+row.url+'" target="_blank">查看</a>'
                }
            },
            { "data": function (row, type, val, meta) {
                    return '<a href="'+row.pic+'" target="_blank">查看</a>'
                }
            },
            { "data": "pic2" },
            { "data": function (row, type, val, meta) {
                    return DateTime.format(row.updated,"yyyy-MM-dd")
                }
            },
            {"data":function ( row, type, val, meta ) {
                    var showDetailUrl = "/content/detail?id="+row.id
                    return '<Button onclick="Check.showDetail(\''+showDetailUrl+'\')" type="button" class="btn btn-default btn-xs"><i class="fas fa-search"></i>查看</Button>&nbsp;&nbsp;&nbsp;'+
                        '<a href="/content/form?id='+row.id+'" type="button" class="btn btn-primary btn-xs text-white"><i class="fas fa-edit"></i>编辑</a>&nbsp;&nbsp;&nbsp;'+
                        '<a href="#" type="button" class="btn btn-danger btn-xs text-white"><i class="fas fa-trash"></i>删除</a>'
                }
            },
        ];
        dataTable=Check.initDataTable("/content/page",columns);
    });
    //搜索方法
    function dataTableSearch() {
        var title = $("#title").val();
        var subTitle = $("#subTitle").val();
        var param = {
            "title":title,
            "subTitle":subTitle
        };
        dataTable.settings()[0].ajax.data = param;
        dataTable.ajax.reload();
    }
</script>
</body>
</html>
