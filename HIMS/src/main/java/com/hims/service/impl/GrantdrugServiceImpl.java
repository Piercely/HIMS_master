package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Fee;
import com.hims.pojo.Grantdrug;
import com.hims.mapper.GrantdrugMapper;
import com.hims.pojo.Stock;
import com.hims.service.IFeeService;
import com.hims.service.IGrantdrugService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.service.IStockService;
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
public class GrantdrugServiceImpl extends ServiceImpl<GrantdrugMapper, Grantdrug> implements IGrantdrugService {

    @Autowired
    IStockService stockService;

    @Autowired
    IFeeService iFeeService;

    @Transactional
    @Override
    public boolean grantAdd(Grantdrug grantdrug) {
        boolean b1 = this.save(grantdrug);
        //库存减少
        Stock stock = stockService.getOne(new QueryWrapper<Stock>().eq("drugId", grantdrug.getDrugId()));
        stock.setCount(stock.getCount() - grantdrug.getDrugCount());
        boolean b2 = stockService.updateById(stock);

        //统计Fee
        Fee fee = iFeeService.getOne(new QueryWrapper<Fee>().eq("patientId", grantdrug.getPatientId()).eq("feeType", FeeType.DRUG_FEE.getMsg()));
        boolean b3 = false;
        if (fee == null) {
            //第一次发药
            b3 = iFeeService.save(new Fee(null, grantdrug.getPatientId(), grantdrug.getPatientName(),
                    FeeType.DRUG_FEE.getMsg(), Double.valueOf(grantdrug.getDrugCount()*grantdrug.getDrugPrice())));
        } else {
            //第二次发药
            fee.setFee(fee.getFee() + Double.valueOf(grantdrug.getDrugCount()*grantdrug.getDrugPrice()));
            b3 = iFeeService.updateById(fee);
        }

        return b1 && b2&&b3;
    }
}
