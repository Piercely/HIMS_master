package com.hims.service;

import com.hims.pojo.Grantdrug;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
public interface IGrantdrugService extends IService<Grantdrug> {

    boolean grantAdd(Grantdrug grantdrug);

}
