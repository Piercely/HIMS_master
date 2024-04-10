package com.hims.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Paracode;
import com.hims.service.ParacodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 数据字典表
 */
@Controller
@RequestMapping("paracode")
public class ParacodeController {

    @Autowired
    ParacodeService paracodeService;

    /**
     * 01-查询科室下拉框(001)
     * @param code
     * @return
     */
    @GetMapping("findParacodes/{code}")
    @ResponseBody
    public List<Paracode> findParacodes(@PathVariable("code") Integer code){
       return paracodeService.list(new QueryWrapper<Paracode>().eq("code",code));
    }
}
