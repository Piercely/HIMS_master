package com.hims.pojo;

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
 * @since 2021-08-31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cost implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("Id")
    private String Id;

    @TableField("patientId")
    private String patientId;

    @TableField(exist = false)
    private String patientName;

    private Float account;

    private String type;

    @TableField("userId")
    private String userId;

    @TableField("costTime")
    private String costTime;

}
