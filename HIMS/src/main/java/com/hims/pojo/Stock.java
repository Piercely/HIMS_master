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
 * @since 2021-08-26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Stock implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("drugId")
    private String drugId;

    @TableField("drugName")
    private String drugName;

    private Float price;

    private Integer count;

    public Stock(String drugId, String drugName, Float price, Integer count) {
        this.drugId = drugId;
        this.drugName = drugName;
        this.price = price;
        this.count = count;
    }
}
