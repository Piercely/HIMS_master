package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.mapper.RoleMapper;
import com.hims.pojo.Role;
import com.hims.pojo.User;
import com.hims.mapper.UserMapper;
import com.hims.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author bruce
 * @since 2021-08-25
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User userPojo= userMapper.selectOne(new QueryWrapper<User>().eq("user_name",username).eq("user_del",0));
        if(userPojo!=null){
            //角色ID
            Integer roleId = userPojo.getUserDescribe();
            Role role = roleMapper.selectById(roleId);
            System.out.println("------------------>当前用户"+username+"查询数据库的角色是:"+role.getRoleName());
            List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));  // ROLE_护士  ROLE_医生   ROLE_XXXX
            return new org.springframework.security.core.userdetails.User(userPojo.getUserName(),userPojo.getUserPassword(), authorities);
        }
        //账号不存在，数据库中查询不到账号
        return null;
    }
}
