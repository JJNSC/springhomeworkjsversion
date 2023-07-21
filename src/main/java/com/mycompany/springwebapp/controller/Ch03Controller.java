package com.mycompany.springwebapp.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.springwebapp.dto.Ch02Dto;
import com.mycompany.springwebapp.dto.Ch02FileInfo;
import com.mycompany.springwebapp.dto.Ch03Dto;
import com.mycompany.springwebapp.interceptor.Auth;
import com.mycompany.springwebapp.interceptor.Auth.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch03")
public class Ch03Controller {
	
	@RequestMapping("/content")
	public String content() {
		return "ch03/content";
	}
	
	@GetMapping("/method1")
	public String method1(
			String param1, 
			@RequestParam(defaultValue="0") int param2, 
			@RequestParam(defaultValue="0.0") double param3, 
			@RequestParam(defaultValue="false") boolean param4, 
			@DateTimeFormat(pattern="yyyy-MM-dd") Date param5) {
		log.info("param1 :"+param1);
		log.info("param2 :"+param2);
		log.info("param3 :"+param3);
		log.info("param4 :"+param4);
		log.info("param5 :"+param5);
		
		return "redirect:/ch03/content";
	}
	@GetMapping("/method2")
	public String method2(
			@RequestParam(value="param1") String arg1, 
			@RequestParam(value="param2", defaultValue="0") int arg2, 
			@RequestParam(defaultValue="0.0") double param3, 
			@RequestParam(defaultValue="false") boolean param4, 
			@DateTimeFormat(pattern="yyyy-MM-dd") Date param5) {
		log.info("param1 :"+arg1);
		log.info("param2 :"+arg2);
		log.info("param3 :"+param3);
		log.info("param4 :"+param4);
		log.info("param5 :"+param5);
		
		return "redirect:/ch03/content";
	}
	
	@PostMapping("/method3")
	public String method3(
			@RequestParam(required=true) String param1, //만약 이게 null 이될경우(넘어오는 데이터가 없을경우) 실행이 안된다고한다면?!
			@RequestParam(defaultValue="0") int param2, 
			@RequestParam(defaultValue="0.0") double param3, 
			@RequestParam(defaultValue="false") boolean param4, 
			@DateTimeFormat(pattern="yyyy-MM-dd") Date param5) {
		log.info("param1 :"+param1);
		log.info("param2 :"+param2);
		log.info("param3 :"+param3);
		log.info("param4 :"+param4);
		log.info("param5 :"+param5);
		
		return "redirect:/ch03/content";
	}
	
	@RequestMapping("/method4")
	public void method4(Ch03Dto dto, HttpServletResponse response) throws Exception{
		log.info("param1 :"+dto.getParam1());
		log.info("param2 :"+dto.getParam2());
		log.info("param3 :"+dto.getParam3());
		log.info("param4 :"+dto.isParam4());
		log.info("param5 :"+dto.getParam5());
		
		JSONObject root = new JSONObject();
		root.put("result", "success");
		String json = root.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
		pw.flush();
		pw.close();
	}
	@RequestMapping("/method5")
	public void method5(@RequestBody Ch03Dto dto, HttpServletResponse response) throws Exception{
		log.info("param1 :"+dto.getParam1());
		log.info("param2 :"+dto.getParam2());
		log.info("param3 :"+dto.getParam3());
		log.info("param4 :"+dto.isParam4());
		log.info("param5 :"+dto.getParam5());
		
		JSONObject root = new JSONObject();
		root.put("result", "success");
		String json = root.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
		pw.flush();
		pw.close();
	}
	
}
