<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys"%>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 内容管理</title>
    <jsp:include page="../commons/header.jsp"></jsp:include>
    <%--zTree--%>
    <link rel="stylesheet" href="../static/plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%--dropzone--%>
    <link rel="stylesheet" href="../static/plugins/dropzone/css/dropzone.css">
    <link rel="stylesheet" href="../static/plugins/dropzone/css/style.css">
    <%--wangEditor--%>
    <link rel="stylesheet" href="../static/plugins/wangEditor-3.1.1/wangEditor.min.css">
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
                            <li class="breadcrumb-item active">内容管理</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10">
                        <!-- Horizontal Form -->
                        <div class="card card-info">
                            <div class="card-header">
                                <%--这里使用下面返回的modelAttribute属性恶user,否则不能识别--%>
                                <h3 class="card-title">${tbContent.id==null ? "新增" : "编辑"}信息</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form:form id="inputForm" class="form-horizontal" action="/content/save" method="post" modelAttribute="tbContent">
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="name" class="col-sm-2 col-form-label">父级类目：</label>
                                        <div class="col-sm-10" data-toggle="modal" data-target="#modal-default">
                                            <form:hidden path="categoryId"></form:hidden>
                                            <input id="name" class="required form-control" readonly="true" placeholder="类目名字"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="title" class="col-sm-2 col-form-label">主标题：</label>
                                        <div class="col-sm-10">
                                            <form:input path="title" class="required form-control" placeholder="主标题"></form:input>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="subTitle" class="col-sm-2 col-form-label">小标题：</label>
                                        <div class="col-sm-10">
                                            <form:input path="subTitle" class="required form-control" placeholder="小标题"></form:input>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="titleDesc" class="col-sm-2 col-form-label">标题描述：</label>
                                        <div class="col-sm-10">
                                            <form:input path="titleDesc" class="required form-control" placeholder="标题描述："></form:input>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pic" class="col-sm-2 col-form-label">图片1：</label>
                                        <div class="col-sm-10">
                                            <form:input path="pic" class="required form-control" placeholder="图片" readonly="true"></form:input>
                                            <div id="dropz" class="dropzone"></div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">详情：</label>
                                        <div class="col-sm-10">
                                            <%--<form:input path="pic" class="required form-control" placeholder="图片"></form:input>--%>
                                            <form:hidden path="content"></form:hidden>
                                                <div id="editor">
                                                    ${tbContent.content}
                                                </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <button type="submit" id="submitForm" class="btn btn-info">提交</button>
                                    <button type="button" class="btn btn-default float-right" onclick="history.go(-1)">取消</button>
                                </div>
                                <!-- /.card-footer -->
                            </form:form>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <!-- Main Footer -->
    <jsp:include page="../commons/copyright.jsp"></jsp:include>

</div>
<jsp:include page="../commons/footer.jsp"></jsp:include>
<sys:myModel title="请选择" message='<ul id="treeContent" class="ztree"></ul>'></sys:myModel>
<%--zTree--%>
<script type="text/javascript" src="../static/plugins/zTree/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript">
    /*zTree*/
    var setting = {
        view: {
            selectedMulti: false
        },
        async: {
            enable: true,
            url:"/content/category_treeData",
            /*当节点是父节点的时候，将id属性自动往后传*/
            autoParam:["id"]
        }
    };
    $(document).ready(function(){
        $.fn.zTree.init($("#treeContent"), setting);
        $("#idModal").bind("click",function () {
            var zTree = $.fn.zTree.getZTreeObj("treeContent");
            var nodes = zTree.getSelectedNodes();
            if(nodes.length==0){
                alert("请先选择一个节点");
            }
            else{
                var node = nodes[0];
                $("#categoryId").val(node.id);
                $("#name").val(node.name);
                $("#modal-default").modal("hide")
            }
        })
    });
</script>
<%--dropzone--%>
<script type="text/javascript" src="../static/plugins/dropzone/js/dropzone.js"></script>
<script>
    Dropzone.options.dropz={
        url: "/upload",
        paramName: "dropFile",
        dictDefaultMessage: '拖动文件至此或者点击上传',
        init: function (){
            this.on("success", function (file, data) {
                // 上传成功触发的事件
                $("#pic").val(data.fileName);
            });
        }
    }
/*    var myDropzone = new Dropzone("#dropz", {
        url: "/upload",
        paramName: "dropFile",
        dictDefaultMessage: '拖动文件至此或者点击上传',
        init: function (){
            this.on("success", function (file, data) {
                // 上传成功触发的事件
                $("#pic").val(data.fileName);
            });
        }
    });*/
</script>
<%--wangEditor--%>
<script src="../static/plugins/wangEditor-3.1.1/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '/upload'
    //自定义fileName
    editor.customConfig.uploadFileName = 'dropFile'
    // 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
    // 限制一次最多上传 5 张图片
    editor.customConfig.uploadImgMaxLength = 5
    editor.create()

    $("#submitForm").bind('click', function () {
        // 读取 html
        $("#content").val(editor.txt.html());
    });


</script>
</body>
</html>
