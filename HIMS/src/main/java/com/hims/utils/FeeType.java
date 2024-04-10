package com.hims.utils;

public enum FeeType {

    YUJIAO_FEE(1,"预缴费用"),
    DRUG_FEE(2,"用药费用"),
    TUIDRUG_FEE(3,"退药费用"),
    VIP_ROOM_FEE(4,"VIP(1人)病床费用"),
    HIGH_ROOM_FEE(5,"高等(2人)病床费用"),
    NORMAL_ROOM_FEE(6,"初级(4人)病床费用"),
    ICU_ROOM_FEE(7,"重症监护室(ICU_1人)病床费用");

    private int type;
    private String msg;

    public int getType() {
        return type;
    }

    public String getMsg() {
        return msg;
    }

    FeeType(int type, String msg){
        this.type=type;
        this.msg=msg;
    }

}
