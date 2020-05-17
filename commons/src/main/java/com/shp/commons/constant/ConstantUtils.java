package com.shp.commons.constant;

public class ConstantUtils {
    public static final String SESSION_USER = "user";
    public static final String USER_COOKIE_INFO="userInfo";
    public static final int STATUS_SUCCESS=200;
    public static final int STATUS_FAIL=500;
    //正则表达式验证手机号
    public static final String PHONE="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    //正则表达式验证邮箱
    public static final String EMAIL="\\w+(\\.\\w)*@\\w+(\\.\\w{2,3}){1,3}";
}
