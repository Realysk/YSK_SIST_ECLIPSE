<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	.input-group-text{width:100%;background-color:#cfffdf;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"메일 전송"}
		});	
		<%-- 
		
		--%>	
		var result="${result}";
		if(result!=""){
			alert(result);
		}
		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>메일전송</h2>

</div>
<div class="container">
	<form id="frm02" class="form" action="${path}/mailSend.do" method="post">
		<div class="input-group mb-3">
	    	<div class="input-group-prepend">
	      	<span class="input-group-text">수신자</span>
	    </div>
	    	<input type="text" class="form-control" name="receiver" 
	    		placeholder="수신자">
	  	</div>
	  	<!-- 발신자는 smtp 서버를 쓰기에, 컨테이너에 등록한 계정으로 발신 처리된다. -->
		<div class="input-group mb-3">
	    	<div class="input-group-prepend">
	      	<span class="input-group-text">제목</span>
	    </div>
	    	<input type="text" class="form-control" name="subject" 
	    		placeholder="메일제목">
	  	</div>
		<div class="input-group mb-3">
	    	<div class="input-group-prepend">
	      	<span class="input-group-text">내용</span>
	    </div>
	    	<textarea rows="5" cols="100%" name="content" placeholder="내용"></textarea>
	  	</div>
		<div class="text-center">
			<input type="submit" class="btn btn-success" value="메일전송"/>
	    </div>	  		  	
	</form> 
</div>
</body>
</html>