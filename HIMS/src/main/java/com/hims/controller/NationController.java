package com.hims.controller;


import com.hims.pojo.Nation;
import com.hims.service.INationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/nation")
public class NationController {

    @Autowired
    INationService nationService;

    /**
     * 01-查询所有的名族下拉框使用
     * @return
     */
    @ResponseBody
    @GetMapping("/findNations")
    public List<Nation> findNations(){
        return nationService.list();
    }

}
