package com.hims.utils;

import java.io.Serializable;

/**
 * @BelongsProject: springboot2020
 * @BelongsPackage: com.it.utils
 * @CreateTime: 2020-10-30 14:53
 * @Description: TODO
 */
public class ResultCommon {

    private int code;
    private String msg;
    private Object data;

    public ResultCommon(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static ResultCommon success(ResultCode resultCode){
        ResultCommon resultCommon = new ResultCommon(resultCode.getCode(), resultCode.getMsg());
        return resultCommon;
    }

    public static ResultCommon success(ResultCode resultCode, Object data){
        ResultCommon success = success(resultCode);
        success.setData(data);
        return success;
    }

    public static ResultCommon fail(ResultCode resultCode){
        return success(resultCode);
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "返回值JSON{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
