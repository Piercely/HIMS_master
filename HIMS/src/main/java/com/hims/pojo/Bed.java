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
 * @since 2021-08-27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bed implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "bedId", type = IdType.AUTO)
    private Integer bedId;

    private Integer ward;

    @TableField("bedNo")
    private Integer bedNo;

    private Integer state;

}
