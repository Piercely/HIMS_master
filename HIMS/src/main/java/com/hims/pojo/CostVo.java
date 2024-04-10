package com.hims.pojo;

public class CostVo extends Cost{

    private String costStartTime;
    private String costEndTime;

    public String getCostStartTime() {
        return costStartTime;
    }

    public void setCostStartTime(String costStartTime) {
        this.costStartTime = costStartTime;
    }

    public String getCostEndTime() {
        return costEndTime;
    }

    public void setCostEndTime(String costEndTime) {
        this.costEndTime = costEndTime;
    }
}
