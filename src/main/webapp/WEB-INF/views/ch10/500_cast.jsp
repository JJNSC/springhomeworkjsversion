<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">예외 처리 내용(ClassCastException 처리)</div>
	<div class="card-body">
		<div class="mt-2">
			<a href="handlingException1" class="btn btn-info btn-sm">
				서버가 정상적으로 동작하지않았습니다. 입력데이터를 확인해주세요.(형식이 다릅니다.)</a>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>