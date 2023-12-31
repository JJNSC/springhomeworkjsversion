<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
		DTO 객체의 필드값을 radio로 세팅
	</div>
	<div class="card-body">
		<%--
		<form method="post" action="form4">
			<div>
				<c:forEach var="job" items="${jobList}" varStatus="status">
					<span>
						<input type="radio" id="lang${status.count}" name="mjob" value="${job}"
					  		 <c:if test="${member.mjob == job}">checked</c:if>/>
			  		 	<label for="lang${status.count}">${job}</label>
			  		 </span>
			  	</c:forEach>
			</div>
			<button class="btn btn-info btn-sm">제출</button>
		</form>
		--%>
		
		<form:form modelAttribute="member"  class="mt-3">
			<div>
				<form:radiobuttons items="${jobList}" path="mjob" 
				                   cssClass="mr-2" delimiter="&nbsp; | &nbsp;"/>
			</div>
			<button class="btn btn-info btn-sm">제출</button>
		</form:form>
		
		<form:form modelAttribute="member" class="mt-3">
			<div>
				<form:radiobuttons items="${cityList}" path="mcity" 
								 itemValue="code" itemLabel="label"
								 cssClass="mr-2" delimiter="&nbsp; | &nbsp;"/>
			</div>
			<button class="btn btn-info btn-sm">제출</button>
		</form:form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>