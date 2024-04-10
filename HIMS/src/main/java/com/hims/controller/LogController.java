package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.ILogService;
import com.hims.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-09-01
 */
@Controller
@RequestMapping("/log")
public class LogController {

    @Autowired
    ILogService logService;

    /**
     * 02-分页查询
     * @param model
     * @return
     */
    @RequestMapping("find")
    public String find(Model model, LogVo logVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Log> qw = new QueryWrapper<Log>();
        if(logVo.getType()!=null&&!logVo.getType().equals("-1")){
            qw.eq("type",logVo.getType());
        }
        if(logVo.getStartTime()!=null&&!logVo.getStartTime().equals("")){
            qw.ge("create_time",logVo.getStartTime());
        }
        if(logVo.getEndTime()!=null&&!logVo.getEndTime().equals("")){
            qw.le("create_time",logVo.getEndTime());
        }
        //分页API
        IPage<Log> pager = logService.page(new Page<Log>(pageIndex, pageSize), qw);
        List<Log> logs = pager.getRecords();

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Log> pageUtils=new PageUtils<Log>(pageIndex,pageSize,totalCount,pageCount,logs);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("logVo",logVo); // 查询数据回显
        return "Log";
    }
}
