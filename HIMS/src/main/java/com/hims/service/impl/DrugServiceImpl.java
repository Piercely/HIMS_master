package com.hims.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hims.pojo.Drug;
import com.hims.mapper.DrugMapper;
import com.hims.pojo.Stock;
import com.hims.service.IDrugService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.service.IStockService;
import com.hims.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author bruce
 * @since 2021-08-26
 */
@Service
public class DrugServiceImpl extends ServiceImpl<DrugMapper, Drug> implements IDrugService {

    @Autowired
    IStockService stockService;

    @Override
    @Transactional
    public boolean ruku(Drug drug) {
        Stock stock = stockService.getOne(new QueryWrapper<Stock>().eq("drugId", drug.getDrugId()));
        boolean b1=false;
        if(stock==null){
            //表示库存没有药品  Stock(String drugId, String drugName, Float price, Integer count)
            stock=new Stock(drug.getDrugId(),drug.getDrugname(),drug.getPrice(),drug.getAddNum());
            b1 = stockService.save(stock);
        }else{
            stock.setCount(stock.getCount()+drug.getAddNum());
            b1=stockService.updateById(stock);
        }
        //新增入库记录\
        drug.setValidityTime(DateUtils.getFinallyDate(drug.getProductionTime(),drug.getValidityYear(),drug.getValidityMouth(),drug.getValidityDay()));
        boolean b2 = this.save(drug);
        //System.out.println("b1="+b1);
        //System.out.println("b2="+b2);
        //System.out.println(100/0);
        return b1&&b2;
    }
}
