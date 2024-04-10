package com.hims.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
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
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "user_id")
    private String userId;

    private String userName;

    private String userPassword;

    private String userPhone;

    private Integer userDescribe;

    @TableField(exist = false) //扩展字段
    private String shenfenName;

    private String createTime;

    private Integer userDel;

}
