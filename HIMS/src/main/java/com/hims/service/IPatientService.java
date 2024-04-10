package com.hims.service;

import com.hims.pojo.Patient;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-27
 */
public interface IPatientService extends IService<Patient> {

    boolean ruyuan(Patient patient);

    boolean chuyuan(String patientId);

    boolean changeKeshi(Patient patient);
}
