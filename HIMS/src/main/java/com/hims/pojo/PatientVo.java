package com.hims.pojo;

public class PatientVo extends Patient{

    private String ruyuanStartTime;
    private String ruyuanEndTime;

    private String chuyuanStartTime;
    private String chuyuanEndTime;

    public String getRuyuanStartTime() {
        return ruyuanStartTime;
    }

    public void setRuyuanStartTime(String ruyuanStartTime) {
        this.ruyuanStartTime = ruyuanStartTime;
    }

    public String getRuyuanEndTime() {
        return ruyuanEndTime;
    }

    public void setRuyuanEndTime(String ruyuanEndTime) {
        this.ruyuanEndTime = ruyuanEndTime;
    }

    public String getChuyuanStartTime() {
        return chuyuanStartTime;
    }

    public void setChuyuanStartTime(String chuyuanStartTime) {
        this.chuyuanStartTime = chuyuanStartTime;
    }

    public String getChuyuanEndTime() {
        return chuyuanEndTime;
    }

    public void setChuyuanEndTime(String chuyuanEndTime) {
        this.chuyuanEndTime = chuyuanEndTime;
    }
}
