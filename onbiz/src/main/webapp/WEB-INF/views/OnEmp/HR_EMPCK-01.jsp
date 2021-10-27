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
<title>사 원 명 부</title>

<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<!-- CSS 템플릿 추가 (10.04) -->
<title>사원명부</title>

<script type="text/javascript">
$(document).ready(function() {
	 var functionName = function(url, from){
		 
	 }
	 var userSession = "${login}";
     var name = "${login.emp_korname}";
     console.log(" 유저세션 확인: " + userSession);
     console.log("이름 확인 : " + name);
	});
function procAjax(url, form){ // 조회리스트
	$.ajax({
		type:"post", // type:"get"
		url:"${path}/"+url,
		data:$(form).serialize(), // data: getFileParam
		dataType:"json", // data:"html",
		 contentType : "application/x-www-form-urlencoded; charset=utf-8", 
		success:function(data){
			
			console.log(data);
			console.log(data.onEmpList);
			var list = data.onEmpList;
			var show="";
			$("#frm01 :input").val("");
		},
		error:function(err){
			console.log(err);
		}
	});
	
}
</script>
<style type="text/css">
body { font-family: 'Nanum Gothic', sans-serif; font-size: 14px;}
</style>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
<div id="wrapper">
	    
	<jsp:include page="/common/HR/sidebar2.jsp"/>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">
			<jsp:include page="/common/header.jsp"/>
					
			<!-- Section : 구현 내용 -->
	        <div class="container-fluid"><br>
				<div class="card shadow mb-4" style="max-width: 70rem; margin:0 auto;">
				  <div class="card-header"><h3>사원명부</h3></div>
				  <div class="card-body">
					<div class="container">
						<form id="frm01" class="form-inline" method="post">
							<nav class="form-group">
								검색<input class="form-control mr-sm-2" name="ename"
									value="${param.ename}" placeholder="사원명" />
								<button class="btn btn-primary btn-user btn-block" type="submit">Search</button>
							</nav>
						</form>
						<br>
						<!-- ${onEmpList} -->
						<table class="table table-hover">
							<thead>
								<tr class="table table-hover">
									<th>사원번호</th>
									<th>사원명</th>
									<th>권한</th>
									<th>입사일</th>
									<th>이메일</th>
									<th>주소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="OnEmp" items="${onEmpList}">
									<tr class="table-hover">
										<td>${OnEmp.emp_no}</td>
										<td>${OnEmp.emp_korname}</td>
										<td>${OnEmp.ptn_no}</td>
										<td><fmt:formatDate value="${OnEmp.emp_hiredte}" type="both"/></td>
										<td>${OnEmp.emp_email}</td>
										<td>${OnEmp.emp_addr}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
					<!-- 페이지 버튼 -->
					<div class="page_bt text-center">
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</div>
	    		</div><!-- End of Content Wrapper -->
    		</div><!-- End of Page Wrapper -->
		</div><!--  섹션 끝  -->
	</div>
</div>



	

	<!-- 버튼 끝 -->



	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Custom scripts for all pages-->
	<script src="${path}/resources/js/sb-admin-2.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>