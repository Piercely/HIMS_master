package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 床位费用计算表
 * </p>
 *
 * @author bruce
 * @since 2021-08-31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wardupdate implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("patientId")
    private String patientId;

    @TableField("roomType")
    private Integer roomType;

    /**
     * 住院日期,与patient表的admissionTime字段保持一致
     */
    @TableField("inTime")
    private String inTime;

    @TableField("outTime")
    private String outTime;
}
