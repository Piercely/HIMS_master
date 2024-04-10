package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author bruce
 * @since 2021-08-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Patient implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("patientId")
    private String patientId;

    @TableField("patientName")
    private String patientName;

    private Integer gender;

    private Integer nation;

    private String birth;

    @TableField(exist = false)
    private String keshiName; //科室名字
    private Integer department;

    @TableField("certificateNo")
    private String certificateNo;

    @TableField("workUnit")
    private String workUnit;

    @TableField("maritalStatus")
    private Integer maritalStatus;

    @TableField("doctorId")
    private Integer doctorId;

    @TableField(exist = false)
    private String doctorName;

    @TableField("admissionTime")
    private String admissionTime;

    @TableField("homeAddress")
    private String homeAddress;

    @TableField("homePhone")
    private String homePhone;

    private String contacts;

    @TableField("contactsPhone")
    private String contactsPhone;

    @TableField("admissionStatus")
    private Integer admissionStatus;

    @TableField("roomType")
    private Integer roomType;

    @TableField("roomNo")
    private Integer roomNo;

    @TableField("bedNo")
    private Integer bedNo;

    private Integer state;

    @TableField("settlementState")
    private Integer settlementState;

    @TableField("leaveState")
    private Integer leaveState;

    @TableField("leaveTime")
    private String leaveTime;

}
