package com.mycompany.springwebapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mycompany.springwebapp.dto.Ch08Item;
import com.mycompany.springwebapp.dto.Ch08Member;
import com.mycompany.springwebapp.interceptor.Ch08Login;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch08")
public class Ch08Controller {
	@RequestMapping("/content")
	public String content(HttpSession session) {
		
		log.info("실행");
		return "ch08/content";
	}
	
	@PostMapping("/login")
	public String login(Ch08Member member, HttpSession session) {
		if(member.getMid().equals("photo1") && member.getMpassword().equals("12345")) {
			member.setMname("하여름");
			member.setMtel("010-1234-1234");
			member.setMaddress("서울시 종로구 혜화동");
			session.setAttribute("login", member);
		}
		return "redirect:/ch08/content";
	}
	
	@GetMapping("/logout")
	@Ch08Login
	public String logout(HttpSession session) {
		log.info("로그아웃가지는가?");
		session.removeAttribute("login");
		
		return "redirect:/ch08/content";
	}
	
	@PostMapping("/addCart")
	@Ch08Login
	public String addCart(
			Ch08Item item ,
			HttpSession session,
			@SessionAttribute(value="cart", required=false) List<Ch08Item> cart) { //기본이 true라서 그렇지 false를 주면 없으면 넘어가서 만들면된다..
		//세션에서 바로 가져오기
		//List<Ch08Item> cart = (List<Ch08Item>) session.getAttribute("cart"); //그냥 오면 object 형식이라서 
		
		//session 에 cart 가 없을 경우, 새로 생성해서 세션에 저장
		if(cart == null) {
			cart = new ArrayList<Ch08Item>();
			session.setAttribute("cart", cart);
		}
		
		//카트에 해당 아이템이 있는지 조사
		boolean exist = false;
		for(Ch08Item cartItem : cart) {
			if(cartItem.getName().equals(item.getName())) {
				//기존에 같은 아이템이 있을경우 아이템의 개수만 증가시키는 방법
				cartItem.setAmount(cartItem.getAmount()+item.getAmount());
				exist = true;
			}
		}
		//카트에 없는 새로운 아이템일 경우
		if(exist == false) {
			cart.add(item);
		}
		
		
		return "redirect:/ch08/content";
	}
	
	@GetMapping("/clearCart")
	@Ch08Login
	public String clearCart(HttpSession session) {
		//카트를 삭제 
		
		//방법 1 : 세션에 저장된 객체를 삭제
		//카트만 깔끔하게삭제됨
		session.removeAttribute("cart");
		
		//방법 2 : 세션 자체를 무효화(세션에 저장된 모든 정보가 없어짐)
		//현재 HttpSession 객체를 삭제하고, 다음 요청때 새로 생성시킴
		// 근데 이거는 세션 전체가 삭제되니깐 안좋음.... 
		//session.invalidate();
		
		return "redirect:/ch08/content";
	}
	
}


























