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
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<script src="${path}/settings/popper.min.js"></script>
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
		var login_emp_no = "${login.emp_no}";
		var login_auth_name = "${login.auth_name}";
		var login_mem_no = "${mymem_no}";	    
		console.log("유저세션 확인: " + userSession);
		console.log("이름 확인 : " + name);
		console.log("로그인유저의 emp_no : " + login_emp_no);
		console.log("로그인유저의 auth_name : " + login_auth_name);
		console.log("선택한 프로젝트의 멤버번호 : " + login_mem_no);		
      
      $("#regBtn").click(function() {
    	  	if(login_auth_name == "pm") {
    	  		$(location).attr("href","${path}/onboard.do?method=insForm");
    	  	} else {
    	  		alert("권한이 없습니다.");
    	  	}
       });   

      /*
      $("[name=pageSize]").val("${onboardSch.pageSize}");
      $("[name=pageSize]").change(function() {
         $("[name=curPage]").val(1);
         $("form").submit();
      });
      */
   });
   
   /*
   function goPage(bd_no) {
      $("[name=curPage]").val(bd_no);
      $("form").submit();
   }
   */
	function go(bd_no, auth_name) {
   		if(auth_name != "tm") {
   			$(location).attr("href", "${path}/onboard.do?method=detail&bd_no="+bd_no);
   		} else {
   			$(location).attr("href", "${path}/onboard.do?method=detailList&bd_no="+bd_no);
   		}
   	}   
   
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
              <li class="breadcrumb-item active"><a href="${path}/onboard.do?method=list">공지사항</a></li>
            </ol>
                
               <ul class="nav nav-tabs">
                 <li class="nav-item">
                   <a class="nav-link active" data-bs-toggle="tab" href="${path}/onboard.do?method=list">공지사항</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" data-bs-toggle="tab" href="${path}/onchatting.do">채팅</a>
                 </li>
               </ul>                  
                                
                <form id="frm01" class="form" method="post">
                <input type="hidden"/>                              
               <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary">공지사항 게시판</h5>
                        </div>
                        <div class="card-body">
                            <div class="table">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                	<div class="row">
                                		<div class="col-sm-12 col-md-6">
                                			<div class="dataTables_length" id="dataTable_length">
                                				&nbsp;
												<label>
													<input type="text" class="form-control form-control-sm" name="bd_name" value="${bd.bd_name}" placeholder="게시물 검색">
												</label>
                              					&nbsp;
												<label>
													<input type="text" class="form-control form-control-sm" name="mem_no" value="${bd.mem_no}" placeholder="작성자 검색">
												</label>
												&nbsp;
												<label>
													<button type="submit" id="schBtn" class="btn btn-outline-secondary">검색</button>
												</label>
												<label>
													<button type="button" id="regBtn" class="btn btn-outline-dark">등록</button>
												</label>				                         				                             				                            				                              				
                                			</div>                          			
                                		</div>
                                		                                		
                                		<div class="col-sm-12 col-md-6" align="right"><div id="dataTable_filter" class="dataTables_filter">
                                		</div>
                                	</div>
                                </div>
                                <!-- 데이터베이스 표 시작 -->
                               	<div class="row" style="text-align:center;">
                               	<div class="col-sm-12">
                               	<table class="table table-bordered dataTable" style="width:100%;">
                                    <thead>
                                        <tr>
                                        	<th>NO</th>
                                        	<th>제목</th>
                                        	<th>조회수</th>
                                        	<th>작성자</th>
                                        	<th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   		<col width="5%">
   										<col width="65%">
   										<col width="10%">
   										<col width="10%">
   										<col width="10%">
								    	<c:forEach var="bd" items="${list}">
									    	<tr class="text-center" ondblclick="javascript:go(${bd.bd_no},'${login.auth_name}')">
									    		<td>${bd.bd_no}</td>
									    		<td>${bd.bd_name}</td>
									    		<td>${bd.bd_viewcnt}</td>
									    		<td>${bd.mem_no}</td>
									    		<td><fmt:formatDate pattern="YYYY-MM-dd" value="${bd.bd_regdte}"/></td>
									    	</tr>
								    	</c:forEach>                   
                                    </tbody>
                                </table>
                                </div>
                                </div>
                                <!-- 데이터베이스 표 끝 -->
                               </div>
                            </div>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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