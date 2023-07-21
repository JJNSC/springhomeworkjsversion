package com.mycompany.springwebapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch02InterceptorA implements HandlerInterceptor{
	@Override  //controller 실행하기 전의 -전처리 (제일 많이 쓰임)
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("실행");
		return true;
	}
	
	@Override //controller 실행하고 나서 - 후처리 
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//log.info("실행");
	}
	
	@Override  //응답이 바로 가기 직전에 - 완료 처리
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)	throws Exception {
		//log.info("실행");
	}
}
