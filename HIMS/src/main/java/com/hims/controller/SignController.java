package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.ISignService;
import com.hims.utils.DateUtils;
import com.hims.utils.PageUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
@Controller
@RequestMapping("/sign")
public class SignController {

    @Autowired
    ISignService signService;

    /**
     * 01-录入体征数据
     * @return
     */
    @PostMapping("signSave")
    @ResponseBody
    public ResultCommon signSave(Sign sign, HttpSession session){
        User user= (User) session.getAttribute("loginUser");
        sign.setUserId(user.getUserId());
        sign.setUserName(user.getUserName());
        sign.setCreateTime(DateUtils.nowTime());
        System.out.println("要新增的对象:"+sign);
        boolean b = signService.save(sign);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.success(ResultCode.FAIL);
        }
    }

    /**
     * 02-体征数据查询
     * @param model
     * @return
     */
    @Secured(value = {"ROLE_护士"})
    @RequestMapping("find")
    public String find(Model model, SignVo signVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Sign> qw = new QueryWrapper<Sign>();
        if(signVo.getPatientId()!=null&&!signVo.getPatientId().equals("")){
            qw.like("patientId",signVo.getPatientId());
        }
        if(signVo.getTestStartTime()!=null&&!signVo.getTestStartTime().equals("")){
            qw.ge("measureTime",signVo.getTestStartTime());
        }
        if(signVo.getTestEndTime()!=null&&!signVo.getTestEndTime().equals("")){
            qw.le("measureTime",signVo.getTestEndTime());
        }
        //分页API
        IPage<Sign> pager = signService.page(new Page<Sign>(pageIndex, pageSize), qw);
        List<Sign> signs = pager.getRecords();

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Sign> pageUtils=new PageUtils<Sign>(pageIndex,pageSize,totalCount,pageCount,signs);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("signVo",signVo); // 查询数据回显
        return "sign-query";
    }

}
