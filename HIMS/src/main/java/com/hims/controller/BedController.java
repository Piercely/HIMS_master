package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Bed;
import com.hims.service.IBedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-27
 */
@Controller
@RequestMapping("/bed")
public class BedController {

    @Autowired
    IBedService bedService;

    /**
     * 01-查询病床(空闲病房)
     * @param ward
     * @return
     */
    @ResponseBody
    @GetMapping("/findBeds/{ward}")
    public List<Bed> findBeds(@PathVariable("ward") Long ward){
        return bedService.list(new QueryWrapper<Bed>().eq("ward",ward).eq("state",0));
    }

    /**
     * 01-查询病床(所有病床)
     * @param ward
     * @return
     */
    @ResponseBody
    @GetMapping("/findBedsAll/{ward}")
    public List<Bed> findBedsAll(@PathVariable("ward") Long ward){
        return bedService.list(new QueryWrapper<Bed>().eq("ward",ward));
    }
}
