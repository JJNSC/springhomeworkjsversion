package com.mycompany.springwebapp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.springwebapp.dto.Ch04Form1;
import com.mycompany.springwebapp.dto.Ch04Form1Validator;
import com.mycompany.springwebapp.dto.Ch04Form2;
import com.mycompany.springwebapp.dto.Ch04Form2Validator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch05")
public class Ch05Controller {
	@RequestMapping("/content")
	public String content() {
		log.info("실행");
		return "ch05/content";
	}
	
	@GetMapping("/getHeaderValue")
	public String getHeaderValue(
				@RequestHeader ("User-Agent")String userAgent,
				HttpServletRequest request
				) {
		log.info("실행");
		log.info("User-Agent: "+ userAgent);
		log.info("Client IP: " +request.getRemoteAddr());
		return "redirect:/ch05/content";
	}
	
	@RequestMapping(value="/createCookie", method=RequestMethod.GET)
	public String createCookie(HttpServletResponse response) {
		log.info("실행");
		
		Cookie cookie = new Cookie("useremail","summer@mycompany.com"); //cookie 객체 생성
		//cookie 세팅
		cookie.setDomain("localhost"); //쿠키를 재전송할 서버를 지정
		cookie.setPath("/");		   //쿠키를 재 전송할 경로를 지정
		cookie.setMaxAge(30*60);       //쿠키의 저장 기간 (단위 : 초, 파일에 저장), 시간을 지정안할경우,: 브라우저 메모리 저장
		cookie.setHttpOnly(true); //이걸 작성하지않으면 개발자검사모드에서 httponly에 체크가 되지않는다. 이게 체크가 되어있으면 javascript로 읽어올수없다.
								 //true : 서버만 이용.  false : 자바스크립트에서 접근허용(읽거나 값을 변경가능하도록)
		cookie.setSecure(false); //전송용 프로토콜 http, https
								//false : http, https 모두 사용, true : https 만 사용
		
		response.addCookie(cookie);//응답할때 위의 세팅된 쿠키도 함께 보낸다.
		
		return "redirect:/ch05/content";
	}
	
	@RequestMapping(value="/getCookie", method=RequestMethod.GET)
	//@CookieValue("useremail") 안의 useremail 은 쿠키에 저장할때 쓴 이름. 
	//(지금 내가 쓰려는 이름과 다를경우에는 이렇게 어노테이션 옆에 적어놔야 어떤 정보를 빼와서 쓸건지 알수있다)
	public String createCookie(@CookieValue("useremail") String userEmail) { 
		log.info("실행");
		log.info("userEmail: "+ userEmail);
		return "redirect:/ch05/content";
	}
}
