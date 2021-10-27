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
<title>OnBiz</title>

<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?v=7.1.7">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<script src="${path}/settings/main.js"></script>

<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<link href="${path}/settings/main.css" rel="stylesheet"/>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>

body { font-family: 'Open Sans', Arial, Helvetica, sans-serif;}

  #calendar {
    max-width:80%; margin: 0 auto; padding:10pt;
  }

  #pagePath {padding:1%; background:transparent;}
  
.card {margin:1%;}

.card-body {padding:0 1% 0 1%;}
  
</style>
<script type="text/javascript">

	  // Full-calendar 설정
	  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		    // 현재 시간/날짜로 설정
		    var toDay = new Date().toISOString().split("T")[0];
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      locale:"ko",
		      initialDate: toDay,
		      navLinks: true, // can click day/week names to navigate views
		      selectable: true,
		      selectMirror: true,
		      select: function(arg) {
  	
		    	// form 초기화
		    	$("#CalModalTitle").text("일정등록");
		    	$("form")[0].reset();

		    	// 등록한 데이터 출력
		    	calForm(arg);

		    	// 모달창 처리 
		    	$("#regBtn").show();
		    	$("#uptBtn").hide();
		    	$("#delBtn").hide();
		    	$("h2").click(); 
		        
		        calendar.unselect()
		      },
		      eventClick: function(arg) {
		    	  
				$("#CalModalTitle").text("일정 상세정보");
				calEventForm(arg);

		    	// 모달창 처리 
		      	$("#regBtn").hide();
		      	$("#uptBtn").show();
		      	$("#delBtn").show();
		      	$("h2").click(); 
		    	  
		      },
		      
		   	  // 특정 일정을 드래그해서 드랍했을 때
			  eventDrop:function(info) {
				console.log("일정 드랍 : " + info.event);
				
				calEventForm(info);
				calAjax("method=calupt");
			  }, 
				
			  // 특정 일정의 사이즈를 변경했을 때 
			  eventResize:function(info) {
				  console.log("리사이즈 : " + info.event);
				  
				  calEventForm(info);
				  calAjax("method=calupt");
			  },
		      editable: true,
		      dayMaxEvents: true,
		      
		      // 개인별 일정 조회
		      events: function(info,successCallback, failureCallback){
		    	  $.ajax({
		    		  type:"post",
		    		  url:"${path}/oncal.do?method=calList",
		    		  dataType:"json",
		    		  success:function(data){
		    			  console.log(data)
		    			  successCallback(data.myCalList);
		    		  },
		    		  error:function(err){
		    			  console.log(err);
		    		  }  
		    	  });  
		      }
		    });

		    calendar.render();

		    function check() {
		    	var result = true;
		    	var titleVal = $("[name=title]").val();
		    	var contentVal = $("[name=content]").val();
		    	var startVal = $("#start").val();
		    	var endVal = $("#end").val();
		    	
		    	if(titleVal == "" || titleVal == null){
		    		alert("일정명을 입력하세요!");
		    		result = false;
		    	} else if (contentVal == "" || contentVal == null) {
		    		alert("일정내용을 입력하세요!");
		    		result = false;
		    	} else if (startVal == "" || startVal == null) {
		    		alert("일정 시작일을 입력하세요!");
		    		result = false;
		    	} else if (endVal == "" || endVal == null) {
		    		alert("일정 종료일을 입력하세요!");
		    		result = false;
		    	}
		    	
		    	return result
		    }
		    
		    
		    // 등록 처리 
		    $("#regBtn").click(function(){
		    	if(check()){
		    		calAjax("method=calins");
		    	}
		    });
		    
		    // 수정처리
		    $("#uptBtn").click(function(){
		    	if(check()){
		    		calAjax("method=calupt");
		    	}
		    });
		    
		    // 삭제처리
		    $("#delBtn").click(function(){
		    	console.log("삭제버튼 클릭");
		    	if(confirm("삭제하시겠습니까?")){
		    		calAjax("method=caldel");
		    	}
		    	
		    });
		    
		    // 등록시 사용하는 폼
		    function calForm(arg) {
		    	console.log("기본 정보" + arg.start);
		    	console.log("변환1 정보" + arg.start.toLocaleString());
		    	console.log("변환2 정보" + arg.start.toISOString().split("T")[0]);
		    	$("#start").val(arg.start.toLocaleString());
		    	$("#end").val(arg.end.toLocaleString());
		    	$("#allDay").val(""+arg.allDay);
		    	
		    	$("[name=start]").val(arg.start.toISOString());
		    	$("[name=end]").val(arg.end.toISOString());
		    	$("[name=allDay]").val((arg.allDay?1:0));
		    }
		    
		    // 상세일정시 사용하는 폼
			function calEventForm(arg) {
		    	
		    	$("#allDay").val(""+arg.event.allDay);
		    	$("#start").val(arg.event.start.toLocaleString());
		    	$("#end").val(arg.event.end.toLocaleString());
		    	
		    	$("[name=id]").val(arg.event.id);
		    	$("[name=start]").val(arg.event.start.toISOString());
		    	$("[name=end]").val(arg.event.end.toISOString());
		    	$("[name=allDay]").val((arg.event.allDay?1:0));
		    	
		    	$("[name=title]").val(arg.event.title);
		    	$("[name=content]").val(arg.event.extendedProps.content);
		    	$("[name=borderColor]").val(arg.event.borderColor);
		    	$("[name=backgroundColor]").val(arg.event.backgroundColor);
		    	$("[name=textColor]").val(arg.event.textColor);
		    }
		    
		    // 일정 등록/수정/삭제시 사용하는 메소드
		    function calAjax(send) {
		    	$.ajax({
		    		type:"post",
		    		url:"${path}/oncal.do?" + send,
		    		data:$("#modalFrm").serialize(),
		    		dataTyep:"json",
		    		success:function(data){
		    			location.reload();
		    		},
		    		error:function(err){
		    			console.log(err);
		    		}
		    	});
		    }
	 
	
	
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
				
			<!-- Section Start : 구현 내용 -->
			<div class="container-fluid">
			
			
				<ol class="breadcrumb" id="pagePath">
				  <li class="breadcrumb-item"><a href="#">Home</a></li>
				  <li class="breadcrumb-item active">일정관리</li>
			</ol>
	
				<!-- 캘린더의 출력 위치 -->
				<div class="card shadow mb-4">
				  <div class="card-header"><h5>일정관리</h5></div>
				  <div class="card-body">
				    <div id="calendar"></div>
				  </div>
				</div>
	
					
				<h2 data-toggle="modal" data-target="#exampleModalCenter"></h2>  
			
			</div>
            <!-- Section end -->

		</div><!-- End of Main Content -->
		<jsp:include page="/common/footer.jsp"/>
	</div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
    

