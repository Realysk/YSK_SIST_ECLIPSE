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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<script src="${path}/resources/vendor/chart.js/Chart.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<link rel="stylesheet" href="${path}/settings/bootstrap-datepicker3.standalone.css">


<style type="text/css">
body { font-family: 'Open Sans', Arial, Helvetica, sans-serif;}
a{color:black;}
#date1, #date2 {width:120px;}
#pagePath {padding:1%; background:transparent;}
.form-control {height:50px;}
.card {margin:1%;}
.card-body {padding:0 1% 0 1%;}
.controlInput {width:100pt;}
.custom-file {margin-bottom:1%;}
#totalCnt{margin-left:20pt;}

</style>
<script type="text/javascript">

//초기 데이터 설정
var login_emp_no = "${login.emp_no}";
var login_auth_name = "${login.auth_name}";
var login_auth_no = "${login.auth_no}";
var login_mem_no = "${mymem_no}";
console.log("로그인유저의 emp_no : " + login_emp_no);
console.log("선택한 프로젝트의 멤버번호 : " + login_mem_no);

var pro_startDte;
var pro_endDte;

	$(document).ready(function(){
		
		// 작업일 선택을 위한 데이트피커 설정
		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		});
		
		// [조회] 내작업 목록 출력 함수
		function viewTask(no) {
			console.log("리스트 호출시 emp_no: " + login_emp_no);
			$.ajax ({
				type:"post",
				url:"${path}/ontask.do?method=mytaskJson",
				data:"pro_no=" + no + "&emp_no=" + login_emp_no,
				dataType:"json",
				success:function(data){
					console.log(data);
					var list = data.mytasklist;
					login_mem_no = data.mymem_no;
					console.log(login_mem_no);
					
					var proDList = data.proDur;
					pro_startDte = proDList.pro_startdte;
					pro_endDte = proDList.pro_enddte;
					console.log("프로젝트 시작일:" + pro_startDte);
					console.log("프로젝트 종료일:" + pro_endDte);
					console.log("프로젝트 이름:" + proDList.pro_name);
					
					$("#proName").val(proDList.pro_name);
					
					if(list.length == 0) {
						alert("등록된 작업이 없습니다..!");
						$("#dataTable tbody").html("");
						$("#totalCnt").text("총 데이터 수 : 0건");
					} else {
						showTable(list);
					}
				}, 
				error:function(err){
					console.log(err);
				}
			});
		}
		
		// 초기화면 설정
		viewTask($("#proSel").val());

		// 선택한 프로젝트별 내작업 조회로 프로젝트 변경시
		$("#proSel").on("change", function(){
			console.log("선택한 val값 : " + $(this).val());
			viewTask($(this).val());
		});

		$("#start_date, #end_date").datepicker();

		// [검색] Click시 검색
		$("#btnSch").click(function(){
			console.log("로그인mem" + login_mem_no);
			schTask();	
			$(this).val("");
		});
			
		// [검색] Enter시 검색
		$("[name=contents]").on("keydown", function(event){
			if(event.keyCode == 13) {
				event.preventDefault(); 
				schTask();
				$(this).val("");
			}	
		});

		// 작업 등록버튼 클릭시 
		$("#btnFrm").click(function(){
			$("#regFrm")[0].reset();
			$(".modal-title").text("작업 등록");
			$("#btnReg").show();
			$("#btnUpt").hide();
			$("#btnDel").hide();
			$("#proName").val($("#proSel option:selected").text());
			$("#exampleModalCenter").modal("show");
			regTask(-1);
		});
		
		function check() {
			var result = true;
			
			var textVal = $("[name=text]").val();
			var contentVal = $("[name=content]").val();
			var parantVal = $("#parent").children("option:selected").val();
			var regDuration = $("#regDuration").val();
			var startVal = $("#start_date").val();
			var endVal = $("#end_date").val();
			var priVal = $("[name=priority]").val();
			
			var priRule = /^[0-9]{0,6}$/;
			
			
			console.log("유효성체크");
			console.log("작업명 입력: " + textVal);
			console.log("작업내용 입력: " + contentVal);
			console.log("상위작업번호 입력: " + parantVal);
			console.log("작업기간 입력: " + regDuration);
			console.log("시작일 입력: " + startVal);
			console.log("종료일 입력: " + endVal);
			console.log("우선순위 입력: " + priVal);
			
			
			if(textVal == null || textVal == ""){
				result = false;
				alert("작업명을 입력하세요");
			} else if(contentVal == null || contentVal == ""){
				result = false;
				alert("작업내용을 입력하세요");
			} else if(parantVal == -1){
				 result = false;
				 alert("상위작업을 선택하세요");
			} else if(regDuration == 0){
				result = false;
				alert("작업기간을 확인해주세요");
			} else if(startVal == null || startVal == ""){
				result = false;
				alert("작업 시작일을 선택해주세요");
			} else if(endVal == null || endVal == ""){
				result = false;
				alert("작업 종료일을 선택해주세요");
			} else if(priVal == null || priVal == ""){
				result = false;
				alert("우선순위를 입력해주세요");
			}  else if(!priRule.test(priVal)){
				result = false;
				alert("우선순위는 숫자만 입력가능합니다.");
			}
			return result;
		}
		
		// 작업 등록정보 입력 완료시
		$("#btnReg").click(function(){
			$("[name=pro_no]").val($("#proSel option:selected").val());
			$("[name=mem_no]").val(login_mem_no);
			console.log("프로젝트번호: " + $("[name=pro_no]").val());
			console.log("멤버번호: " +$("[name=mem_no]").val());
			console.log("작업기간: " +$("[name=duration]").val());
			console.log("시작일: " +$("#regFrm [name=start_date]").val());
			console.log("종료일: " +$("#regFrm [name=end_date]").val());

			// 유효성체크 후 등록 처리
			if(check()) {
				$("#regFrm").find("[name=parent]").val($("#parent").children("option:selected").val());
				taskAction("myinsert");
				$("#exampleModalCenter").modal("hide");
			}
		});
		
		// 작업 수정정보 입력 완료시
		$("#btnUpt").click(function(){
			$("[name=pro_no]").val($("#proSel option:selected").val());
			$("[name=mem_no]").val(login_mem_no);
			
			if(check()){
				taskAction("myupdate");
				$("#exampleModalCenter").modal("hide");
			}
		});
		
		// 작업의 삭제시 
		$("#btnDel").click(function(){
			$("[name=pro_no]").val($("#proSel option:selected").val());
			$("[name=mem_no]").val(login_mem_no);
			taskAction("mydelete");
			$("#exampleModalCenter").modal("hide");
		});
		
		
		// 산출물 파일 제출 완료시
		$("#btnOutput").click(function(){
			alert("클릭!");
			if(outCheck()){
				console.log("체크!");
				$("#fileFrm").submit();
				$("#outputModal").modal("hide");	
			}
			
		});
		
		function outCheck() {
			var result = true;
			var contentVal = $("[name=app_content]").val();
			var uploadVal = $("#output").val();

			
			console.log("산출물 유효성체크");
			console.log("요청내용 입력: " + contentVal);
			console.log("업로드파일 이름: " + uploadVal);
			
			
			if(contentVal == null || contentVal == ""){
				result = false;
				alert("요청내용을 입력해주세요");
			} else if(uploadVal == null || uploadVal == ""){
				result = false;
				alert("산출물을 업로드해주세요");
			}
			
			console.log(result);
			return result;
		}
		
		// 작업 등록시 작업 종료일 선택시 작업기간 계산 후 출력
		$("#end_date, #start_date").change(function(){
			console.log($("#end_date").val());
			var stDte = new Date($("#start_date").datepicker().val());
			var edDte = new Date($("#end_date").datepicker().val());

		    const elapsedMSec = edDte.getTime() - stDte.getTime(); // 시간으로 변환
			const elapsedDay = elapsedMSec / 1000 / 60 / 60 / 24; // 경과일 체크
		    
		    console.log(elapsedDay + "일");
			
  			$("#regDuration").val(elapsedDay);
		});
		
		// 첨부한 파일의 이름 출력
		$(".custom-file-input").on("change", function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
	
		// 다운로드 처리
		$("#outputdown").click(function(){
			location.href="${path}/download.do?bd_fname="+$(this).val();
		});

	});
	
	// 작업의 등록/수정/삭제 메소드
	function taskAction(method) {
		$("#regFrm [name=start_date]").val($("#start_date").val());
		$("#regFrm [name=end_date]").val($("#end_date").val());
		
		console.log("데이터변환");
		console.log($("#regFrm [name=start_date]").val());
		console.log($("#regFrm [name=end_date]").val());
		
		$("[name=duration]").val($("#regDuration").val());
		$.ajax ({
			type:"post",
			url:"${path}/ontask.do?method="+method,
			data:$("#regFrm").serialize(),
			dataType:"json",
			success:function(data){
				console.log(data.mytasklist);
				var list = data.mytasklist;
	
				showTable(list);
			}, 
			error:function(err){
				console.log(err);
			}
		});
	}

		
		// 검색메소드
		function schTask() {
			$.ajax ({
				type:"post",
				url:"${path}/ontask.do?method=mySchJson",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(data){
					console.log(data.mytasklist);
					var list = data.mytasklist;
		
					showTable(list);
				}, 
				error:function(err){
					console.log(err);
				}
			});
		}
		
		
		// 조회한 내용으로 테이블 출력메소드
		function showTable(list) {
			var show = "";
			var cnt = 0;
			
			$(list).each(function(idx, tk){
				cnt++;
				show += "<tr class='text-center' ondblclick='javascript:detail(" + tk.id +")'><td>"+tk.text+"</td>";
				//show += "<td>" + tk.content + "</td>";
				show += "<td>" + tk.start_date + "</td>";
				show += "<td>" + tk.end_date + "</td>";
				show += "<td>" + tk.duration + "일</td>";
				
				if(tk.priority == null){
					show += "<td>0</td>";
				} else {
					show += "<td>" + tk.priority + "</td>";
				}
				show += "<td>" + tk.task_state + "</td>";
			});
			
			$("#dataTable tbody").html(show);
			$("#totalCnt").text("총 데이터 수 : " + cnt + "건");
		}
		


	//작업등록창에서 선택한 프로젝트에 따른 작업 목록 생성
	function regTask(no) {
		var taskList = [];
		var taskNum = no != -1?no:0;
		console.log("전달되는 no:" + no);
		console.log("생성되는 taskNum:" + taskNum);

		$.ajax ({
			type:"post",
			url:"${path}/ontask.do?method=mytaskJson",
			data:"pro_no=" + $("#proSel option:selected").val() + "&emp_no=" + login_emp_no,
			dataType:"json",
			success:function(data){
				console.log(data.mytasklist);
			
				$.each(data.mytasklist,function(index, list){
					taskList.push({key:list.id, label:list.text});
				});
				
				var show = "<option value='0'>상위작업없음</option>";

				for(var i=0; i<taskList.length; i++) {
					if(taskNum != 0){
						if(taskNum != taskList[i].key){
							show += "<option value='" + taskList[i].key + "'>" + taskList[i].label + "</option>";
						}
					} else {
						show += "<option value='" + taskList[i].key + "'>" + taskList[i].label + "</option>";
					}
				}
				$("#parent").html(show);
				
				var start = new Date(pro_startDte);
				var end = new Date(pro_endDte);
				console.log(start);
				console.log(end);

				//$("#start_date").datepicker("option", "minDate", start).datepicker("option", "maxDate", end);
				//$("#end_date").datepicker("option", "minDate", start).datepicker("option", "maxDate", end);
				
				// 프로젝트 시작일 이후로 선택가능하도록 처리
				$("#start_date").datepicker("setDate", start);
				$("#start_date").datepicker("option", "minDate", start).datepicker("option", "maxDate", end);

				// 프로젝트 종료일은 프로젝트 시작일 이후 날짜만 선택가능
				$("#end_date").datepicker("option", "minDate", $("#start_date").val()).datepicker("option", "maxDate", end);
				//$("#end_date").datepicker("option", "maxDate", end);

			}, 
			error:function(err){
				console.log(err);
			}
		});
	}	
	
	//작업 상세정보창 출력 메소드
	function modalData(no){
		$.ajax({
			type:"post",
			url:"${path}/ontask.do?method=detailTask",
			data:"id="+no,
			dataType:"json",
			success:function(data){
				console.log(data.detail);
				var tk = data.detail;


				$("#exampleModalLongTitle").text("작업 내용");
				console.log("상위값" + tk.parent);
				if(tk.parent == 0 || tk.parent == null) {
					$("#parent").val(0);
				} else {
					console.log("상위" + tk.parent);
					$("#parent").val(tk.parent).prop("selected",true);
				}
				$("#outPro").val(tk.pro_name);
				$("#outPar").val(tk.parent);
				$("[name=task_no]").val(tk.id);
				$("[name=id]").val(tk.id);
				$("[name=text]").val(tk.text);
				$("[name=content]").val(tk.content);
				$("#start_date").val(tk.start_date);
				$("#end_date").val(tk.end_date);
				$("#start_date2").val(tk.start_date);
				$("#end_date2").val(tk.end_date);
				$("#regDuration").val(tk.duration);
				$("#fileduration").val(tk.duration);
				$("[name=priority]").val(tk.priority);
				$("#proName").val(tk.pro_name);
			}, 
			error:function(err){
				console.log(err);
			}
		});
	}
	
	//작업 목록에서 특정 작업 더블클릭시 상세화면 호출
	function detail(no) {
		console.log("상세화면 호출");
		$("#project").val($("#proSel option:selected").text());
		regTask(no);
		modalData(no);
		$("#btnReg").hide();
		$("#btnUpt").show();
		$("#btnDel").show();
		$("#exampleModalCenter").modal("show");

	}

	// 산출물 제출 버튼 클릭시 산출물 제출창 호출
	function output(no) {
		// 입력 모달창 초기값 설정
		$("#outputModalLongTitle").text("산출물 제출");
		modalData(no);
		$("[name=app_content]").val("");
		$(".custom-file-label").text("");
		// 모달창 내부-제출 버튼,파일 버튼,요청 내용 활성화
		$("#btnOutput").show();
		$(".outupload").show();
		$(".outdownload").hide();
		$("#outpro_no").val($("#proSel").val());
		$("[name=app_content]").attr("disabled", false);
		$("#outputModal").modal("show");
	}
	
	function outputDetail(no){
		// 상세정보 모달창 초기값 설정
		$("#outputModalLongTitle").text("산출물 상세정보");
		modalData(no);
		$("#btnOutput").hide();
		// 모달창 내부-업로드/내용 비활성화,다운로드 활성화
		$(".outupload").hide();
		$(".outdownload").show();
		$("[name=app_content]").attr("disabled", true);
		// Ajax로 파일/결재정보 불러오기
		$.ajax({
			type:"post",
			url:"${path}/ontask.do?method=appDetail",
			data:"task_no=" + no,
			dataType:"json",
			success:function(data){
				var list = data.appList;
				$("[name=app_content]").val(list.app_content);
				$("[name=app_comment]").val(list.app_comment);
				$("[name=outputdown]").val(list.opt_name);
			},
			error:function(err){
				console.log(err);
			}
		});
		$("#outputModal").modal("show");
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
				
			<!-- Section : 구현 내용 -->
           	<div class="container-fluid">
           	
           	<ol class="breadcrumb" id="pagePath">
				  <li class="breadcrumb-item"><a href="#">Home</a></li>
				  <li class="breadcrumb-item">내작업</li>
				  <li class="breadcrumb-item active">작업관리</li>
			</ol>
           	
			<div class="card shadow mb-4">
				<h5 class="card-header" id="title" data-toggle="modal" data-target="#exampleModalCenter">작업 목록</h5>
				<h5 id="outputObj" data-toggle="modal" data-target="#outputModal"></h5>
				<div class="card-body"><br>
					<div class="row justify-content-between">
						<div class="col-sm-4 col-md-4 col-lg-4">
							<select id="proSel" class="form-select">
								<c:forEach var="pl" items="${proList}">
									<option value="${pl.pro_no}">${pl.pro_name}</option>
								</c:forEach>
							</select>
							<input type="hidden" name="pro_startDte">
							<input type="hidden" name="pro_endDte">
						</div>
						<div class="col-auto">
							<div class="input-group">
								<form id="frm01" class="form-inline"  method="post">
									<input type="text" name="contents" class="form-control mr-sm-2" 
										placeholder="작업명 or 작업내용 검색">
									<span class="input-group-btn">
										<button class="btn btn-secondary" type="button" id="btnSch">검색</button>
									</span>
								</form>
							</div>
						</div>
					</div>
					<br>
					<!-- 내작업 목록 출력 테이블 -->
					<div class="table">
						<table class="table" id="dataTable" width="80%" cellspacing="0">
							<col width="20%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						<thead>
							<tr class="text-center">
								<th>작업명</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>작업기간</th>
								<th>우선순위</th>
								<th>진행상태</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					</div>
				</div>
				<div class="row justify-content-between">
					<div class="col-xs-4 col-sm-4 col-ms-4"><span id="totalCnt"></span></div>
					<div class="col-xs-4 col-sm-4 col-ms-4"></div>
					<div class="col-auto">
						<button class="btn btn-primary" type="button" id="btnFrm">등록</button>　
					</div>
				</div><br>
				
			</div>
           	</div>
            <!--  Section and -->

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

<!-- 작업 등록 modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">작업모달창</h5>
        <button type="button" id="btncls1" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="regFrm" class="form"  method="post">
			<input type="hidden" name="id" value="0">
			<input type="hidden" name="mem_no">
			<input type="hidden" name="pro_no">
			<input type="hidden" name="parent" value="0">
			<input type="hidden" name="duration" value="0">
			<input type="hidden" name="start_date">
			<input type="hidden" name="end_date">
			<div class="form-group mb-3 lg-4">
			   <span>작업명</span>
		       <input type="text" class="form-control" name="text" id="text" placeholder="입력">
		    </div>
		    <div class="form-group mb-3 lg-4">
			   <span>작업내용</span>
		       <textarea name="content" rows="2" class="form-control" placeholder="입력"></textarea>
		    </div>
		    <div class="form-group">
			  <label class="form-label mt-4">상위작업</label>
		   	  <div class="form-floating">
			  	<input type="text" class="form-control" id="proName">
			    <label for="proName">프로젝트</label>
			  </div><div><br></div>
			  <div class="form-floating">
			  	<select class="form-select" id="parent"></select>
			    <label for="parent">상위작업 선택</label>
			  </div>
			</div>
			<div class="form-group mb-3 lg-4">
			   <span>작업 시작/종료일</span>
		       <input type="text" class="form-control-sm controlInput" id="start_date" readonly=""> - 
		       <input type="text" class="form-control-sm controlInput" id="end_date" > 
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>작업기간</span>
		       <input type="text" class="form-control controlInput" id="regDuration" placeholder="작업일 선택시 자동계산" disabled="">
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>우선순위</span>
		       <input type="text" class="form-control controlInput" name="priority" placeholder="입력">
		    </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" id="btnCal" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
        <button type="button" id="btnReg" class="btn btn-primary">등록</button>
        <button type="button" id="btnUpt" class="btn btn-info">수정</button>
        <button type="button" id="btnDel" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </div>
</div>

<!-- 산출물 modal -->
<div class="modal fade" id="outputModal" tabindex="-2" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="outputModalLongTitle">산출물 제출</h5>
        <button type="button" id="btncls2" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="fileFrm" enctype="multipart/form-data" action="${path}/ontask.do?method=insertOutput" method="post">
			<input type="hidden" name="task_no">		
			<input type="hidden" name="pro_no" id="outpro_no">		
			<div class="form-group mb-3 lg-4">
			   <span>프로젝트</span>
		       <input type="text" class="form-control" id="outPro" name="project" disabled="">
		    </div>
		    <div class="form-group mb-3 lg-4">
			   <span>상위작업</span>
		       <input type="text" class="form-control" id="outPar" name="parent" disabled="">
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>작업명</span>
		       <input type="text" class="form-control" name="text" id="title" disabled="">
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>작업내용</span>
		       <textarea name="content" rows="3" class="form-control" disabled=""></textarea>
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>작업 시작일　</span>
		       <input type="text" class="form-control-sm controlInput" id="start_date2" name="start_date" disabled="">
		       <span>작업 종료일　</span>
		       <input type="text" class="form-control-sm controlInput" id="end_date2" name="end_date" disabled=""> 
		    </div>
			<div class="form-group mb-3 lg-4">
			   <span>작업 기간　　</span>
		       <input type="text" class="form-control-sm controlInput" id="fileduration" disabled="">
		       <span>우선 순위　　</span>
		       <input type="text" class="form-control-sm controlInput" name="priority" disabled="">
		    </div>
		    <div class="form-group mb-3 lg-4">
			   <span>요청 내용</span>
		       <input type="text" class="form-control" name="app_content" >
		    </div>
			<div class="custom-file outupload"> 
				<input type="file" name="output" class="custom-file-input" id="output">
				<label class="custom-file-label" for="output">
					산출물 파일 업로드
				</label>
			</div>
			<div class="custom-file outdownload"> 
				<span>산출물 다운로드</span>
				<input name="outputdown" class="form-control" id="outputdown" readonly="">
			</div>
			<hr>
		    <div class="form-group mb-3 lg-4">
			   <span>결재 답변</span>
		       <input type="text" class="form-control" name="app_comment" disabled="">
		    </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" id="btnCal2" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
        <button type="button" id="btnOutput" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>


<!-- Core plugin JavaScript-->
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>