<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="card m-2">
	<div class="card-header">Ch09. 파일 업로드 및 다운로드</div>
	<div class="card-body">
		<div class="card">
	        <div class="card-header">
	           Form 태그를 이용한 FileUpload
	        </div>
	        <div class="card-body">
	           <form method="post" enctype="multipart/form-data" action="fileupload">
	   			<div class="form-group">
		            <label for="title">File Title</label> 
		            <input type="text" class="form-control" id="title" name="title" placeholder="제목">
		         </div>
		         <div class="form-group">
		            <label for="desc">File Description</label> 
		            <input type="text" class="form-control" id="desc" name="desc" placeholder="설명">
		         </div>
		         <div class="form-group">
		             <label for="attach">Example file input</label>
		             <input type="file" class="form-control-file" id="attach" name="attach">
		             	<!-- multiple="multiple" 을 위의 input 에 넣는다면, -> 여러개의 파일이 동시에 선택됨 -->
         	  	 </div>
         	  	 	<!-- 방법 1  -->
		           <button class="btn btn-info btn-sm">Form 파일 업로드</button>
		           
		           <!-- 방법2 -->
		           <a href="javascript:fileupload()" class="btn btn-info btn-sm">AJAX 파일 업로드</a>
		      </form>
		   </div>
		   <script>
		   	  var saveFilename = "${saveFilename}";
		      function fileupload() {
		         //입력된 정보를 얻기
		         const title = $("#title").val();
		         const desc = $("#desc").val();
		         // 선택된 파일들이 여러개고 그중에서 첫번째 (.files[0]); 을 고르겟다.
		         const attach = document.querySelector("#attach").files[0]; 
		         
		         //Multipart/form-data
		         const formData = new FormData();
		         formData.append("title", title); //문자 파트 
		         formData.append("desc", desc);  //문자 파트 
		         formData.append("attach", attach); // 파일 파트 
		         
		         //Ajax로 서버로 전송
		         $.ajax({
		            url: "fileuploadAjax",
		            method: "post",  //파일 업로드는 무조건 post 방식
		            data: formData,
		            cache: false,        //파일이 포함되어 있으니, 브라우저 메모리에 저장하지 마라
		            processData: false,  //title=xxx&desc=yyy& 씩으로 만들지 마라
		            contentType: false,   //파트마다 Content-Type이 포함되기 때문에 따로 헤더에 Content-Type에 추가하지 마라
		            success:function(data){
			            console.log(data);
			            if(data.result ==="success"){
			            	window.alert("파일전송이 성공됨");
			            }
			            saveFilename = data.saveFilename;
			            //1) 파일로 다운로드
			            $("#link1").attr("href","filedownload?saveFilename="+saveFilename);
		         		//2) 올린 파일을 바로 보기
			            $("#img1").attr("src","filedownload?saveFilename="+saveFilename);
		        	 }
		      	});
		      }
		   </script>
		</div>
		
		<div class="card">
		   <div class="card-header">
		      File Download
		   </div>
		   <div class="card-body">
		      <a id="link1" href="filedownload?saveFilename=${saveFilename }" class="btn btn-info btn-sm" >파일 다운로드</a>
	         <a href="javascript:filedownload()" class="btn btn-info btn-sm">파일 보기</a>
		      <hr/>
		      <!-- <img src="filedownload?fileNo=1" width="200px"/> -->
		      <img id="img1" src="filedownload?saveFilename=${saveFilename }" width="200px" class="mr-2" alt="업로드한 파일이 없다.">
		      <img id="downloadImg" width="200px"/>
		   </div>
		   <script type="text/javascript">
		      function filedownload() {
		    	  //3) 파일 보기 버튼을 클릭햇을때 올린 파일 보기 
		         $("#downloadImg").attr("src", "filedownload?saveFilename="+saveFilename);
		      }
		   </script>
		</div>
	
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>