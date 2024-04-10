package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.IDoctorService;
import com.hims.service.IPatientService;
import com.hims.service.ParacodeService;
import com.hims.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

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
@RequestMapping("/patient")
public class PatientController {

    @Autowired
    IPatientService patientService;

    @Autowired
    ParacodeService paracodeService;

    @Autowired
    IDoctorService doctorService;

    /**
     * 01-异步请求
     */
    @PostMapping("/add")
    @ResponseBody
    public ResultCommon add(Patient patient){
        try {
            boolean b = patientService.ruyuan(patient);
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
     * 02-分页查询
     * @param model
     * @return
     */
    @Secured(value = {"ROLE_护士","ROLE_医生"})
    @RequestMapping("find")
    public String find(Model model, PatientVo patientVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Patient> qw = new QueryWrapper<Patient>();
        qw.eq("leaveState",0);//查询的是未出院的
        if(patientVo.getDepartment()!=null&&patientVo.getDepartment()!=-1){
            qw.eq("department",patientVo.getDepartment());
        }
        if(patientVo.getPatientId()!=null&&!patientVo.getPatientId().equals("")){
            qw.like("patientId",patientVo.getPatientId());
        }
        if(patientVo.getPatientName()!=null&&!patientVo.getPatientName().equals("")){
            qw.like("patientName",patientVo.getPatientName());
        }
        if(patientVo.getRoomNo()!=null&&patientVo.getRoomNo()!=0){
            qw.eq("roomNo",patientVo.getRoomNo());
        }
        if(patientVo.getBedNo()!=null&& patientVo.getBedNo()!=0){
            qw.eq("bedNo",patientVo.getBedNo());
        }
        if(patientVo.getRuyuanStartTime()!=null&&!patientVo.getRuyuanStartTime().equals("")){
            qw.ge("admissionTime",patientVo.getRuyuanStartTime());
        }
        if(patientVo.getRuyuanEndTime()!=null&&!patientVo.getRuyuanEndTime().equals("")){
            qw.le("admissionTime",patientVo.getRuyuanEndTime());
        }
        //分页API
        IPage<Patient> pager = patientService.page(new Page<Patient>(pageIndex, pageSize), qw);
        List<Patient> patients = pager.getRecords();
        for (Patient patient : patients) {

            Integer departmentId = patient.getDepartment();
            Paracode keshi = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "001").eq("parameter_values", departmentId));
            String keshiName = keshi.getParameterName();
            patient.setKeshiName(keshiName);
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Patient> pageUtils=new PageUtils<Patient>(pageIndex,pageSize,totalCount,pageCount,patients);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("patientVo",patientVo); // 查询数据回显
        return "patient-find";
    }

    /**
     * 03-根据ID查询病人对象
     * @return
     */
    @RequestMapping("patientQuery")
    @ResponseBody
    public Patient patientQuery(String patientId){
        Patient patient = patientService.getOne(new QueryWrapper<Patient>().eq("patientId", patientId));

        Integer departmentId = patient.getDepartment();
        Paracode keshi = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "001").eq("parameter_values", departmentId));
        String keshiName = keshi.getParameterName();
        patient.setKeshiName(keshiName);

        Integer doctorId = patient.getDoctorId();
        Doctor doctor = doctorService.getById(doctorId);
        patient.setDoctorName(doctor.getName());

        return patient;
    }

    /**
     * 出院
     * @param patientId
     * @return
     */
    @PostMapping("chuyuan")
    @ResponseBody
    public ResultCommon chuyuan(String patientId){
        System.out.println("patientId="+patientId);
        try {
            boolean b = patientService.chuyuan(patientId);
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
     * 出院查询
     * @param model
     * @return
     */
    @RequestMapping("outfind")
    public String outfind(Model model, PatientVo patientVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Patient> qw = new QueryWrapper<Patient>();
        qw.eq("leaveState",1);//查询的是未出院的
        if(patientVo.getPatientId()!=null&&!patientVo.getPatientId().equals("")){
            qw.like("patientId",patientVo.getPatientId());
        }
        if(patientVo.getPatientName()!=null&&!patientVo.getPatientName().equals("")){
            qw.like("patientName",patientVo.getPatientName());
        }

        if(patientVo.getRuyuanStartTime()!=null&&!patientVo.getRuyuanStartTime().equals("")){
            qw.ge("admissionTime",patientVo.getRuyuanStartTime());
        }
        if(patientVo.getRuyuanEndTime()!=null&&!patientVo.getRuyuanEndTime().equals("")){
            qw.le("admissionTime",patientVo.getRuyuanEndTime());
        }

        if(patientVo.getChuyuanStartTime()!=null&&!patientVo.getChuyuanStartTime().equals("")){
            qw.ge("leaveTime",patientVo.getChuyuanStartTime());
        }
        if(patientVo.getChuyuanEndTime()!=null&&!patientVo.getChuyuanEndTime().equals("")){
            qw.le("leaveTime",patientVo.getChuyuanEndTime());
        }

        //分页API
        IPage<Patient> pager = patientService.page(new Page<Patient>(pageIndex, pageSize), qw);
        List<Patient> patients = pager.getRecords();
        for (Patient patient : patients) {

            Integer departmentId = patient.getDepartment();
            Paracode keshi = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "001").eq("parameter_values", departmentId));
            String keshiName = keshi.getParameterName();
            patient.setKeshiName(keshiName);

            Integer doctorId = patient.getDoctorId();
            Doctor doctor = doctorService.getById(doctorId);
            patient.setDoctorName(doctor.getName());
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Patient> pageUtils=new PageUtils<Patient>(pageIndex,pageSize,totalCount,pageCount,patients);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("patientVo",patientVo); // 查询数据回显
        return "patient-left-find";
    }

    /**
     * 转科室和病房
     */
    @PostMapping("/changeKeshi")
    @ResponseBody
    public ResultCommon changeKeshi(Patient patient){
        try {
            boolean b = patientService.changeKeshi(patient);
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
     * 住院数据查询
     * @param model
     * @param patientVo
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RequestMapping("allFind")
    public String allFind(Model model, PatientVo patientVo, @RequestParam(defaultValue = "1") Long pageIndex,
                          @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Patient> qw = new QueryWrapper<Patient>();

        if(patientVo.getCertificateNo()!=null&&!patientVo.getCertificateNo().equals("")){
            qw.like("certificateNo",patientVo.getCertificateNo());
        }
        //分页API
        IPage<Patient> pager = patientService.page(new Page<Patient>(pageIndex, pageSize), qw);
        List<Patient> patients = pager.getRecords();
        for (Patient patient : patients) {

            Integer departmentId = patient.getDepartment();
            Paracode keshi = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "001").eq("parameter_values", departmentId));
            String keshiName = keshi.getParameterName();
            patient.setKeshiName(keshiName);

            Integer doctorId = patient.getDoctorId();
            Doctor doctor = doctorService.getById(doctorId);
            patient.setDoctorName(doctor.getName());
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Patient> pageUtils=new PageUtils<Patient>(pageIndex,pageSize,totalCount,pageCount,patients);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("patientVo",patientVo); // 查询数据回显
        return "history_inhospital";
    }

    @RequestMapping("jiesuan")
    @ResponseBody
    public ResultCommon jiesuan(String patientId){
        Patient patient = patientService.getOne(new QueryWrapper<Patient>().eq("patientId", patientId));
        patient.setSettlementState(1);
        boolean b = patientService.updateById(patient);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

}
