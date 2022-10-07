package com.ja.cbh.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CbhInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
		throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("sessionUserInfo");
		
		if(obj == null) {
			response.sendRedirect("/student/login/student_LoginPage");
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
		
}
