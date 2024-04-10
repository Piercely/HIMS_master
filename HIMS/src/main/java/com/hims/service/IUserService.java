package com.hims.service;

import com.hims.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author bruce
 * @since 2021-08-25
 */
public interface IUserService extends IService<User>, UserDetailsService {

}
