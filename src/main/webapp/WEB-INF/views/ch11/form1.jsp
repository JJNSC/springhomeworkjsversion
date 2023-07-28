<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">Ch11. 스프링 태그 라이브러리</div>
	<div class="card-body">
		<!-- 기본이 post 이다 .   dto가 request 되어 저장된 이름  (controller에 저장된 이름이 member임)--> 
		<form:form method="post" modelAttribute="member"> 
			<div class="form-group">
				<label for="mid">ID</label>
				<form:input path="mid" class="form-control"></form:input><!-- 왼쪽 코드와 아래 코드는 동일하다!  -->
				<%-- <input type="text" id="mid" name="mid" value="${member.mid }">  --%>
			</div>
			
			<div class="form-group">
				<label for="mname">Name</label>
				<form:input path="mname" class="form-control"></form:input>
			</div>
			
			<div class="form-group">
				<label for="mpassword">Password</label>
				<form:password path="mpassword" class="form-control"></form:password>
			</div>
			<form:hidden path="mnation"/>
			<button class="btn btn-info btn=sm">Submit</button>
			
		</form:form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>