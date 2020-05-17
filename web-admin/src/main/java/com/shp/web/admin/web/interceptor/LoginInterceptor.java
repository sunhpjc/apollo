package com.shp.web.admin.web.interceptor;

import com.shp.commons.constant.ConstantUtils;
import com.shp.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        //获取用户session
        User user=(User)httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);
        //未登录
        if(user==null){
           httpServletResponse.sendRedirect("/login");
        }
        //return ture表示放行
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
