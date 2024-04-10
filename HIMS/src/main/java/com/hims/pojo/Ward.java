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
@TableName("Ward")
public class Ward {

  @TableId(value = "id",type = IdType.AUTO)
  private Long id;

  @TableField(value = "wardNo")
  private Long wardNo;

  @TableField(value = "departmentNo")
  private Long departmentNo;

  private Long type;
  private Long space;
  private Long state=0L;

  @TableField(value = "createTime")
  private String createTime;
}
