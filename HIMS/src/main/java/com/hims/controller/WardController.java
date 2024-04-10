package com.hims.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Ward;
import com.hims.service.WardService;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("ward")
public class WardController {

    @Autowired
    WardService wardService;

    /**
     * 01-异步请求
     */
    @PostMapping("add")
    @ResponseBody
    public ResultCommon add(Ward ward){
        boolean b = wardService.save(ward);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.success(ResultCode.SUCCESS);
        }
    }


    /**
     * 02-查询病房
     * @return
     */
    @ResponseBody
    @GetMapping("findWardByDepartmentAndType/{departmentNo}/{type}")
    public List<Ward> findWardByDepartmentAndType(@PathVariable("departmentNo") Long departmentNo,@PathVariable("type") Long type){
        return wardService.list(new QueryWrapper<Ward>().eq("departmentNo",departmentNo).eq("type",type).eq("state",0));
    }

}
