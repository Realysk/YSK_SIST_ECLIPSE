<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>OnBiz</title>
<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" 
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,
	300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/settings/bootstrap.min.css">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<script type="text/javascript">

	$(document).ready(function(){
		
		
	}); // document.ready end
	
</script>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
	<jsp:include page="/common/sidebar.jsp"/>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">
			<jsp:include page="/common/header.jsp"/>
				
			<!-- Section Start : 구현 내용 -->
			<div class="container-fluid">
			
				<div class="text-center">
					<br><br><br>
					${error}
					<h3>시스템에 문제가 발생했습니다.</h3>
					<h4>빠르게 조취하겠습니다.</h4>
					<h4>급하신 볼일은 02-1234-5678로 연락주시면 즉시 조치해드리겠습니다</h4>
				</div>
			
			</div>
            <!-- Section end -->

		</div>
		<!-- End of Main Content -->
		<jsp:include page="/common/footer.jsp"/>

	</div> 
	<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
    
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
		<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
		<div class="modal-footer">
			<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			<a class="btn btn-primary" href="login.html">Logout</a>
		</div>
		</div>
	</div>
</div>
    
<!-- Custom scripts for all pages-->
<script src="${path}/resources/js/sb-admin-2.min.js"></script>
	
<!-- Bootstrap core JavaScript-->
<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>