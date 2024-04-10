package com.hims.pojo;


public class DrugVo extends Drug {

    private String rukuStartTime;
    private String rukuEndTime;

    private String guoqiStartTime;
    private String guoqiEndTime;

    public String getRukuStartTime() {
        return rukuStartTime;
    }

    public void setRukuStartTime(String rukuStartTime) {
        this.rukuStartTime = rukuStartTime;
    }

    public String getRukuEndTime() {
        return rukuEndTime;
    }

    public void setRukuEndTime(String rukuEndTime) {
        this.rukuEndTime = rukuEndTime;
    }

    public String getGuoqiStartTime() {
        return guoqiStartTime;
    }

    public void setGuoqiStartTime(String guoqiStartTime) {
        this.guoqiStartTime = guoqiStartTime;
    }

    public String getGuoqiEndTime() {
        return guoqiEndTime;
    }

    public void setGuoqiEndTime(String guoqiEndTime) {
        this.guoqiEndTime = guoqiEndTime;
    }
}
