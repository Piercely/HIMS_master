package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Cost;
import com.hims.mapper.CostMapper;
import com.hims.pojo.Fee;
import com.hims.service.ICostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.service.IFeeService;
import com.hims.utils.FeeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author bruce
 * @since 2021-08-31
 */
@Service
public class CostServiceImpl extends ServiceImpl<CostMapper, Cost> implements ICostService {

    @Autowired
    IFeeService iFeeService;

    @Override
    @Transactional
    public boolean add(Cost cost) {
        boolean b1 = this.save(cost);
        //统计Fee
        Fee fee = iFeeService.getOne(new QueryWrapper<Fee>().eq("patientId", cost.getPatientId()).eq("feeType", FeeType.YUJIAO_FEE.getMsg()));
        boolean b2=false;
        if(fee==null){
            //第一次缴费
            b2=iFeeService.save(new Fee(null,cost.getPatientId(),cost.getPatientName(),FeeType.YUJIAO_FEE.getMsg(),Double.valueOf(cost.getAccount())));
        }else{
            fee.setFee(fee.getFee()+cost.getAccount());
            b2 = iFeeService.updateById(fee);
        }
        return b1&&b2;
    }
    
}
