package com.hims.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Grantdrug;
import com.hims.pojo.User;
import com.hims.pojo.Withdrawal;
import com.hims.service.IDrugService;
import com.hims.service.IGrantdrugService;
import com.hims.service.IWithdrawalService;
import com.hims.utils.DateUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.management.Query;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
@Controller
@RequestMapping("/withdrawal")
public class WithdrawalController {

    @Autowired
    IGrantdrugService grantdrugService;

    @Autowired
    IWithdrawalService withdrawalService;

    /**
     * 获取要退药下拉框数据
     *
     * @param patientId
     * @return
     */
    @PostMapping("/getTuiDrugs")
    @ResponseBody
    public ResultCommon getTuiDrugs(String patientId) {
        try {
            QueryWrapper<Grantdrug> queryWrapper = new QueryWrapper<Grantdrug>();
            queryWrapper.eq("patientId", patientId);
            queryWrapper.groupBy("drugId");
            List<Grantdrug> grantdrugs = grantdrugService.list(queryWrapper);
            return ResultCommon.success(ResultCode.SUCCESS, grantdrugs);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

    /**
     * 获取病人某一款药的总数
     *
     * @param patientId
     * @param drugId
     * @return
     */
    @PostMapping("countTotal")
    @ResponseBody
    public ResultCommon countTotal(String patientId, String drugId) {
        try {
            Integer totalCount = 0;
            QueryWrapper<Grantdrug> queryWrapper = new QueryWrapper<Grantdrug>();
            queryWrapper.eq("patientId", patientId);
            queryWrapper.eq("drugId", drugId);
            List<Grantdrug> list = grantdrugService.list(queryWrapper);
            for (Grantdrug grantdrug : list) {
                totalCount = totalCount + grantdrug.getDrugCount();
            }
            return ResultCommon.success(ResultCode.SUCCESS, totalCount);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

    /**
     * 退药
     * @return
     */
    @PostMapping("tuiDrugs")
    @ResponseBody
    public ResultCommon tuiDrugs(Withdrawal withdrawal, HttpSession session){
        User user= (User) session.getAttribute("loginUser");
        withdrawal.setUserId(user.getUserId());
        withdrawal.setUserName(user.getUserName());
        withdrawal.setEntiyTime(DateUtils.nowTime());
        try {
            boolean b= withdrawalService.tuiDrugs(withdrawal);
            if(b){
                return ResultCommon.success(ResultCode.SUCCESS);
            }else{
                return ResultCommon.fail(ResultCode.FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultCommon.fail(ResultCode.FAIL);
        }
    }

}
