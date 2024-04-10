package com.hims.service;

import com.hims.pojo.Cost;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-31
 */
public interface ICostService extends IService<Cost> {

    boolean add(Cost cost);
}
