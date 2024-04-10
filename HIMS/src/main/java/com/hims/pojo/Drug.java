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
 * 
 * </p>
 *
 * @author bruce
 * @since 2021-08-26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Drug implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("drugId")
    private String drugId;

    private String drugname;

    private String manufaturer;

    private Float price;

    @TableField("validityDay")
    private Integer validityDay;

    @TableField("validityYear")
    private Integer validityYear;

    @TableField("validityMouth")
    private Integer validityMouth;

    private String supply;

    @TableField("addNum")
    private Integer addNum;

    @TableField("createTime")
    private String createTime;

    @TableField("productionTime")
    private String productionTime;

    @TableField("validityTime")
    private String validityTime;

}
