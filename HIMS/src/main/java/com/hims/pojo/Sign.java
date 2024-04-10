package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sign implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "signId", type = IdType.AUTO)
    private Integer signId;

    @TableField("patientId")
    private String patientId;

    @TableField("measureTime")
    private String measureTime;

    @TableField("userId")
    private String userId;

    private Float temperature;

    @TableField("bloodPressure")
    private String bloodPressure;

    private Integer pulse;

    private String remarks;

    @TableField("userName")
    private String userName;

    @TableField("createTime")
    private String createTime;

    private Integer breathing;

    @TableField("bloodSugar")
    private Float bloodSugar;

    private Float vein;
}
