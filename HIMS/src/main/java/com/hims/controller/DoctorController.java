package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.IDoctorService;
import com.hims.service.ParacodeService;
import com.hims.utils.DateUtils;
import com.hims.utils.PageUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
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
 * @since 2021-08-25
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    IDoctorService doctorService;

    @Autowired
    ParacodeService paracodeService;

    /**
     * 01-异步请求
     */
    @PostMapping("add")
    @ResponseBody
    public ResultCommon add(Doctor doctor){
        doctor.setState(0);
        boolean b = doctorService.save(doctor);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }


    /**
     * 02-分页查询
     * @param model
     * @return
     */
    @RequestMapping("find")
    public String find(Model model, DoctorVo doctorVo,@RequestParam(defaultValue = "1") Long pageIndex,
                                                      @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Doctor> qw = new QueryWrapper<Doctor>();
        if(doctorVo.getDoctorDepartment()!=null&&doctorVo.getDoctorDepartment()!=-1){
            qw.eq("doctor_department",doctorVo.getDoctorDepartment());
        }
        if(doctorVo.getName()!=null&&!doctorVo.getName().equals("")){
            qw.like("name",doctorVo.getName());
        }
        if(doctorVo.getDoctorTitle()!=null&&doctorVo.getDoctorTitle()!=-1){
            qw.eq("doctor_title",doctorVo.getDoctorTitle());
        }
        if(doctorVo.getState()!=null&& doctorVo.getState()!=-1){
            qw.eq("state",doctorVo.getState());
        }
        if(doctorVo.getWorkingStartTime()!=null&&!doctorVo.getWorkingStartTime().equals("")){
            qw.ge("working_time",doctorVo.getWorkingStartTime());
        }
        if(doctorVo.getWorkingEndTime()!=null&&!doctorVo.getWorkingEndTime().equals("")){
            qw.le("working_time",doctorVo.getWorkingEndTime());
        }
        //分页API
        IPage<Doctor> pager = doctorService.page(new Page<Doctor>(pageIndex, pageSize), qw);
        List<Doctor> doctors = pager.getRecords();
        for (Doctor doctor : doctors) {
            
            Integer doctorDepartmentId = doctor.getDoctorDepartment();
            Paracode keshi = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "001").eq("parameter_values", doctorDepartmentId));
            String keshiName = keshi.getParameterName();
            doctor.setKeshiName(keshiName);


            Integer zhichengId = doctor.getDoctorTitle();
            Paracode zhicheng = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "002").eq("parameter_values", zhichengId));
            String zhichengName = zhicheng.getParameterName();
            doctor.setZhichengName(zhichengName);
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Doctor> pageUtils=new PageUtils<Doctor>(pageIndex,pageSize,totalCount,pageCount,doctors);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("doctorVo",doctorVo); // 查询数据回显
        return "doctor-find";
    }

    /**
     * 03-更新任职状态
     * @param doctor
     * @return
     */
    @PutMapping("doctorChangeState")
    @ResponseBody
    public ResultCommon doctorChangeState(Doctor doctor){
        boolean b = doctorService.updateById(doctor);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.success(ResultCode.FAIL);
        }
    }

    /**
     * 04-跳转更新页面
     * @param doctorId
     * @return
     */
    @GetMapping("/toupdate/{doctorId}")
    public String toupdate(@PathVariable("doctorId") Long doctorId,Model model){
        Doctor doctor = doctorService.getById(doctorId);
        model.addAttribute("doctor",doctor);
        return "doctor-modify";
    }

    /**
     * 05-医生信息更新
     * @param doctor
     * @return
     */
    @PutMapping("update")
    @ResponseBody
    public ResultCommon update(Doctor doctor){
        boolean b = doctorService.updateById(doctor);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS);
        }else{
            return ResultCommon.success(ResultCode.FAIL);
        }
    }

    /**
     * 06-根据科室查询医生
     * @param doctor_department
     * @return
     */
    @GetMapping("findDoctorsByDepartment/{doctor_department}")
    @ResponseBody
    public List<Doctor> findDoctorsByDepartment(@PathVariable("doctor_department") Long doctor_department){
        return doctorService.list(new QueryWrapper<Doctor>().eq("doctor_department",doctor_department).eq("state",0));
    }

}
