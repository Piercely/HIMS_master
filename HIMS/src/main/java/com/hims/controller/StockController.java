package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.Paracode;
import com.hims.pojo.Stock;
import com.hims.pojo.User;
import com.hims.pojo.UserVo;
import com.hims.service.IStockService;
import com.hims.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
 * @since 2021-08-26
 */
@Controller
@RequestMapping("/stock")
public class StockController {

    @Autowired
    IStockService stockService;

    @Secured(value = {"ROLE_医生","ROLE_系统管理员","ROLE_超级管理员"})
    @RequestMapping("/find")
    public String find(Model model, Stock stock, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Stock> qw = new QueryWrapper<Stock>();
        if(stock.getDrugId()!=null&&!stock.getDrugId().equals("")){
            qw.like("drugId",stock.getDrugId());
        }
        if(stock.getDrugName()!=null&&!stock.getDrugName().equals("")){
            qw.like("drugName",stock.getDrugName());
        }
        //分页API
        IPage<Stock> pager = stockService.page(new Page<Stock>(pageIndex, pageSize), qw);
        List<Stock> stocks = pager.getRecords();

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Stock> pageUtils=new PageUtils<Stock>(pageIndex,pageSize,totalCount,pageCount,stocks);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("stock",stock); // 查询数据回显
        return "stock-query";
    }

}
