var Check = function () {
    //iCheck两个私有属性
    var check_master;
    var check_one;
    //数组私有属性,用存放id
    var idArray;

    //激活iCheck
    var handlerInitCheck=function () {
        //激活iCheck
        $(document).ready(function(){
            $('input[type="checkbox"].check').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
            });
        });
        //获取控制端
        check_master = $('input[type=checkbox].check_master');
        //获取所有
        check_one = $('input[type=checkbox].check_one');
    };
    //全选功能（全选按钮失效了，bug暂时未解决）
    var handlerCheckAll = function () {
        check_master.on('ifClicked',function (e) {
            //true表示未选中
            if(e.target.checked){
                check_one.iCheck("uncheck")
            }
            //否则选中
            else{
                check_one.iCheck("check")
            }
        });
    };
    //批量删除
    var handlerDeleteMulti = function (url) {
        idArray = new Array();
        //批量删除
        check_one.each(function () {
            var id=$(this).attr('id');
            if(id !=null && id != "undefined" && $(this).is(":checked")){
                idArray.push(id);
            }
            //不必判断是否为null，因为初始化数组已经new Array()
            if(idArray.length===0){
                $("#model_message").html("您还没有选择任何数据项，请至少选择一项")
            }
            else {
                $("#model_message").html("您确定删除吗")
            }
            $("#modal-default").modal("show");
        });
        //绑定模态框点击事件
        $("#idModal").bind("click",function () {
            del();
        });
        //当前私有函数中嵌套一个私有函数
        function del() {
            //如果没有选择项，则关闭模态框
            $("#modal-default").modal("hide");
            if(idArray.length===0){
                //如果没有id，则暂时不进行操作
            }
            //否则删除操作
            else{
                setTimeout(function () {
                    $.ajax({
                        "url":url,
                        "type":"POST",
                        "data":{"idArray":idArray.toString()},
                        "dataType":"JSON",
                        "success":function (data) {
                            if(data.status==200){
                                $("#model_message").html(data.message);
                                $(".modal-footer").hide();
                                $("#modal-default").modal("show");
                                setTimeout(function () {
                                    window.location.reload();
                                },800)
                            }
                            else {
                                $("#idModal").unbind();
                                $("#idModal").bind("click",function () {
                                    $("#modal-default").modal("hide");
                                });
                                $("#model_message").html(data.message)
                                $("#modal-default").modal("show");
                            }
                        }
                    });
                },500);
            }
        }
    };
    //DataTables插件分页，服务器模式加载数据
    var handlerInitDataTables = function (url,colums) {
        var dataTable=$("#dataTable").DataTable({
            "info":true,
            "lengthChange":false,
            "ordering":false,
            "processing": true,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": url,
            },
            "columns": colums,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "fnDrawCallback": function( settings ) {
                handlerInitCheck();
            }
        });
        return dataTable;
    };
    //详情页
    var handlerDetail = function (url) {
        $.ajax({
            "url":url,
            "type":"GET",
            "dataType":"html",
            "success":function (data) {
                $("#model_detailBody").html(data);
                $("#modal-detail").modal("show");
            }
        });
    }
    return{
        init: function () {
            handlerInitCheck();
            //功能bug暂时未解决
            //handlerCheckAll();
        },
        deleteMulti:function (url) {
            handlerDeleteMulti(url);
        },
        initDataTable:function (url,columns) {
            //需要return，否则user_list.jsp得不到dataTable
            return handlerInitDataTables(url,columns)
        },
        showDetail:function (url) {
            handlerDetail(url);
        }
    }
}();

$(document).ready(function () {
    Check.init();
});
