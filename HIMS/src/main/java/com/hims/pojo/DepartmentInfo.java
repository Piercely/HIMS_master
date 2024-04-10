package com.hims.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DepartmentInfo {

    private Long departmentId;
    private String departmentName;
    private Long bedNum;
    private Long usedNum;
    private Long unUsedNum;
    private Double percent;
}
