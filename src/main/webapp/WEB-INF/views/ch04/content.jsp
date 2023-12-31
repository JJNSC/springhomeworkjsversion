<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">
	   Ch04.요청 데이터의 유효성 검사
	</div>
	<div class="card-body">
	
		<div class="card m-2">
         <div class="card-header">
            POST 방식으로 요청
         </div>
         <div class="card-body">
            <form id="form1" method="post" action="method1" > <!-- onsubmit="checkData()" 대신 자바에서 유효성검사를 실행하도록 만들엇기때문에 삭제됨. -->
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param1</span></div>
                  <input type="text" name="param1" class="form-control" value="${ch04Form1.param1 }"> <!-- 디폴트값 구해서 넣어줌 -->
                 <!--  <span class="param1-error text-danger"></span> --> <!-- 이건 아래의 cssClass가 대체가 되기때문에 삭제해도됨  -->
                  
                  <!-- 컨트롤러에서 해당 객체가 (ch04Form1.param1) 있는데 이 form에 param1로 등록된 에러가 있다면 여기에 나타내라(넣어라!)! 라는뜻 -->
                  <!-- cssClass : taglib 의 form 이라는 prefix로 만든거기때문에 css라고 하기 애매함. css의 클래스인걸 알려주기 위해 쓰임 -->
                  <!-- cssClass="text-danger" : 빨간색으로 띄우기 -->
                  <form:errors path="ch04Form1.param1" cssClass="param1-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param2</span></div>
                  <input type="text" name="param2" class="form-control" value="${ch04Form1.param2 }" >
                 <!--  <span class="param2-error text-danger"></span> -->
                  <form:errors path="ch04Form1.param2" cssClass="param2-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param3</span></div>
                  <input type="text" name="param3" class="form-control" value="${ch04Form1.param3 }">
                 <!--  <span class="param3-error text-danger"></span> -->
                  <form:errors path="ch04Form1.param3" cssClass="param3-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param4</span></div>
                  <div class="btn-group btn-group-toggle" data-toggle="buttons">
                     <label class="btn btn-secondary active">
                       <input type="radio" name="param4" <c:if test="${ch04Form1.param4}">checked</c:if> value="true"> true
                     </label>
                     <label class="btn btn-secondary">
                       <input type="radio" name="param4" <c:if test="${!ch04Form1.param4}">checked</c:if> value="false"> false
                     </label>
                  </div>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param5</span></div>
                  <input type="date" name="param5" class="form-control" value='<fmt:formatDate value="${ch04Form1.param5}" pattern="yyyy-MM-dd"/>'>
                  <span class="param5-error text-danger"></span>
               </div>
               <input class="mt-2 btn btn-info btn-sm" type="submit" value="요청"/>
            </form>
         </div>
         <script>
            function checkData() {
            	const form = document.querySelector("#form1");
            	
               //form의 제출 기능을 off
               event.preventDefault();
               
               //유효성 검사 결과 변수
               let checkResult = true;
               
               //입력 길이 체크
               let param1 = form.param1.value; //form의 name이 param1 인 것의 value 를 가져감
               //let param1 = document.querySelector("#form0 [name=param1]").value;
               const param1Error = document.querySelector("#form1 .param1-error");
               param1Error.innerHTML = "";
               if(param1 === "") {
                  param1Error.innerHTML = "필수 입력 사항";
                  checkResult = false;
               } else {
                  if(param1.length<8 || param1.length>15) {
                     param1Error.innerHTML = "8자 이상, 15자 이하로 입력";
                     checkResult = false;
                  };
               }
               
               //정규 표현식을 이용한 전화번호 형식 체크
               let param2 = form.param2.value;
               const param2Error = document.querySelector("#form1 .param2-error");
               param2Error.innerHTML = "";
               if(param2 === "") {
                  param2Error.innerHTML = "필수 입력 사항";
                  checkResult = false;
               } else {
                  const pattern = /^(010|011)-[0-9]{3,4}-[0-9]{4}$/;
                  const result = pattern.test(param2);
                  if(result === false) {
                     param2Error.innerHTML = "전화번호 형식이 아님";
                     checkResult = false;
                  }
               }
               
               //정규 표현식을 이용한 이메일 형식 체크
               let param3 = form.param3.value;
               const param3Error = document.querySelector("#form1 .param3-error");
               param3Error.innerHTML = "";
               if(param3 === "") {
                  param3Error.innerHTML = "필수 입력 사항";
                  checkResult = false;
               } else {
                  const pattern = /([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)/i;
                  const result = pattern.test(param3);
                  if(result === false) {
                     param3Error.innerHTML = "이메일 형식이 아님";
                     checkResult = false;
                  }
               }
               
               //날짜가 비었는지 체크
               let param5 = form.param5.value;
               console.log(param5);
               const param5Error = document.querySelector("#form1 .param5-error");
               param5Error.innerHTML = "";
               if(param5 === "") {
                  param5Error.innerHTML = "필수 입력 사항";
                  checkResult = false;
               } 
               
               //서버로 제출할지 말지 결정
               if(checkResult) {
            	   //코드로 action 속성에 지정된 경로로 데이터를 제출
                  form.submit();
               }
            }
         </script>
      </div>
   
      <div class="card m-2">
         <div class="card-header">
            AJAX로 요청
         </div>
         <div class="card-body">
            <form id="form2" name="form2" action="method2">
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param1</span></div>
                  <input type="text" id="param1" name="param1" class="form-control" value="${ch04Form2.param1 }">
                  <form:errors path="ch04Form2.param1" cssClass="param1-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param2</span></div>
                  <input type="text" id="param2" name="param2" class="form-control" value="${ch04Form2.param2 }">
                 <form:errors path="ch04Form2.param2" cssClass="param2-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param3</span></div>
                  <input type="text" id="param3" name="param3" class="form-control"value="${ch04Form2.param3 }">
                  <form:errors path="ch04Form2.param3" cssClass="param3-error text-danger"></form:errors>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param4</span></div>
                  <div class="btn-group btn-group-toggle" data-toggle="buttons">
                     <label class="btn btn-secondary active">
                       <input type="radio" id="radio1" name="param4" <c:if test="${ch04Form2.param4}">checked</c:if> value="true"> true
                     </label>
                     <label class="btn btn-secondary">
                       <input type="radio" id="radio2" name="param4" <c:if test="${!ch04Form2.param4}">checked</c:if> value="false"> false
                     </label>
                  </div>
               </div>
               <div class="input-group">
                  <div class="input-group-prepend"><span class="input-group-text">param5</span></div>
                  <input type="date" id="param5" name="param5" class="form-control" value='<fmt:formatDate value="${ch04Form2.param5}" pattern="yyyy-MM-dd"/>'>
               </div>
            </form>
            <div class="mt-2">
               <button class="btn btn-info btn-sm" onclick="requestPost()">POST 방식 요청</button>
            </div>
         </div>
         <script>
            function requestPost() {
               const param1 = $("#param1").val(); //주민번호: xxxxxx-1,2,3,4xxxxxx
               const param2 = $("#param2").val(); //년월일: 19680315
               const param3 = $("#param3").val(); //패스워드: 알파벳으로시작 최소 8자 초대 10
               const param4 = $("#form1 input[name=param4]:checked").val();
               const param5 = $("#param5").val();
               
               let checkData = true;
               /* 
               const param1Error = $("#form2 .param1-error");
               param1Error.html("");
               if(param1 === "") {
                  param1Error.html("필수 입력 사항");
                  checkData = false;
               } else {
                  const pattern = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4][0-9]{6}$/;
                  const result = pattern.test(param1);
                  if(result === false) {
                     param1Error.html("주민번호 형식이 아님");
                     checkData = false;
                  }
               }
                */
               if(checkData) {
                  $.ajax({
                     url:"method2",
                     method:"post",
                     data: {
                        param1:param1,
                        param2, 
                        param3, 
                        param4, 
                        param5
                     },
                     success: function(data){
                    	 console.log(data);
                     },
                     
                  })
                  
               }
            }
         </script>
      </div>
      
      <div class="card m-2">
         <div class="card-header">
            서버측 유효성 검사
         </div>
         <div class="card-body">
            <div class="card m-2">
               <div class="card-header">
                  회원 가입 폼
               </div>
               <div class="card-body">         
                  <form id="form3" method="post" action="join">
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">mid</span></div>
                        <input type="text" name="mid" class="form-control" value="${joinForm.mid}" autocomplete="username">
                        <form:errors cssClass="text-danger" path="joinForm.mid"/>
                     </div>
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
                        <input type="password" name="mpassword" class="form-control" value="${joinForm.mpassword}" autocomplete="current-password">
                        <form:errors cssClass="text-danger" path="joinForm.mpassword"/>
                     </div>
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">memail</span></div>
                        <input type="text" name="memail" class="form-control" value="${joinForm.memail}">
                        <form:errors cssClass="text-danger" path="joinForm.memail"/>
                     </div>
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">mtel</span></div>
                        <input type="text" name="mtel" class="form-control" value="${joinForm.mtel}">
                        <form:errors cssClass="text-danger" path="joinForm.mtel"/>
                     </div>
                     <input class="btn btn-info" type="submit" value="가입"/>
                  </form>
               </div>
            </div>
         
            <div class="card m-2">
               <div class="card-header">
                  로그인 폼
               </div>
               <div class="card-body">
                  <form id="form4" method="post" action="login">
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">mid</span></div>
                        <input type="text" name="mid" class="form-control" value="${loginForm.mid}">
                        <form:errors cssClass="text-danger" path="loginForm.mid"/>
                     </div>
                     <div class="input-group">
                        <div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
                        <input type="password" name="mpassword" class="form-control" value="${loginForm.mpassword}">
                        <form:errors cssClass="text-danger" path="loginForm.mpassword"/>
                     </div>
                     <input class="btn btn-info" type="submit" value="로그인"/>
                  </form>
               </div>
            </div>
         </div>
      </div>
		
	
	
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>