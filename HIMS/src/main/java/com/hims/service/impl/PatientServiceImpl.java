package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Bed;
import com.hims.pojo.Patient;
import com.hims.mapper.PatientMapper;
import com.hims.pojo.Wardupdate;
import com.hims.service.IBedService;
import com.hims.service.IPatientService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.service.IWardupdateService;
import com.hims.utils.DateUtils;
import com.hims.utils.SnowflakeIdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author bruce
 * @since 2021-08-27
 */
@Service
public class PatientServiceImpl extends ServiceImpl<PatientMapper, Patient> implements IPatientService {

    @Autowired
    IBedService bedService;

    @Autowired
    IWardupdateService iWardupdateService;


    @Transactional
    @Override
    public boolean ruyuan(Patient patient) {
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        String patientId = String.valueOf(idWorker.nextId());
        patient.setPatientId(patientId);//不重复的病人编号
        patient.setAdmissionTime(DateUtils.nowTime());
        patient.setState(0);
        boolean b1 = this.save(patient);
        System.out.println("b1="+b1);

        //修改床位状态
        QueryWrapper<Bed> wrapper = new QueryWrapper<Bed>().eq("ward", patient.getRoomNo()).eq("bedNo", patient.getBedNo());
        Bed bed=new Bed();
        bed.setState(1);//已使用
        boolean b2 = bedService.update(bed, wrapper);
        System.out.println("b2="+b2);

        //新增病房信息表
        boolean b3= iWardupdateService.save(new Wardupdate(null,patient.getPatientId(),patient.getRoomType(),patient.getAdmissionTime(),null));

        return b1&&b2&&b3;
    }

    /**
     * 出院
     * @param patientId
     * @return
     */
    @Override
    @Transactional
    public boolean chuyuan(String patientId) {

        Patient patient = this.getOne(new QueryWrapper<Patient>().eq("patientId",patientId));

        patient.setLeaveState(1);//出院
        patient.setLeaveTime(DateUtils.nowTime());
        boolean b1 = this.updateById(patient);
        System.out.println("b1="+b1);

        //修改床位状态
        QueryWrapper<Bed> wrapper = new QueryWrapper<Bed>().eq("ward", patient.getRoomNo()).eq("bedNo", patient.getBedNo());
        Bed bed=new Bed();
        bed.setState(0);//未使用
        boolean b2 = bedService.update(bed, wrapper);
        System.out.println("b2="+b2);

        return b1&&b2;
    }

    @Override
    public boolean changeKeshi(Patient patient) {
        Patient patientOld = this.getOne(new QueryWrapper<Patient>().eq("patientId",patient.getPatientId()));

        Wardupdate wardupdate = iWardupdateService.getOne(new QueryWrapper<Wardupdate>().eq("patientId",
                patientOld.getPatientId()).eq("roomType", patientOld.getRoomType()));
        if(wardupdate!=null){
            wardupdate.setOutTime(DateUtils.nowTime());
            iWardupdateService.updateById(wardupdate);
            //新增新病房
            iWardupdateService.save(new Wardupdate(null,patient.getPatientId(),patient.getRoomType(),DateUtils.nowTime(),null));
        }

        Integer oldBedNo = patientOld.getBedNo();
        Integer oldroomNo = patientOld.getRoomNo();
        QueryWrapper<Bed> wrapper = new QueryWrapper<Bed>().eq("ward", oldroomNo).eq("bedNo", oldBedNo);
        Bed bed=new Bed();
        bed.setState(0);//设置为空闲的
        boolean b2 = bedService.update(bed, wrapper);
        System.out.println("b2="+b2);


        //更新病人信息
        Integer id = patientOld.getId();
        patient.setId(id);
        boolean b1 = this.updateById(patient);
        System.out.println("b1="+b1);

        //房间问题
        //修改床位状态
        QueryWrapper<Bed> wrapper1 = new QueryWrapper<Bed>().eq("ward", patient.getRoomNo()).eq("bedNo", patient.getBedNo());
        Bed bed1=new Bed();
        bed1.setState(1);//使用状态
        boolean b3 = bedService.update(bed1, wrapper1);
        System.out.println("b3="+b3);






        return b1&&b2&&b3;
    }
}
