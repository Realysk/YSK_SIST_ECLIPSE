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
<style>


   .card-body {padding:0 1% 0 1%;}
   .breadcrumb {margin:1%;}
   .nav nav-tabs {margin:1%;}
   #chatArea {width:100%; height:250pt; overflow-y:auto; text-align:left; border:1px solid gray;}
   #pagePath {padding:1%; background:transparent;}

</style>
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min.css">
<!--  1001 위에 설정들을 그대로 가져가주세요~! 그리고 밑에 각 부분에 맞게 include 파일을 넣어주세요! 
   sidebar, header, footer 있고 body에는 id="page-top" 설정해주셔야 위로 스크롤링 될거에요 -->
<script type="text/javascript">
   $(document).ready(function() {
      
      // 세션 호출
      var userSession = "${login}";
       var name = "${login.emp_korname}";
       console.log("유저세션 확인 : " + userSession);
       console.log("이름 확인 : " + name);      
      
      var wsocket;
      
      // 채팅방 접속 기능 => 채팅 가능
      $("#enterBtn").click(function() {
         
         var idVal = $("#id").val();
         if(idVal == "") {
            alert("설정할 닉네임을 입력하세요");
            return;
         }         
         
         if(confirm(idVal + " 님이 접속했습니다.")) {
            //wsocket = new WebSocket("ws://localhost:7080/${path}/chat-ws.do");
            wsocket = new WebSocket("ws://110.93.182.83:7080/${path}/chat-ws.do");
            wsocket.onopen = function(evt) {
               console.log(evt)
               wsocket.send(idVal + " 님이 접속했습니다.");
            };
            wsocket.onmessage = function(evt) {
               receiveMsg(evt.data);
            }
            /*
            wsocket.onclose=function() {
               alert("접속이 종료되었습니다.");
               $("#chatMessageArea").text("");
               $("#msg").val("");
               $("#id").val("");
               $("#id").focus();
            */
         }
         
      });
      
      // 채팅방 퇴장 기능 => 커뮤니티 메인 (공지사항 목록) 이동
      $("#exitBtn").click(function() {
         if(confirm("채팅방에서 퇴장하시겠습니까?")) {
            $(location).attr("href","${path}/onboard.do?method=list");
         }
      });      
      
      
      $("#msg").keyup(function(e) {
    	  if(e.keyCode==13) {
       		wsocket.send($("#id").val() + " : " + $(this).val());
           	$("#msg").val("");
         }
      });
      
   });

   function receiveMsg(revMsg) {
      $("#chatMessageArea").append(revMsg+"<br>");
      var mx = parseInt($("#chatMessageArea").height());
      $("#chatArea").scrollTop(mx);
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
              <li class="breadcrumb-item active"><a href="${path}/onchatting.do">채팅</a></li>
            </ol>
                
               <ul class="nav nav-tabs">
                 <li class="nav-item">
                   <a class="nav-link" data-bs-toggle="tab" href="${path}/onboard.do?method=list">공지사항</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link active" data-bs-toggle="tab" href="${path}/onchatting.do">채팅</a>
                 </li>
               </ul>                  
                             
               
               
               <br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary">채팅</h5>
                        </div>
                        
                        <div class="card-body">
                            <div class="table">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                	
                                	<div class="row">                               		                                		
                                		<div class="col-sm-12 col-md-12" align="left">
											<div class="form-group">											
												<input type="text" id="id" class="form-control" value="${login.emp_korname}" readonly/>
												<button type="button" id="enterBtn" class="btn btn-outline-primary">입장</button>
												<button type="button" id="exitBtn" class="btn btn-outline-secondary">퇴장</button>							  
											</div>																					
                                		</div>
                                		<!-- 채팅창 -->
                                		<div id="chatArea" class="nput-group=append" align="left">
    										<div id="chatMessageArea"></div>																                   			
                                		</div>
                                		<input type="text" id="msg" class="form-control" placeholder="메시지를 입력하세요."/>		                                		                               		
                                	</div>
                                	
                               </div>
                            </div>
                        </div>
                        
                    </div>                 
                
                </div>
                <!--  섹션 끝  -->

            </div>
            <!-- End of Main Content -->
			<jsp:include page="/common/footer.jsp"/>
			
    	</div>
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