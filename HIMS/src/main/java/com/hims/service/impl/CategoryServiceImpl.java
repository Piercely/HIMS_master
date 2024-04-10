package com.hims.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.mapper.CategoryMapper;
import com.hims.pojo.Category;
import com.hims.service.CategoryService;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
}
