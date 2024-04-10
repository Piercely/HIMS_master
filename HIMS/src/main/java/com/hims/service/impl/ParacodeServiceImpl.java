package com.hims.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hims.mapper.ParacodeMapper;
import com.hims.pojo.Paracode;
import com.hims.service.ParacodeService;
import org.springframework.stereotype.Service;

@Service
public class ParacodeServiceImpl extends ServiceImpl<ParacodeMapper, Paracode> implements ParacodeService {
}
