package com.shp.web.admin.web.interceptor;

import com.shp.commons.commonsutils.CookieUtils;
import com.shp.commons.constant.ConstantUtils;
import com.shp.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PermissionInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //以end结尾的表示在请求登录页
        //modelAndView!=null&&modelAndView.getViewName()!=null 在使用json传输数据的时候添加，因为获取的不再是页面，而是json字符串
        if(modelAndView!=null&&modelAndView.getViewName()!=null&&modelAndView.getViewName().endsWith("login")){
            User user = (User)httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);
            if(user!=null){
                httpServletResponse.sendRedirect("/main");
            }

            //String userInfo = CookieUtils.getCookieValue(httpServletRequest, ConstantUtils.USER_COOKIE_INFO);
        }
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
