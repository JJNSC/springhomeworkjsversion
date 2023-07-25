package com.mycompany.springwebapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mycompany.springwebapp.dto.Ch08Member;
import com.mycompany.springwebapp.interceptor.Auth.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch08LoginCheckInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("실행");
		
		HandlerMethod handlermethod = (HandlerMethod) handler;
		Ch08Login login = handlermethod.getMethodAnnotation(Ch08Login.class);
		
		//@Login 붙어 있는 경우
		//로그인 되어있는지 확인해야함
		if(login != null ) {
			HttpSession session = request.getSession();
			Ch08Member member = (Ch08Member) session.getAttribute("login");
			
			//로그인이 되었다면
			if(member != null) {
				return true;
			//@Login이 붙어있는데 로그인이 안되면 -> 로그인 페이지로
			}else {
				response.sendRedirect(request.getContextPath()+"/ch08/content");
				return false; //컨트롤러 실행 x
			}
			
		//@Login 이 붙어있지않다면
		}else {
			return true;
		}
	}
}
