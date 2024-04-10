package com.hims.filter;

import com.alibaba.druid.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CheckCodeFilter extends OncePerRequestFilter {

    @Autowired
    MyFailureHandler myFailureHandler;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if(StringUtils.equals("/login",request.getRequestURI()) && StringUtils.equalsIgnoreCase(request.getMethod(),"post")){
            try{
                //验证谜底与用户输入是否匹配
                validate(request);
            }catch(AuthenticationException e){
                //产生异常交给myFailureHandler处理
                myFailureHandler.onAuthenticationFailure(request,response,e);
                return; //产生异常就不执行后面的过滤器链
            }
        }
        //验证正确，继续执行剩余过滤器
        filterChain.doFilter(request,response);
    }

    //校验规则
    private void validate(HttpServletRequest request) throws ServletRequestBindingException {
        HttpSession session = request.getSession();
        //获取用户输入的验证码
        String checkCode = request.getParameter("checkCode");
        if(StringUtils.isEmpty(checkCode)){
            throw new SessionAuthenticationException("验证码不能为空");
        }
        // 获取session池中的验证码谜底,session中不存在的情况
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        if(checkCode_session==null) {
            throw new SessionAuthenticationException("系统验证码不存在");
        }
        // 请求验证码校验(比对验证码是否一致 不区分大小写比较)
        if(!StringUtils.equalsIgnoreCase(checkCode_session, checkCode)) {
            throw new SessionAuthenticationException("验证码不匹配");
        }
    }

}
