package com.mycompany.springwebapp.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springwebapp.dto.Ch04Form1;
import com.mycompany.springwebapp.dto.Ch04Form1Validator;
import com.mycompany.springwebapp.dto.Ch04Form2;
import com.mycompany.springwebapp.dto.Ch04Form2Validator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch04")
public class Ch04Controller {
	@RequestMapping("/content")
	public String content() {
		log.info("실행");
		return "ch04/content";
	}
	
	
	//Ch04Form1 이름을 저장할때 어떠한 key 이름으로 저장할건가! 
	//->첫자가 소문자가 되는 ch04Form1 을 줌으로써 아래 method1의 Ch04Form1 form1 의 객체와 연동을 시킨다.!
	@InitBinder("ch04Form1") //초기에 바인딩 하는놈! (아래의 클래스를 적은거임)
	//데이터를 초기에 받을때 그때 여기에 지정된 어떤 것 대로 받은 바인딩데이터를 이용하라. 라는뜻.
	//초기에 데이터를 받을때 여기에 설정되어있는데로 사용하라.
	//어떠한 validator 을 이용해서 아래의 @Valie Ch04Form1 form1 의 유효성 검사를 할지 알려주는 곳!
	public void ch04Form1Validator(WebDataBinder binder) { 
		binder.setValidator(new Ch04Form1Validator()); //위의 바인딩된 객체를 유효성 검사할때는 여기서 해라!! 라고 알려주는 것!
	}
	
	@PostMapping("/method1")
	//pom.xml에 validation-api 라이브러리 의존 설정 필요
	//request.setAttribute("ch04Form1", form1); 로 자동 저장
	//Errors errors : 유효성 검사의 에서메세지가 여기로 들어옴!
	public String method1(@Valid Ch04Form1 form1, Errors errors) {
		//errors.rejectValue(...) 가 한번이라도 호출되었다면, hasErrors()는 true를 리턴
		if(errors.hasErrors()) {
			log.info("오류가 뜬건가");
			return "ch04/content"; //오류가 뜨면 다시 폼으로 돌아간다. 단, 에러메세지를 함께.
		}
		//위에서 에러가 존재하여 return이 실행된다면 아래 코드는 실행되지않는다.
		
		//요청 처리코드 
		log.info("param1:"+form1.getParam1());
		log.info("param1:"+form1.getParam2());
		log.info("param1:"+form1.getParam3());
		log.info("param1:"+form1.isParam4());
		log.info("param1:"+form1.getParam5());
		return "redirect:/";
	}
	
	/*@InitBinder("ch04Form2")
	public void ch04Form2Validator(WebDataBinder binder) { 
		binder.setValidator(new Ch04Form2Validator()); //위의 바인딩된 객체를 유효성 검사할때는 여기서 해라!! 라고 알려주는 것!
	}
	
	@PostMapping("/method2")
	public String method2(@Valid Ch04Form2 form2, Errors errors) {
		//errors.rejectValue(...) 가 한번이라도 호출되었다면, hasErrors()는 true를 리턴
		if(errors.hasErrors()) {
			log.info("오류가 뜬건가");
			return "ch04/content"; //오류가 뜨면 다시 폼으로 돌아간다. 단, 에러메세지를 함께.
		}
		//위에서 에러가 존재하여 return이 실행된다면 아래 코드는 실행되지않는다.
		
		//요청 처리코드 
		log.info("param1:"+form2.getParam1());
		log.info("param1:"+form2.getParam2());
		log.info("param1:"+form2.getParam3());
		log.info("param1:"+form2.isParam4());
		log.info("param1:"+form2.getParam5());
		return "redirect:/";
	}*/
	
	@RequestMapping(value="/method2")
	public void method2(Model model, Ch04Form2 form2, BindingResult bindingResult ) {
		new Ch04Form2Validator().validate(form2, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("form2",form2);
			
		}else {
			//요청 처리코드 
			log.info("param1:"+form2.getParam1());
			log.info("param1:"+form2.getParam2());
			log.info("param1:"+form2.getParam3());
			log.info("param1:"+form2.isParam4());
			log.info("param1:"+form2.getParam5());
			
		}
	}
}
