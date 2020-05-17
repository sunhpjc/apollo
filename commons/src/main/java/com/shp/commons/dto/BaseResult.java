package com.shp.commons.dto;
/*
* 自定义返回结果
* */
import java.io.Serializable;

import static com.shp.commons.constant.ConstantUtils.*;

public class BaseResult implements Serializable {
    private int status;
    private String message;
    private Object data;

    //消息重构模板
    public static BaseResult create(int status,String message,Object data){
        BaseResult baseResult = new BaseResult();
        baseResult.setStatus(status);
        baseResult.setMessage(message);
        baseResult.setData(data);
        return baseResult;
    }
    //成功
    public static BaseResult success(){
        return create(STATUS_SUCCESS,"成功",null);
    }
    public static BaseResult success(String message){
        return create(STATUS_SUCCESS,message,null);
    }
    //带data的数据
    public static BaseResult success(String message,Object data){
        return create(STATUS_SUCCESS,message,data);
    }
    //失败
    public static BaseResult fail(){
        return create(STATUS_FAIL,"失败",null);
    }
    public static BaseResult fail(String message){
        return create(STATUS_FAIL,message,null);
    }
    public static BaseResult fail(int status,String message){
        return create(status,message,null);
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
