package com.hims.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Permission;
import com.hims.pojo.Role;
import com.hims.pojo.RolePermission;
import com.hims.pojo.User;
import com.hims.service.IPermissionService;
import com.hims.service.IRolePermissionService;
import com.hims.service.IRoleService;
import com.hims.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Commontroller {

    @Autowired
    IUserService userService;

    @Autowired
    IRoleService roleService;

    @Autowired
    IRolePermissionService rolePermissionService;

    @Autowired
    IPermissionService permissionService;

    /**
     * 通用的JSP页面跳转
     *
     * @param jsp
     * @return
     */

    @RequestMapping("to_{jsp}")
    public String toJsp(@PathVariable("jsp") String jsp) {
        return jsp;
    }


    /**
     * 后台首页
     * @return
     */
    @RequestMapping("/home")
    public String toIndex(HttpSession session) {

        //获取当前登录用户信息
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        User user = userService.getOne(new QueryWrapper<User>().eq("user_name", username));
        Role role = roleService.getOne(new QueryWrapper<Role>().eq("id", user.getUserDescribe()));
        System.out.println("--------->当前登录用户名:"+username+",身份是:"+role.getRoleName());
        //模拟session存储当前登录用户信息
        session.setAttribute("loginUser",user);
        session.setAttribute("loginRole",role);
        //根据用户登录的角色，加载这个用户的菜单
        List<Permission> permissionList=new ArrayList<Permission>();
        List<RolePermission> rolePermissions = rolePermissionService.list(new QueryWrapper<RolePermission>().eq("role_id", role.getId()));
        for (RolePermission rolePermission : rolePermissions) {
            Integer permissionId = rolePermission.getPermissionId();
            Permission permission = permissionService.getById(permissionId);
            permissionList.add(permission);
        }
        System.out.println("------>当前对象的菜单数据:"+permissionList);
        session.setAttribute("permissionList",permissionList);
        return "user";
    }
}
