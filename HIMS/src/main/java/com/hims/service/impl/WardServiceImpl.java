package com.hims.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.mapper.WardMapper;
import com.hims.pojo.Ward;
import com.hims.service.WardService;
import org.springframework.stereotype.Service;

@Service
public class WardServiceImpl extends ServiceImpl<WardMapper, Ward> implements WardService {
}
