package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
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
public class Withdrawal implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("patientId")
    private String patientId;

    @TableField("patientName")
    private String patientName;

    private Integer count;

    @TableField("userName")
    private String userName;

    @TableField("userId")
    private String userId;

    @TableField("drugsId")
    private String drugsId;

    @TableField("entiyTime")
    private String entiyTime;

    private String reason;

}
