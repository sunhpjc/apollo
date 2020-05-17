package com.shp.commons.commonsutils;

import static com.shp.commons.constant.ConstantUtils.EMAIL;
import static com.shp.commons.constant.ConstantUtils.PHONE;

public class RegexpUtils {
    //验证手机
    public static boolean checkPhone(String phone){
        return phone.matches(PHONE);
    }
    //验证邮箱
    public static boolean checkEmail(String email){
        return email.matches(EMAIL);
    }
}
