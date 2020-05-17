/*
* 函数对象——> 默认闭包，更安全--->闭包特性，私有化（类似于私有函数）
* */
var Validate = function () {
    //下面是函数
    //初始化validation
    var handlerInitValidate = function () {
        $.validator.addMethod("phone",function (value,element) {
            var length=value.length;
            var phone="^((13[0-9])|(15[^4,\D])|(18[0,5-9]))\d{8}$";
            return
        },"手机号码格式错误");
    };
    $("#inputForm").validate({
        errorElement:'span',
        errorClass:'help-block',
        errorPlaceMent:function (error,element) {
            element.attr("class","is-invalid");
            error.insertAfter(element);
        }
    });
    //因为是私有的，所以需要暴露给外部
    return{
        init:handlerInitValidate
    }
}();//加了括号表示函数对象

//和在表单中使用    $(function () {
//         Validate.init();
//     });效果一样，使用这种方法可以在引用js的时候初始化---注意如果未生效，查看网页源代码，强制刷新
//初始化js
$(document).ready(function () {
    Validate.init();
});
