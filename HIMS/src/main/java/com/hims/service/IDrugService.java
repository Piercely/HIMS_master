package com.hims.service;

import com.hims.pojo.Drug;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-26
 */
public interface IDrugService extends IService<Drug> {

    boolean ruku(Drug drug);
}
