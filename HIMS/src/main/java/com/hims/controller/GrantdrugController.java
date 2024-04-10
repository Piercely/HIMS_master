package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hims.pojo.*;
import com.hims.service.IGrantdrugService;
import com.hims.utils.DateUtils;
import com.hims.utils.PageUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
@Controller
@RequestMapping("/grantdrug")
public class GrantdrugController {

    @Autowired
    IGrantdrugService grantdrugService;

    /**
     * 发药
     * @param grantDrug
     * @return
     */
    @PostMapping("/grantAdd")
    @ResponseBody
    public ResultCommon grantAdd(Grantdrug grantDrug, HttpSession session){
        //从session中取值
        try {
            User user= (User) session.getAttribute("loginUser");
            grantDrug.setGrantUserId(user.getUserId());
            grantDrug.setGrantUserName(user.getUserName());
            grantDrug.setGrantTime(DateUtils.nowTime());
            boolean b = grantdrugService.grantAdd(grantDrug);
            if(b){
                return ResultCommon.success(ResultCode.SUCCESS);
            }else{
                return ResultCommon.fail(ResultCode.FAIL);
            }
        }catch (Exception e) {
            e.printStackTrace();
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

    /**
     * 用药历史查询
     * @param model
     * @return
     */
    @RequestMapping("find")
    public String find(Model model, Grantdrug grantdrug, @RequestParam(defaultValue = "1") Long pageIndex,
                       @RequestParam(defaultValue = "10") Long pageSize){
        QueryWrapper<Grantdrug> qw = new QueryWrapper<Grantdrug>();
        if(grantdrug.getPatientId()!=null&&!grantdrug.getPatientId().equals("")){
            qw.like("patientId",grantdrug.getPatientId());
        }
        //分页API
        IPage<Grantdrug> pager = grantdrugService.page(new Page<Grantdrug>(pageIndex, pageSize), qw);
        List<Grantdrug> grantdrugs = pager.getRecords();

        long totalCount = pager.getTotal();
        long pageCount = pager.getPages();

        //封装一个分页工具类
        PageUtils<Grantdrug> pageUtils=new PageUtils<Grantdrug>(pageIndex,pageSize,totalCount,pageCount,grantdrugs);
        model.addAttribute("pageUtils",pageUtils);
        model.addAttribute("grantdrug",grantdrug); // 查询数据回显
        return "history_drug";
    }

}
