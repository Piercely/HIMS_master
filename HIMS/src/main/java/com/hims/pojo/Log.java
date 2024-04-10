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
 * 
 * </p>
 *
 * @author bruce
 * @since 2021-09-01
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Log implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("userId")
    private String userId;

    private String type;

    private String createTime;

    @TableField("methodInfo")
    private String methodInfo;

    @TableField("logDescription")
    private String logDescription;

    @TableField("methodParms")
    private String methodParms;

    @TableField("methodReturn")
    private Object methodReturn;

    @TableField("exMsg")
    private Object exMsg;

}
