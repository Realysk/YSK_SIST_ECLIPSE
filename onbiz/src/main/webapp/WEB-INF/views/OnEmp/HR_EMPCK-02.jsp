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
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,
	400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min3.js"></script>
<title>사원 정보 상세 페이지</title>
</head>
<script type="text/javascript">

$(document).on('click', '#btnWriteForm', function(e){

	e.preventDefault();

	

	location.href = "${pageContext.request.contextPath}/board/boardForm";

});
function procAjax(url, form){ // 조회리스트
	$.ajax({
		type:"post", // type:"get"
		url:"${path}/onEmpList2.do"+url,
		data:$(form).serialize(), // data: getFileParam
		dataType:"json", // data:"html",
		 contentType : "application/x-www-form-urlencoded; charset=utf-8", 
		success:function(data){
			
			console.log(data);
			console.log(data.onEmpList2);
			var list = data.onEmpList2;
			var show="";
			$("#frm01 :input").val("");
		},
		error:function(err){
			console.log(err);
		}
	});
</script>
<body>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/common/HR/sidebar2.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="/common/header.jsp" />

				<!-- Section : 구현 내용 -->
				
		
				<div class="container-fluid"><br>
					<div class="card shadow mb-4" style="max-width: 70rem; margin:0 auto;">
					<div class="card-header"><h3>사원 상세 정보</h3></div>
					<div class="card-body">
					<table class="table table-hover">
						<thead>
							<tr class="table table-hover">
							<th>사원번호</th><th>직급번호</th>
							<th>부서번호</th><th>권한번호</th>
							<th>비밀번호</th><th>한글이름</th>
							<th>영어이름</th><th>이메일</th>
							<th>입사일</th><th>생년월일</th>
							<th>소개</th><th>증명사진</th>
							<th>전화번호</th><th>주소</th>
							<th>재직상태</th><th>재직상태변경일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="OnEmp" items="${onEmpList2}">
								<tr class="table table-hover">
									<td>${OnEmp.emp_no}</td><td>${OnEmp.ptn_no}</td>
									<td>${OnEmp.dept_no}</td><td>${OnEmp.auth_no}</td>
									<td>${OnEmp.emp_korname}</td><td>${OnEmp.emp_engname}</td>
									<td>${OnEmp.emp_email}</td><td>${OnEmp.emp_hiredte}</td>
									<td>${OnEmp.emp_birth}</td><td>${OnEmp.emp_content}</td>
									<td>${OnEmp.emp_profile}</td><td>${OnEmp.emp_tel}</td>
									<td>${OnEmp.emp_addr}</td><td>${OnEmp.emp_workst}</td>
									<td>${OnEmp.emp_workchdte}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>



				</div>
				<!--  Section and -->

			</div>
			</div>
			</div>
			
			<!-- End of Main Content -->
			<jsp:include page="/common/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
</body>
</html>