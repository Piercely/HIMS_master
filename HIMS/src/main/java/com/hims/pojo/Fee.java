package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2021-08-31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fee implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("patientId")
    private String patientId;

    @TableField("patientName")
    private String patientName;

    @TableField("feeType")
    private String feeType;

    private Double fee;


}
