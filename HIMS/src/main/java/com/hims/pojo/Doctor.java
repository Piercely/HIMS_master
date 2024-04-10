package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2021-08-25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Doctor implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "doctorId", type = IdType.AUTO)
    private Integer doctorId;

    private Integer gender;

    private Integer doctorDepartment;

    @TableField(exist = false)
    private String keshiName;  //扩展字段，这个字段不是数据库中

    private String name;

    private Integer doctorTitle;
    @TableField(exist = false)
    private String zhichengName;//扩展字段，这个字段不是数据库中

    private String workingTime;

    private Integer state;

}
