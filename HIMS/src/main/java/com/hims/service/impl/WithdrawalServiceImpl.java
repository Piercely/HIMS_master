package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Drug;
import com.hims.pojo.Fee;
import com.hims.pojo.Stock;
import com.hims.pojo.Withdrawal;
import com.hims.mapper.WithdrawalMapper;
import com.hims.service.IDrugService;
import com.hims.service.IFeeService;
import com.hims.service.IStockService;
import com.hims.service.IWithdrawalService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.utils.FeeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author bruce
 * @since 2021-08-30
 */
@Service
public class WithdrawalServiceImpl extends ServiceImpl<WithdrawalMapper, Withdrawal> implements IWithdrawalService {

    @Autowired
    IStockService stockService;

    @Autowired
    IFeeService iFeeService;

    @Override
    @Transactional
    public boolean tuiDrugs(Withdrawal withdrawal) {
        boolean b1 = this.save(withdrawal);
        Stock stock = stockService.getOne(new QueryWrapper<Stock>().eq("drugId", withdrawal.getDrugsId()));
        stock.setCount(stock.getCount() + withdrawal.getCount()); //库存补回去
        boolean b2 = stockService.updateById(stock);

        //统计Fee
        Fee fee = iFeeService.getOne(new QueryWrapper<Fee>().eq("patientId", withdrawal.getPatientId()).eq("feeType", FeeType.TUIDRUG_FEE.getMsg()));
        boolean b3 = false;
        if (fee == null) {
            //第一次退药
            b3 = iFeeService.save(new Fee(null, withdrawal.getPatientId(), withdrawal.getPatientName(), FeeType.TUIDRUG_FEE.getMsg(), Double.valueOf(withdrawal.getCount() * stock.getPrice())));
        } else {
            //第二次发药
            fee.setFee(fee.getFee() + Double.valueOf(withdrawal.getCount() * stock.getPrice()));
            b3 = iFeeService.updateById(fee);
        }

        return b1 && b2 && b3;
    }
}
