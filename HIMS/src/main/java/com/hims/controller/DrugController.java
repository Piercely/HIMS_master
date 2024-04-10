package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.annotation.LoggerManage;
import com.hims.pojo.*;
import com.hims.service.IDrugService;
import com.hims.utils.PageUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
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
 * 前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-26
 */
@Controller
@RequestMapping("/drug")
public class DrugController {

    @Autowired
    IDrugService drugService;

    /**
     * 01-药品入库
     *
     * @param drug
     * @return
     */
    @PostMapping("/ruku")
    @ResponseBody
    @LoggerManage(logDescription = "药品入库业务",returnType = "ResultCommon")
    public ResultCommon ruKu(Drug drug) {
        System.out.println("drug=" + drug);
        boolean b = drugService.ruku(drug);
        if (b) {
            return ResultCommon.success(ResultCode.SUCCESS);
        } else {
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }


    /**
     * 02-入库查询
     *
     * @param model
     * @return
     */
    @RequestMapping("rukuQuery")
    @LoggerManage(logDescription = "药品入库查询业务",returnType = "String")
    public String find(Model model, DrugVo drugVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize) {
        QueryWrapper<Drug> qw = new QueryWrapper<Drug>();
        if (drugVo.getDrugId() != null && !drugVo.getDrugId().equals("")) {
            qw.like("drugId", drugVo.getDrugId());
        }
        if (drugVo.getDrugname() != null && !drugVo.getDrugname().equals("")) {
            qw.like("drugname", drugVo.getDrugname());
        }
        if (drugVo.getRukuStartTime() != null && !drugVo.getRukuStartTime().equals("")) {
            qw.ge("createTime", drugVo.getRukuStartTime());
        }
        if (drugVo.getRukuEndTime() != null && !drugVo.getRukuEndTime().equals("")) {
            qw.le("createTime", drugVo.getRukuEndTime());
        }
        if (drugVo.getGuoqiStartTime() != null && !drugVo.getGuoqiStartTime().equals("")) {
            qw.ge("validityTime", drugVo.getGuoqiStartTime());
        }
        if (drugVo.getGuoqiEndTime() != null && !drugVo.getGuoqiEndTime().equals("")) {
            qw.le("validityTime", drugVo.getGuoqiEndTime());
        }
        //分页API
        IPage<Drug> pager = drugService.page(new Page<Drug>(pageIndex, pageSize), qw);
        List<Drug> drugs = pager.getRecords();

        System.out.println(100/0);

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Drug> pageUtils = new PageUtils<Drug>(pageIndex, pageSize, totalCount, pageCount, drugs);
        model.addAttribute("pageUtils", pageUtils);
        model.addAttribute("drugVo", drugVo); // 查询数据回显
        return "drug-inventory-query";
    }

}
