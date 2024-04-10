package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.annotation.LoggerManage;
import com.hims.pojo.*;
import com.hims.service.ICostService;
import com.hims.service.IPatientService;
import com.hims.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-31
 */
@Controller
@RequestMapping("/cost")
public class CostController {

    @Autowired
    ICostService costService;

    @Autowired
    IPatientService patientService;

    /**
     * 01-预缴费用
     */
    @PostMapping("/add")
    @ResponseBody
    @LoggerManage(logDescription = "费用预缴",returnType = "ResultCommon")
    public ResultCommon add(Cost cost){
        try {
            SnowflakeIdWorker worker=new SnowflakeIdWorker(0,0);
            String id = String.valueOf(worker.nextId());
            cost.setId(id);
            cost.setCostTime(DateUtils.nowTime());
            boolean b = costService.add(cost);
            if(b){
                return ResultCommon.success(ResultCode.SUCCESS);
            }else{
                return ResultCommon.fail(ResultCode.FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

    /**
     * 用药历史查询
     * @param model
     * @return
     */
    @RequestMapping("find")
    public String find(Model model, CostVo costVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Cost> qw = new QueryWrapper<Cost>();
        if(costVo.getPatientId()!=null&&!costVo.getPatientId().equals("")){
            qw.like("patientId",costVo.getPatientId());
        }
        if(costVo.getCostStartTime()!=null&&!costVo.getCostStartTime().equals("")){
            qw.ge("costTime",costVo.getCostStartTime());
        }
        if(costVo.getCostEndTime()!=null&&!costVo.getCostEndTime().equals("")){
            qw.le("costTime",costVo.getCostEndTime());
        }
        //分页API
        IPage<Cost> pager = costService.page(new Page<Cost>(pageIndex, pageSize), qw);
        List<Cost> costs = pager.getRecords();
        for (Cost cost : costs) {
            String patientId = cost.getPatientId();
            Patient patient = patientService.getOne(new QueryWrapper<Patient>().eq("patientId", patientId));
            String patientName = patient.getPatientName();
            cost.setPatientName(patientName);
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Cost> pageUtils=new PageUtils<Cost>(pageIndex,pageSize,totalCount,pageCount,costs);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("costvo",costVo); // 查询数据回显
        return "costQuery";
    }

}
