package com.hims.controller;

import com.hims.pojo.Category;
import com.hims.service.CategoryService;
import com.hims.utils.DateUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    /**
     * 01-查询所有的病房类型
     * @return
     */
    @GetMapping("findCategorys")
    @ResponseBody
    public List<Category> findCategorys(){
        return categoryService.list();
    }

    /**
     * 02-病房列表
     * @return
     */
    @GetMapping("list")
    public String list(Model model){
        model.addAttribute("list",categoryService.list());
        return "ward-price_modify";
    }

    /**
     * 03-更新病房类型的单价
     * @return
     */
    @PutMapping("updateWardTypePrice")
    @ResponseBody
    public ResultCommon updateWardTypePrice(Category category){
        String nowtime=DateUtils.nowTime();
        category.setUpdateTime(nowtime);
        System.out.println("要更新的对象:"+category);
        boolean b = categoryService.updateById(category);
        if(b){
            return ResultCommon.success(ResultCode.SUCCESS,nowtime);
        }else{
            return ResultCommon.success(ResultCode.FAIL);
        }
    }

}
