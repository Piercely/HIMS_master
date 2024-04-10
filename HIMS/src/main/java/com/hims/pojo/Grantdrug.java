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
 * @since 2021-08-30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Grantdrug implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;

    @TableField("drugId")
    private String drugId;

    @TableField("drugName")
    private String drugName;

    @TableField("drugPrice")
    private Float drugPrice;

    @TableField("drugCount")
    private Integer drugCount;

    @TableField("patientName")
    private String patientName;

    @TableField("patientId")
    private String patientId;

    @TableField("grantUserId")
    private String grantUserId;

    @TableField("grantUserName")
    private String grantUserName;

    @TableField("grantTime")
    private String grantTime;
}
