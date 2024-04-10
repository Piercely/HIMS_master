package com.hims.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("Category")
public class Category {

  @TableId(value = "id",type = IdType.AUTO)
  private Long id;
  private Long type=null;
  private String name;
  private Double price;

  @TableField(value = "updateTime")
  private String updateTime;
}
