package com.hims.advice;

import com.hims.annotation.LoggerManage;
import com.hims.pojo.Log;
import com.hims.pojo.User;
import com.hims.service.ILogService;
import com.hims.utils.DateUtils;
import com.hims.utils.ResultCode;
import com.hims.utils.ResultCommon;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Arrays;

@Component
@Aspect
public class LoggerAdvice {

    @Autowired
    ILogService logService;

    @Autowired
    HttpSession session;

    @Around("@annotation(loggerManage)")
    public Object around(ProceedingJoinPoint joinPoint, LoggerManage loggerManage) {
        String returnType = loggerManage.returnType();

        String userId="";
        User user=(User) session.getAttribute("loginUser");
        if(user!=null){
            userId=user.getUserId();
        }
        //日志内容：
        //1.操作人UserID：manager
        //2.业务title: logDescription
        //3.日志时间：系统时间
        //4.执行方法名字：
        //5.方法参数
        //6.方法返回值
        String name = joinPoint.getSignature().getName();
        String logDescription = loggerManage.logDescription();
        Object[] arrays = joinPoint.getArgs();
        Object result = null;
        Log log = null;
        try {
            //调用目标方法
            result = joinPoint.proceed();
            log = new Log(null, userId, "普通日志", DateUtils.nowTime(), name, logDescription, this.parseParames(arrays), result.toString(),null);
        } catch (Throwable throwable) {
            log = new Log(null, userId, "异常日志", DateUtils.nowTime(), name, logDescription, this.parseParames(arrays), null,throwable.getMessage());
            System.out.println("执行了,log="+log);
            if("String".equals(returnType)){
                result= "500";
            }else if("ResultCommon".equals(returnType)){
                result= ResultCommon.fail(ResultCode.FAIL);
            }else{
                result="";
            }
            //异常日志
            //throwable.printStackTrace();
        } finally {
            //新增日志
            System.out.println("log============>"+log);
            logService.save(log);
        }
        return result;
    }

    private String parseParames(Object[] parames) {
        if (null == parames || parames.length <= 0) {
            return "";
        }
        StringBuffer param = new StringBuffer("传入参数 # 个:[ ");
        int i = 0;
        for (Object obj : parames) {
            i++;
            if (i == 1) {
                param.append(obj.toString());
                continue;
            }
            param.append(" ,").append(obj.toString());
        }
        return param.append(" ]").toString().replace("#", String.valueOf(i));
    }


}
