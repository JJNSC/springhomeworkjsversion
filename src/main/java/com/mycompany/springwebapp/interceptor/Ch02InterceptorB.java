package com.mycompany.springwebapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.mycompany.springwebapp.interceptor.Auth.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch02InterceptorB implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("실행");
		
		//요청처리 메소드가 @Auth가 붙어있는지 확인
		HandlerMethod handlermethod = (HandlerMethod) handler;
		//Auth 라는 어노테이션이 붙어있는지 확인이 가능해진다.+ enum중 어떤게 붙어있는지도.
		Auth auth = handlermethod.getMethodAnnotation(Auth.class);
		if(auth == null ) {
			//@Auth 안 붙어 있는 경우
			return true;
		}else {
			//@Auth 붙어있는 경우 
			if(auth.value()==Role.ADMIN) {
				//로그인 사용자가 관리자 권한을 가지고 있는지 검사
				boolean isAdmin = false;
				if(isAdmin) {
					return true;
				}else {
					log.info("관리자 권한이 필요함");
					response.sendRedirect(request.getContextPath());
				}
			}else {
				return true;
			}
		}
		
		return true; //return 이 true 면 컨트롤러 실행, false 면 컨트롤러 실행실패
	}
}
