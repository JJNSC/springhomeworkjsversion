<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">Ch13. Service 와 DAO(Data Access Object)</div>
	<div class="card-body">
		<div class="mt-2">
			 <div class="svg-wrapper">
      			<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
        			<rect id="shape" height="40" width="150" />
        				<div id="text">
							<a id="spot" href="insertBoard" class="btn btn-sm">게시물 삽입</a>
			            </div>
      			</svg>
    		</div>
		</div>
		<div class="mt-2">
	<div class="card-body">
		<div class="mt-2">
			 <div class="svg-wrapper">
      			<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
        			<rect id="shape" height="100" width="150" />
        				<div id="text">
						<a id="spot" href="getBoardList" class="btn btn-sm">게시물 목록가져오기</a>
					  </div>
      			</svg>
    		</div>
		</div>
		<div class="mt-2">
			<div class="svg-wrapper">
      			<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
        			<rect id="shape" height="100" width="150" />
        				<div id="text">
							<a id="spot" href="updateBoard" class="btn btn-sm">게시물 변경하기</a>
					  </div>
      			</svg>
    		</div>
		</div>
		<div class="mt-2">
			<div class="svg-wrapper">
      			<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
        			<rect id="shape" height="100" width="150" />
        				<div id="text">
						<a id="spot" href="deleteBoard?bno=26" class="btn btn-sm">게시물 삭제하기</a>
					 </div>
      			</svg>
    		</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>