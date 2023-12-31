<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">Ch11. 스프링 태그 라이브러리</div>
	<div class="card-body">
		<div class="card">
         <div class="card-header">
            DTO 객체(Command Object)와 폼 연결
         </div>
         <div class="card-body">
            <a href="form1" class="btn btn-info btn-sm">form1</a>
         </div>
      </div>
      
      <div class="card">
         <div class="card-header">
            DTO 객체의 필드값을 select로 세팅
         </div>
         <div class="card-body">
            <a href="form2" class="btn btn-info btn-sm">form2</a>
         </div>
      </div>
      
      <div class="card">
         <div class="card-header">
            DTO 객체의 필드값을 checkbox로 세팅
         </div>
         <div class="card-body">
            <a href="form3" class="btn btn-info btn-sm">form3</a>
         </div>
      </div>
      
      <div class="card">
         <div class="card-header">
            DTO 객체의 필드값을 radio로 세팅
         </div>
         <div class="card-body">
            <a href="form4" class="btn btn-info btn-sm">form4</a>
         </div>
      </div>
      
      <div class="card">
         <div class="card-header">
            국제화를 적용한 폼
         </div>
         <div class="card-body">
            <a href="form5" class="btn btn-info btn-sm">form5</a>
         </div>
      </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>