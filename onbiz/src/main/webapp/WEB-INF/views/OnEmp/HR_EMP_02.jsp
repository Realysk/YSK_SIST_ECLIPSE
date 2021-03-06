<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- Custom styles for this template-->
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min.css">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<!-- CSS 템플릿 추가 (10.04) -->
<title>인사정보 이메일 발송</title>

<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el: ".container",
			data:{
				msg:"메일전송"
				}
		});	
		<%-- 
		
		--%>	
		var result="${result}";
		if(result!=""){
			alert(result);
		}
		
	});
</script>
<style type="text/css">
body { font-family: 'Nanum Gothic', sans-serif; font-size: 14px;}
</style>
</head>
<body id="page-top">
<div id="wrapper">
	    
	<jsp:include page="/common/HR/sidebar2.jsp"/>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">
			<jsp:include page="/common/header.jsp"/>
					
			<!-- Section : 구현 내용 -->
	        <div class="container-fluid"><br>
				<div class="card border-primary mb-4" style="max-width: 70rem; margin:0 auto;">
				  <div class="card-header"><h3>메일 발송</h3></div>
				  <div class="card-body">
					<div class="container">
					<form id="frm02" class="form" action="${path}/mailSend.do" method="post">
						<div class="form-group">
					    	<div class="input-group-prepend">
					      	<span class="input-group-text">수신자</span>
					    </div>
					    	<input type="text" class="form-control" name="receiver" 
					    		placeholder="수신 대상자 이메일 입력">
					  	</div>
					 
						<div class="form-group">
					    	<div class="input-group-prepend">
					      	<span class="input-group-text">제목</span>
					    </div>
					    	<input type="text" class="form-control" name="subject" 
					    		placeholder="메일 제목">
					  	</div>
						<div class="form-group">
					    	<div class="input-group-prepend">
					      	<span class="input-group-text">내용</span>
					    </div>
					    	<textarea rows="5" cols="100%" name="content">
안녕하세요. ONBIZ 인사팀 HR 김서연입니다.
신규 사원께 다음과 같은 사번 로그인 정보를 전달하오니 확인하시기 바랍니다. 
사원 이름 : @@@ 사원번호: @@@@ 비밀번호: @@@@
문의 사항은 인사팀 02-350-7533로 문의 주시길 바랍니다.
감사합니다.
http://110.93.182.83:7080/onbiz/login.do
					    	</textarea>
					  	</div>
						<div class="text-center">
							<input type="submit" class="btn btn-primary" value="메일발송"/>
					    </div>	  		  	
					</form> 
					</div>
				  </div>
				</div>
	   		 </div> <!-- End of Content Wrapper -->
    	</div><!-- End of Page Wrapper -->
	</div>
</div>
</body>
</html>