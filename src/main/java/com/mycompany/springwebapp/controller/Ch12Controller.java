package com.mycompany.springwebapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.springwebapp.service.Ch12ServiceDiByAnnotation;
import com.mycompany.springwebapp.service.Ch12ServiceDiByXml;
import com.mycompany.springwebapp.service.Ch12ServicePropertyDi;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ch12")
public class Ch12Controller {
   @Autowired
   private Ch12ServiceDiByXml serviceDiByXml; //xml객체는 여기로 주입이 된다.
   
   @Autowired
   private Ch12ServiceDiByAnnotation serviceDiByAnnotation;
   
   @Resource
   private Ch12ServicePropertyDi servicePropertyDi; 
   
   @RequestMapping("/content")
   public String content(HttpSession session) {
      serviceDiByXml.method();
      serviceDiByAnnotation.method();
      return "ch12/content";
   } 
}