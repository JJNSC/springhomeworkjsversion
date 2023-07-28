<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=2.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/tomcat.png">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<style>
			/*       Just setting CSS for the page   */

* {
  margin: 0;
  padding: 0;
}

html,
css {
  width: 100%;
  height: 100%;
}

.position {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-top: 15%;
}

#workarea {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: #1e1a3e;
  font-family: Raleway;
}

#personal {
  color:white;
  text-decoration:none;
  position:absolute;
  bottom:15px;
  right:2%;
}
/*    start code for the actual button:         */


/*   
    Spot is the span on the inside of the href that
    fills the parent and makes the hover and link work
    for the entire div
*/

.spot {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}
/*
    This is the outer svg wrapper that the SVG itself will 
    fill. Multiple svg-wrapper classes can be put side by side.
*/

.svg-wrapper {
  margin-top: 0;
  position: relative;
  width: 150px;
  /*make sure to use same height/width as in the html*/
  height: 40px;
  display: inline-block;
  border-radius: 3px;
  margin-left: 5px;
  margin-right: 5px
}
/*
  This is where we define the fill, color, thickness,
  and stroke pattern of the SVG when there is no hover.
  The dasharray and offset together define the line position
  under the words. Here's also where the transition speed is set.
*/

#shape {
  stroke-width: 6px;
  fill: transparent;
  stroke: #009FFD;
  stroke-dasharray: 85 400;
  stroke-dashoffset: -220;
  transition: 1s all ease;
}
/* 
    Pushing the text up into the SVG. Without this the
    text would be below the div's.
*/

#text {
  margin-top: -35px;
  text-align: center;
}

#text a {
  color: black;
  text-decoration: none;
  font-weight: 100;
  font-size: 1.1em;
}
/* 
    Changing the shape on hover. I change the color of the stroke,
make it thinner, then set it to again wrap around the entire parent element.
*/

.svg-wrapper:hover #shape {
  stroke-dasharray: 50 0;
  stroke-width: 3px;
  stroke-dashoffset: 0;
  stroke: #06D6A0;
}
		
		</style>
	
	</head>
	<body>
	
	<div class="d-flex flex-column vh-100">
        <nav class="navbar navbar-dark bg-dark text-white font-weight-bold">
            <a class="navbar-brand" href="${pageContext.request.contextPath}"> 
               <img src="${pageContext.request.contextPath}/resources/logo-spring.png" width="30" height="30" class="d-inline-block align-top">
               	전자정부프레임워크(Spring Framework)
            </a>
            <div>
               <div>
                  <c:if test="${empty login }">
                     <a href="${pageContext.request.contextPath }/ch08/content" class="btn btn-success btn-sm">로그인</a>
                  </c:if>
                  <c:if test="${not empty login }">
                  	 <img src="${pageContext.request.contextPath }/resources/${login.mid }.jpg" width="30" height="30">
                     <span class="mr-2"> ${login.mid }</span>
                     <a href="logout" class="btn btn-success btn-sm">로그아웃</a>
                  </c:if>
               </div>
            </div>
         </nav>
   
         <div class="flex-grow-1 container-fluid">
            <div class="row h-100">
               <div class="col-md-4 p-3 bg-dark">
                  <div class="h-100 d-flex flex-column">
                     <div class="flex-grow-1" style="height: 0px; overflow-y: auto; overflow-x: hidden;">
                        <%@ include file="/WEB-INF/views/common/menu.jsp" %>
                     </div>
                  </div>
               </div>
   
               <div class="col-md-8 p-3">
                  <div class=" h-100 d-flex flex-column">
                     <div class="flex-grow-1 overflow-auto pr-3" style="height: 0px">