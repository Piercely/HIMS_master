package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Category;
import com.hims.pojo.Fee;
import com.hims.pojo.Patient;
import com.hims.pojo.Wardupdate;
import com.hims.service.CategoryService;
import com.hims.service.IFeeService;
import com.hims.service.IPatientService;
import com.hims.service.IWardupdateService;
import com.hims.utils.DateUtils;
import com.hims.utils.FeeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

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
@RequestMapping("/fee")
public class FeeController {

    @Autowired
    IFeeService iFeeService;

    @Autowired
    IWardupdateService wardupdateService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    IPatientService patientService;

    @RequestMapping("/find")
    public String find(String patientId, Model model){

        double sumMoney=0.0;

        Patient patient = patientService.getOne(new QueryWrapper<Patient>().eq("patientId", patientId));

        List<Fee> fees = iFeeService.list(new QueryWrapper<Fee>().eq("patientId", patientId));
        //计算
        List<Wardupdate> wardupdates = wardupdateService.list(new QueryWrapper<Wardupdate>().eq("patientId", patientId));

        for (Wardupdate wardupdate : wardupdates) {
            Category category = categoryService.getOne(new QueryWrapper<Category>().eq("type", wardupdate.getRoomType()));
            String name = category.getName();
            //放假单价
            Double price = category.getPrice();
            if(wardupdate.getOutTime()==null){
                wardupdate.setOutTime(DateUtils.nowTime());
            }
            int days = DateUtils.differentDaysByMillisecond(wardupdate.getInTime(), wardupdate.getOutTime());
            double money = category.getPrice() * days;
            fees.add(new Fee(null,patientId,patient.getPatientName(),name+"费用",money));
        }

        for (Fee fee : fees) {
            String feeType = fee.getFeeType();
            if(feeType.equals(FeeType.TUIDRUG_FEE.getMsg())){
                sumMoney=sumMoney+fee.getFee();
            }else if(feeType.equals(FeeType.YUJIAO_FEE.getMsg())){
                sumMoney=sumMoney+fee.getFee();
            }else {
                sumMoney=sumMoney-fee.getFee();
            }
        }

        fees.add(new Fee(null,patientId,patient.getPatientName(),"剩余总额",sumMoney));

        model.addAttribute("fees",fees);
        model.addAttribute("patientId",patientId);
        model.addAttribute("patient",patient);

        return "cost_jiesuan";
    }
}
