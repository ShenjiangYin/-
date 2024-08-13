package com.library.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.library.pojo.User;

public class RequestInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//通过Session获取登录用户信息
		User user = (User) request.getSession().getAttribute("USER_SESSION");
		//获取请求路径
		String uri = request.getRequestURI();
		//不拦截登录和退出登录请求
		if (uri.indexOf("login") >= 0 || uri.indexOf("logout") >= 0)
			return true;
		//不拦截登录后的所有请求
		if (user != null)
			return true; 
		//拦截其他请求并跳转到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("login").forward(request, response);
		return false;
	}
}
