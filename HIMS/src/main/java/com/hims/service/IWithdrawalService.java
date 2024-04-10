package com.hims.service;

import com.hims.pojo.Withdrawal;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
public interface IWithdrawalService extends IService<Withdrawal> {

    boolean tuiDrugs(Withdrawal withdrawal);
}
