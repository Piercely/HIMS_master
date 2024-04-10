package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.IUserService;
import com.hims.service.ParacodeService;
import com.hims.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.jws.WebParam;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-25
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService us;

    @Autowired
    ParacodeService paracodeService;

    /**
     * 01-新增User
     *
     * @param user
     * @return
     */
    @PostMapping("add")
    @ResponseBody
    public ResultCommon add(User user, String userPassword1) {
        if (userPassword1.equals("")) {
            return ResultCommon.fail(ResultCode.PASSWORD_EMPTY);
        } else {
            if ((userPassword1.equals(user.getUserPassword()))) {
                user.setCreateTime(DateUtils.nowTime());
                user.setUserDel(0);
                //密码加密
                String md5Password = MD5Util.MD5EncodeUtf8(MD5Util.MD5EncodeUtf8(user.getUserPassword() + "2015"));
                user.setUserPassword(md5Password);

                boolean b = us.save(user);
                if (b) {
                    return ResultCommon.success(ResultCode.SUCCESS);
                } else {
                    return ResultCommon.fail(ResultCode.FAIL);
                }
            } else {
                return ResultCommon.fail(ResultCode.REPASSWORD_ERROR);
            }
        }
    }

    /**
     * 02-分页查询
     * @param model
     * @return
     */
    @RequestMapping("/find")
    public String find(Model model, UserVo userVo, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<User> qw = new QueryWrapper<User>();
        qw.eq("user_del",0);//默认查询未删除
        if(userVo.getUserId()!=null&&!userVo.getUserId().equals("")){
            qw.like("user_id",userVo.getUserId());
        }
        if(userVo.getUserName()!=null&&!userVo.getUserName().equals("")){
            qw.like("user_name",userVo.getUserName());
        }
        if(userVo.getUserDescribe()!=null&&userVo.getUserDescribe()!=-1){
            qw.eq("user_describe",userVo.getUserDescribe());
        }
        if(userVo.getWorkingStartTime()!=null&&!userVo.getWorkingStartTime().equals("")){
            qw.ge("create_time",userVo.getWorkingStartTime());
        }
        if(userVo.getWorkingEndTime()!=null&&!userVo.getWorkingEndTime().equals("")){
            qw.le("create_time",userVo.getWorkingEndTime());
        }
        //分页API
        IPage<User> pager = us.page(new Page<User>(pageIndex, pageSize), qw);
        List<User> users = pager.getRecords();
        for (User user : users) {
            Integer shendenId = user.getUserDescribe();
            Paracode shenfen = paracodeService.getOne(new QueryWrapper<Paracode>().eq("code", "005").eq("parameter_values", shendenId));
            String shenfenName = shenfen.getParameterName();
            user.setShenfenName(shenfenName);
        }

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<User> pageUtils=new PageUtils<User>(pageIndex,pageSize,totalCount,pageCount,users);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("userVo",userVo); // 查询数据回显
        return "user-find";
    }

    /**
     * 03-用户删除
     * @param id
     * @return
     */
    @DeleteMapping("delete")
    @ResponseBody
    public ResultCommon delete(String id) {
        User user = us.getById(id);
        user.setUserDel(1);
        boolean b = us.updateById(user);
        if (b) {
            return ResultCommon.success(ResultCode.SUCCESS);
        } else {
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

    /**
     * 04-跳转更新页面
     * @param userId
     * @return
     */
    @GetMapping("/toupdate/{userId}")
    public String toupdate(@PathVariable("userId") String userId, Model model){
        model.addAttribute("user",us.getById(userId));
        return "user-modify";
    }

    /**
     * 01-更新User
     * @param user
     * @return
     */
    @PostMapping("update")
    @ResponseBody
    public ResultCommon update(User user) {
        boolean b = us.updateById(user);
        if (b) {
            return ResultCommon.success(ResultCode.SUCCESS);
        } else {
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }


    /**
     * 04-跳转更新页面
     * @param userId
     * @return
     */
    @PutMapping("/resetPassword")
    @ResponseBody
    public ResultCommon toupdate(String userId){
        User user = us.getById(userId);
        //密码加密
        String md5Password = MD5Util.MD5EncodeUtf8(MD5Util.MD5EncodeUtf8("123456" + "2015")); //初始密码
        user.setUserPassword(md5Password);

        boolean b = us.updateById(user);
        if (b) {
            return ResultCommon.success(ResultCode.SUCCESS);
        } else {
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

}
