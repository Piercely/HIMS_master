package com.hims.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.gson.Gson;
import com.hims.pojo.*;
import com.hims.service.IBedService;
import com.hims.service.IPatientService;
import com.hims.service.ParacodeService;
import com.hims.service.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/wardinfo")
public class WardInfoController {

    @Autowired
    ParacodeService paracodeService;

    @Autowired
    IPatientService patientService;

    @Autowired
    WardService wardService;

    @Autowired
    IBedService bedService;

    @RequestMapping("/info")
    public String wardinfo(Model model){
        List<DepartmentInfo> departments=new ArrayList<DepartmentInfo>();
        List<Paracode> departmentList = paracodeService.list(new QueryWrapper<Paracode>().eq("code", 001));
        for (Paracode department : departmentList) {
            Long departmentId = department.getParameterValues();
            String departmentName = department.getParameterName();
            List<Ward> wards = wardService.list(new QueryWrapper<Ward>().eq("departmentNo", departmentId));
            Long totalNum=0L;
            Long usedNum=0L;
            for (Ward ward : wards) {
                Long wardNo = ward.getWardNo();
                List<Bed> beds = bedService.list(new QueryWrapper<Bed>().eq("ward", wardNo));
                for (Bed bed : beds) {
                    if(bed.getState()==1){
                        usedNum++;
                    }
                    totalNum++;
                }
            }
            double percent=0;
            if(totalNum!=0){
                percent=(usedNum/(totalNum*1.0))*100;
            }
            DepartmentInfo departmentInfo=new DepartmentInfo(departmentId,departmentName,totalNum,usedNum,totalNum-usedNum,percent);
            departments.add(departmentInfo);
        }
        model.addAttribute("departments",departments);
        return "bed-Statistics";
    }

    @RequestMapping("baobiaoinfo")
    public String baobiaoinfo(Model model){
        List<DepartmentInfo> departments=new ArrayList<DepartmentInfo>();
        List<Paracode> departmentList = paracodeService.list(new QueryWrapper<Paracode>().eq("code", 001));
        for (Paracode department : departmentList) {
            Long departmentId = department.getParameterValues();
            String departmentName = department.getParameterName();
            List<Ward> wards = wardService.list(new QueryWrapper<Ward>().eq("departmentNo", departmentId));
            Long totalNum=0L;
            Long usedNum=0L;
            for (Ward ward : wards) {
                Long wardNo = ward.getWardNo();
                List<Bed> beds = bedService.list(new QueryWrapper<Bed>().eq("ward", wardNo));
                for (Bed bed : beds) {
                    if(bed.getState()==1){
                        usedNum++;
                    }
                    totalNum++;
                }
            }
            double percent=0;
            if(totalNum!=0){
                percent=(usedNum/(totalNum*1.0))*100;
            }
            DepartmentInfo departmentInfo=new DepartmentInfo(departmentId,departmentName,totalNum,usedNum,totalNum-usedNum,percent);
            departments.add(departmentInfo);
        }
        List<BedInfo> bedInfos=new ArrayList<BedInfo>();
        for (DepartmentInfo department : departments) {
            BedInfo bedInfo=new BedInfo();
            bedInfo.setName(department.getDepartmentName());
            bedInfo.setValue(department.getPercent()/100);
            bedInfos.add(bedInfo);
        }
        Gson gson=new Gson();
        String bedInfosJson = gson.toJson(bedInfos);
        model.addAttribute("bedInfosJson",bedInfosJson);
        return "bed-infomation";
    }
}
