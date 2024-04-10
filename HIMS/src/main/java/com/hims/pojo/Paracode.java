package com.hims.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("Paracode")
public class Paracode {

  @TableId(value = "code_id",type = IdType.AUTO)
  private Long codeId;

  private String code;
  private Long parameterValues;
  private String parameterName;

}
