package com.mycompany.springwebapp.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch06")
public class Ch06Controller {
	@RequestMapping("/content")
	public String content() {
		log.info("실행");
		return "ch06/content";
	}
	
	@GetMapping("/forward")
	public String forward(HttpServletRequest request ) {
		request.setAttribute("loginStatus", true);
		request.setAttribute("userName", "홍길동");
		return "ch06/forward1";
	}
	
	@GetMapping("/redirect")
	public String redirect(HttpServletRequest request, HttpSession session ) throws Exception {
		String userName = "홍길동";
		userName = URLEncoder.encode(userName,"UTF-8"); //한글로
		
		session.setAttribute("userId", "summer"); //세션에 userId 세팅
		
		//session을 쓰는 이유. 다양한 사람들이 동시에 접속을 하기때문에 각각의 session에 아이디와 비번등의 정보들을 저장해서 
		//각각 각자의 정보를 가지고 이용을 할 수 있도록 한다.
		
		//request.setAttribute("userName", "홍길동"); //응답이 가고나면 삭제되는 휘발성 정보임
		
		return "redirect:/ch06/getValue?userName="+userName;//이런 get방식으로 전달해줄수도 있다
	}
	
	//요청받은 데이터를 받아오는 두가지 방법
	@GetMapping("/getValue") 
	public String getValue(String userName, HttpServletRequest request, HttpSession session) {
		log.info("userName: "+userName); //get방식으로 
		log.info("userName: "+request.getParameter("userName")); 
		log.info("userId: "+session.getAttribute("userId")); //세션의 정보를 읽어오는 방식으로
		
		return "redirect:/ch06/content";
	}
}