<h2 data-toggle="modal" data-target="#CalModal"></h2>  
<div class="modal fade" id="CalModal" tabindex="-1" role="dialog" aria-labelledby="CalModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="CalModalTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="modalFrm" class="form" method="post">
			<input type="hidden" name="id" value="0"/>
			<div class="form-group">
			   <span>일정 입력</span>
		       <input type="text" class="form-control" name="title" id="title" placeholder="입력">
		    </div>
		    <div class="form-group">
		      <span>내용</span>
		      <input type="text" class="form-control" name="content" placeholder="입력">
		    </div>
		    <div class="form-group">
		      <span>시작일</span>
		      <input type="text" class="form-control" id="start" placeholder="시작일 입력">
		      <input type="hidden" name="start">
		    </div>
		    <div class="form-group">
		      <span>종료일</span>
		      <input type="text" class="form-control" id="end" placeholder="입력">
		      <input type="hidden" name="end" >
		    </div>
		    <div class="form-group">
		      <span>테두리색</span>
		      <input type="color" class="form-control" name="borderColor" value="#0099cc" placeholder="입력">
		    </div>
		    <div class="form-group">
		      <span>배경색</span>
		      <input type="color" class="form-control" name="backgroundColor"  value="#0099cc" placeholder="입력">
		    </div>
			<div class="form-group">
		      <span>글자색</span>
		      <input type="color" class="form-control" name="textColor" value="#ccffff" placeholder="입력">
		    </div>
		    <div class="form-group">
			    <input type="hidden" name="allDay"/>
			    <span>시간대</span>
			    <select class="form-select" id="allDay">
			    	<option value="true">종일</option>
					<option value="false">시간</option>
			    </select>
		    </div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
	        <button type="button" id="regBtn" class="btn btn-primary">등록</button>
	        <button type="button" id="uptBtn" class="btn btn-info">수정</button>
	        <button type="button" id="delBtn" class="btn btn-warning">삭제</button>
		</div>
	    </form>
    </div>
  </div>
</div>
</div>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<!-- Core plugin JavaScript-->
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>