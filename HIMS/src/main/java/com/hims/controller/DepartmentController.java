package com.hims.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.gson.Gson;
import com.hims.pojo.Department;
import com.hims.pojo.Paracode;
import com.hims.pojo.Patient;
import com.hims.service.IPatientService;
import com.hims.service.ParacodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    ParacodeService paracodeService;

    @Autowired
    IPatientService patientService;

    @RequestMapping("departmentInformation")
    public String departmentInformation(Model model){
        List<Department> departments=new ArrayList<Department>();
        List<Paracode> departmentList = paracodeService.list(new QueryWrapper<Paracode>().eq("code", 001));
        for (Paracode department : departmentList) {
            Long departmentId = department.getParameterValues();
            String departmentName = department.getParameterName();
            Long inMum = Long.valueOf(patientService.list(new QueryWrapper<Patient>().eq("department", departmentId)).size());
            Long outMum = Long.valueOf(patientService.list(new QueryWrapper<Patient>().eq("department", departmentId).eq("leaveState",1)).size());
            double percent=0;
            if(inMum!=0){
                percent=(outMum/(inMum*1.0))*100;
            }
            Department d=new Department(departmentId,departmentName,outMum,inMum,percent);
            departments.add(d);
        }
        model.addAttribute("departments",departments);
        return "patient-Statistics";
    }


    @RequestMapping("/departmentInformationtongji")
    public String departmentInformationtongji(Model model){
        List<Department> departments=new ArrayList<Department>();
        List<Paracode> departmentList = paracodeService.list(new QueryWrapper<Paracode>().eq("code", 001));
        for (Paracode department : departmentList) {
            Long departmentId = department.getParameterValues();
            String departmentName = department.getParameterName();
            Long inMum = Long.valueOf(patientService.list(new QueryWrapper<Patient>().eq("department", departmentId)).size());
            Long outMum = Long.valueOf(patientService.list(new QueryWrapper<Patient>().eq("department", departmentId).eq("leaveState",1)).size());
            double percent=0;
            if(inMum!=0){
                percent=(outMum/(inMum*1.0))*100;
            }
            Department d=new Department(departmentId,departmentName,outMum,inMum,percent);
            departments.add(d);
        }
        
        List<String> keshiNames=new ArrayList<String>();
        List<Double> percents=new ArrayList<Double>();
        for (Department department : departments) {
            keshiNames.add(department.getDepartmentName());
            percents.add(department.getPercent());
        }
        Gson gson=new Gson();
        String keshiNamesJson = gson.toJson(keshiNames);
        System.out.println("keshiNamesJson="+keshiNamesJson);

        String percentsJson = gson.toJson(percents);
        System.out.println("percentsJson="+percents);
        model.addAttribute("keshiNamesJson",keshiNamesJson);
        model.addAttribute("percentsJson",percentsJson);
        return "patient-information";
    }


}
