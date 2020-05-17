<%--
  Created by IntelliJ IDEA.
  User: sunhuapeng
  Date: 2020/1/24
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--模态框--%>
<div class="modal fade" id="modal-detail">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">查看详情</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="model_detailBody"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- jQuery -->
<script src="../static/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../static/plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../static/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../static/js/adminlte.min.js"></script>
<%--JQuery Validation--%>
<script src="../static/plugins/jquery-validation/jquery.validate.min.js"></script>
        <%--错误：报错因为上面这个和下面这个顺序不正确，注意添加顺序--%>
<script src="../static/plugins/jquery-validation/additional-methods.min.js"></script>
<script src="../static/plugins/jquery-validation/localization/messages_zh.min.js"></script>
<%--icheck--%>
<script src="../static/plugins/icheck/icheck.min.js"></script>
<!-- DataTables -->
<script src="../static/plugins/datatables/jquery.dataTables.js"></script>
<script src="../static/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<%--appjs 自定义js--%>
<script src="../static/appjs/validate.js"></script>
<script src="../static/appjs/checkbox.js"></script>
<%--自定义时间插件--%>
<script src="../static/appjs/dateTime.js"></script>
