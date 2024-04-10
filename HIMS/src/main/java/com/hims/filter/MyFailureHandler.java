package com.hims.filter;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class MyFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String errorMsg = "用户名或者密码输入错误!";//返回的错误信息，默认是登录的错误
        if(exception instanceof SessionAuthenticationException){ //如果异常属于验证码session的异常，则获取异常的信息
            //验证码异常信息(获取异常信息)
            errorMsg = exception.getMessage();
        }
        //将返回的对象转换成
        request.setAttribute("msg",errorMsg);
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}
