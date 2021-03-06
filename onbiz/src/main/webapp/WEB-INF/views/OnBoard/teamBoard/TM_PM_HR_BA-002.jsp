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
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<!--  1001 위에 설정들을 그대로 가져가주세요~! 그리고 밑에 각 부분에 맞게 include 파일을 넣어주세요! 
	sidebar, header, footer 있고 body에는 id="page-top" 설정해주셔야 위로 스크롤링 될거에요 -->
<style type="text/css">

   .card-body {padding:0 1% 0 1%;}
   .breadcrumb {margin:1%;}
   .nav nav-tabs {margin:1%;}
   #pagePath {padding:1%; background:transparent;}

</style>
<script type="text/javascript">

	$(document).ready(function() {
		
		// 세션 호출
		var userSession = "${login}";
	    var name = "${login.emp_korname}";
	    console.log("유저세션 확인: " + userSession);
	    console.log("이름 확인 : " + name);
	    
	    var login_emp_no = "${login.emp_no}";
	    var login_mem_no = "${mymem_no}";
	    console.log("로그인유저의 emp_no : " + login_emp_no);
	    console.log("선택한 프로젝트의 멤버번호 : " + login_mem_no);			
		
		/*
		var isInsert = "${bd.bd_name}";
		if(isInsert!="") {
			if(confirm("게시물 등록이 완료되었습니다! \n 계속 등록하시겠습니까?")) {
				$(":input").val("");
				$("[name=bd_refno]").val(0);
				$("[name=bd_no]").val(0);
			} else {
				$("#list").submit();
			}
		}
		*/
		
		$("#goMain").click(function() {
			
			if(confirm("게시물 등록을 취소하시겠습니까?")) {	
				$(location).attr("href","${path}/onboard.do?method=list");
			}
		});
		
		$("#regBtn").click(function() {
			bdnameVal = $("[name=bd_name]").val();
			bdcontVal = $("[name=bd_content]").val();	
			if(bdnameVal == "") {
				alert("제목을 입력하세요.");	
			} else if (bdcontVal == "") {
				alert("내용을 입력하세요.");
			} else {
				if(confirm("게시물을 등록하시겠습니까?")) {
					$("#onboard").submit();
				}
			}
		});
		
		$("#formFile").on("change",function() {
			$(this).next("#formFile").text($(this).val());
		});
				
	});
	
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

                <!-- !!섹션 : 구현 내용 입력부분!! -->
                <div class="container-fluid">
                
            <ol class="breadcrumb" id="pagePath">
              <li class="breadcrumb-item">프로젝트</li>
              <li class="breadcrumb-item">커뮤니티</li>
              <li class="breadcrumb-item"><a href="${path}/onboard.do?method=list">공지사항</a></li>
              <li class="breadcrumb-item active">공지사항 작성</li>
            </ol>
                
               <ul class="nav nav-tabs">
                 <li class="nav-item">
                   <a class="nav-link active" data-bs-toggle="tab" href="${path}/onboard.do?method=list">공지사항</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" data-bs-toggle="tab" href="${path}/onchatting.do">채팅</a>
                 </li>
               </ul>  										  
                
					<form id="list" action="${path}/onboard.do?method=list" method="post">
						<input type="hidden" name="curPage" value="1">
					</form>
					<!-- 등록 후, 현재 페이지 번호를 변경 처리 ==> session값에 영향. -->
                    <!-- DataTales Example -->
                    
					<form id="onboard" enctype="multipart/form-data" action="${path}/onboard.do?method=insert" method="post">
						<input type="hidden" name="bd_no" value="0"/>                    
                    
                    <div class="card my-4">
                        <h5 class="card-header">공지사항 작성</h5>
                        <div class="card-body">
							<div class="form-group row">
				            	<label class="col-sm-1 col-form-label text-center">작성자</label>
				                	<div class="col-sm-5">
				                       <input type="text" class="form-control" name="mem_no" value="${login.emp_korname}" readonly/>
				                    </div>
				            	<label class="col-sm-1 col-form-label text-center">REFNO</label>
				                	<div class="col-sm-5">
				                       <input type="text" class="form-control" name="bd_refno" value="0" readonly/>
				                    </div>				                    			                    
				            </div>				            
							<div class="form-group row">
				            	<label class="col-sm-1 col-form-label text-center">제목</label>
				                	<div class="col-sm-11">
				                       <input type="text" class="form-control" name="bd_name" value="${bd.bd_name}" placeholder="제목을 입력하세요."/>
				                    </div>
				                    &nbsp;
				                	<div class="col-sm-12">
				                       <textarea name="bd_content" rows="12" class="form-control" placeholder="내용을 입력하세요.">${bd.bd_content}</textarea>
				                    </div>
				            </div>				            			            
                        </div>
                      
						<div class="text-right" style="margin:1%;">
							<button type="button" id="regBtn" class="btn btn-outline-info">등록</button>
							<button type="button" id="goMain" class="btn btn-outline-success">취소</button>
						</div>                     
                        
                    </div>
                    </form>                    
                  
                </div>
                
                <!--  섹션 끝  -->

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
    
    <!--  하단에 js 파일 설정도 넣어주세요!  -->
    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>
	
	<!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>    
        
</body>
</html>