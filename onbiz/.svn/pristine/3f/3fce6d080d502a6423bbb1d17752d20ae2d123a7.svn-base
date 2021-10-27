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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?v=7.1.7">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">

<!-- Gantt Chart 적용 -->
<link rel="stylesheet" href="${path}/settings/dhtmlxgantt_meadow.css" >
<script src="${path}/settings/dhtmlxgantt.js"></script>

<style>

body { font-family: 'Open Sans', Arial, Helvetica, sans-serif;}
  
.folder_row { font-weight: bold;}
  
.group_row, .group_row.odd, .gantt_task_row.group_row {
	background-color: rgba(232, 232, 232, 0.3);
}
	
.highlighted_resource, .highlighted_resource.odd {
	background-color: rgba(255, 251, 224, 0.3);
}

#pagePath {padding:1%; background:transparent;}

.card {margin:1%;}

.card-body {padding:0 1% 0 1%;}

		.fa {
			cursor: pointer;
			font-size: 14px;
			text-align: center;
			opacity: 0.2;
			padding: 5px;
		}

		.fa:hover {
			opacity: 1;
		}

		.fa-pencil {
			color: #ffa011;
		}

		.fa-plus {
			color: #328EA0;
		}

		.fa-times {
			color: red;
		}

</style>
<script type="text/javascript">

function clickGridButton(id, action) {
	switch (action) {
		case "edit":
			gantt.showLightbox(id);
			break;
		case "add":
			gantt.createTask(null, id);
			break;
		case "delete":
			gantt.confirm({
				title: gantt.locale.labels.confirm_deleting_title,
				text: "해당 작업을 삭제할까요?",
				callback: function (res) {
					if(res) gantt.deleteTask(id);
				}
			});
			break;
	}
}

	

//프로젝트 참여 멤버 가져오기 
function memList(no) {
	var mems = [];
	var members = {};
	
	$.ajax({
		type:"get",
		url:"${path}/ongantt.do?method=userList",
		data:"pro_no="+no,
		dataType:"json",
		success:function(data){
			console.log("참여멤버리스트");
			console.log(data.userList);
			
			 $.each(data.userList,function(index, list){
					mems.push({key:list.mem_no, label:list.user});
				});

			members = JSON.parse(JSON.stringify(mems));
			gantt.updateCollection("user", members);

		},
		error:function(err){
			console.log(err);
		}
	});
	
	console.log(mems);
	return members;
}

	$(document).ready(function(){

		var login_emp_no = "${login.emp_no}";
		console.log("로그인한 사람의 emp_no : " + login_emp_no);
		
		var memNo = "mem1001";
		var memlist = [];
		var obj = new Object();
		
		// 초기화면 설정
		console.log("초기 프로젝트 : " + $("#proSel").val());
		ganttShow($("#proSel").val());
		memList($("#proSel").val());
		
		
		
		// 조회할 프로젝트 변경시
		$("#proSel").on("change", function(){
			var proVal = $(this).val();
			console.log("선택한 프로젝트번호: " + proVal);
			ganttShow(proVal);
			memList(proVal);

		});
		
		
		// 간트차트 설정
		gantt.config.date_format = "%Y-%m-%d";
		

		// 간트차트의 레이아웃 설정
		gantt.config.layout = {
				css: "gantt_container",
				cols: [
						{ width:580, min_width:580, 
						  rows:[{view: "grid", scrollX: "gridScroll", scrollable: true, scrollY: "scrollVer"}]
						},
						{resizer: true, width: 1},
						{ width:800, min_width:800,
						  rows:[{view: "timeline", scrollX: "scrollHor", scrollY: "scrollVer"},
								{view: "scrollbar", id: "scrollHor", group:"horizontal"}]
						},
						{view: "scrollbar", id: "scrollVer"}
					]
		};
		
		// 간트차트의 CSS 설정
		gantt.templates.grid_row_class = function(start, end, task){
			var css = [];
			if(gantt.hasChild(task.id)){
				css.push("folder_row");
			}

			if(task.$virtual){
				css.push("group_row")
			}

			if(task.parent == 0){
				css.push("highlighted_resource");
			}

			return css.join(" ");
		};	
		
		
		// 삽입, 수정, 삭제 버튼 
		var colHeader = '<div> </div>',
		colContent = function (task) {
			return ('<i class="fa gantt_button_grid gantt_grid_edit fa-pencil" onclick="clickGridButton(' + task.id + ', \'edit\')"></i>' +
				'<i class="fa gantt_button_grid gantt_grid_add fa-plus" onclick="clickGridButton(' + task.id + ', \'add\')"></i>' +
				'<i class="fa gantt_button_grid gantt_grid_delete fa-times" onclick="clickGridButton(' + task.id + ', \'delete\')"></i>');
		};

		// 간트차트의 왼쪽 그리드 설정
		gantt.config.columns = [
			{name: "wbs", label: "WBS", min_width: 60, width: 60, align: "center", template: gantt.getWBSCode, resize:false},
			{name: "id", align: "center", label: "번호", min_width: 30, width: 30, resize:false},
			{name: "text", label: "작업명", tree: true, min_width: 100, width: 200, resize:false},
			{name: "start_date", label:"시작일", align: "center", width: 90, resize:false},
			{name: "duration", label:"기간", align: "center", width: 60, resize:false},
			{name: "user", label:"담당자",  align: "center", width: 70, resize:false},
			{
				name: "buttons",
				label: colHeader,
				width: 75,
				template: colContent
			}
		];
		
		// 입력창 상위작업 선택 영역 제목 설정
		gantt.locale.labels.section_text = "작업명";
		gantt.locale.labels.section_content = "작업내용";
		gantt.locale.labels.section_time = "작업 일정 선택";
		gantt.locale.labels.section_user = "작업 담당자";
		gantt.locale.labels.section_priority = "작업 우선순위";
		gantt.locale.labels.section_parent = "상위작업";

		// 입력창 커스텀
		gantt.config.lightbox.sections = [
		    {name:"text", 		 height:30, map_to:"text", type:"textarea", focus:true, default_value:""},
		    {name:"content", 	 height:30, map_to:"content", type:"textarea", default_value:""},
		    {name:"user",        height:30, map_to:"mem_no", type:"select", options:gantt.serverList("user")},
		    {name:"priority",    height:30, map_to:"priority", type:"textarea"},
		    {name:"parent", 	 height:30, type:"parent", allow_root:"true", root_label:"상위작업선택"},
		    {name:"time",        height:50, map_to:"auto", type:"duration", time_format:["%Y","%m","%d"]},
		];
		
		// 작업 출력형식 지정
		gantt.templates.task_text = function(start,end,task){
		    return "["+task.text+"] "+task.user;
		};
		
		// 작업 날짜형식 지정
		gantt.templates.task_date= function(date){
		    return gantt.date.date_to_str(gantt.config.date_format)(date);
		};

		// 등록시 입력창의 제목 초기 설정
		gantt.attachEvent("onLightbox", function (task_id){
		    console.log("입력창/상세정보창 열었을때");
		    console.log("입력 task_id : " + task_id);

		    var value = gantt.getLightboxSection('text').getValue();
		    // 새로운 작업 생성시 작업명 초기화 
		    if(value == "New task"){
		    	 gantt.getLightboxSection('text').setValue('');
		    }
		});		

		// 테스크 생성 -> 작업 등록
		gantt.attachEvent("onAfterTaskAdd", function(id,item){

			// 확인용.. 
		    console.log("1작업번호: " + item.id);
		    console.log("2작업명: " + item.text);
		    console.log("3작업시작일: " + item.start_date.toISOString().split("T")[0]);
		    console.log("4작업종료일: " + item.end_date.toISOString().split("T")[0]);
		    console.log("4작업종료일: " + item.end_date.toLocaleString());
		    console.log("5작업기간: " + item.duration);
		    console.log("6작업퍼센트: " + item.progress);
		    console.log("7상위작업: " + item.parent);
		    console.log("8작업우선순위: " + item.priority);
		    console.log("9작업명: " + item.content);
		    
		    console.log("user속성의 할당된 값");
		    console.log("10담당자번호: " + item.mem_no);
		    console.log("11담당자명: " + item.user);
		    
			 // TimeZone으로 다른 시간대 맞춰주기
			var stDte = new Date(item.start_date);
			var edDte = new Date(item.end_date);
			stDte.setDate(stDte.getDate() + 1);
			edDte.setDate(edDte.getDate() + 1);

			// Form에 입력값 할당
		    $("[name=text]").val(item.text);
		    $("[name=content]").val(item.content);
		    $("[name=start_date]").val(stDte.toISOString().split("T")[0]);
		    $("[name=end_date]").val(edDte.toISOString().split("T")[0]);
		    $("[name=duration]").val(item.duration);
		    $("[name=progress]").val(item.progress);
		    $("[name=parent]").val(item.parent);
		    $("[name=priority]").val(item.priority);
		    $("[name=mem_no]").val(item.mem_no);
		
		    ganntCRUD("insertTask"); // 등록 실행
		});
		
		// 테스크 업데이트 -> 작업 수정
		gantt.attachEvent("onAfterTaskUpdate", function(id,item){

		    console.log("업데이트!!");
		    console.log("1작업번호: " + item.id);
		    console.log("2작업명: " + item.text);
		    console.log("3작업시작일: " + item.start_date.toISOString().split("T")[0]);
		    console.log("4작업종료일: " + item.end_date.toISOString().split("T")[0]);
		    console.log("5작업기간: " + item.duration);
		    console.log("6작업퍼센트: " + item.progress);
		    console.log("7상위작업: " + item.parent);
		    console.log("8작업우선순위: " + item.priority);
		    console.log("9작업명: " + item.content);
		    console.log("9담당자명: " + item.user);
		    
		    // Form에 입력값 할당 후 수정 처리 
		    fromAdd(item);
		    ganntCRUD("updateTask");
		});

		// 테스크 삭제 -> 작업 삭제
		gantt.attachEvent("onAfterTaskDelete", function(id,item){
			console.log("삭제!!");
		    console.log("1작업번호: " + item.id);
		    console.log("2작업명: " + item.text);
		    console.log("3작업시작일: " + item.start_date.toISOString().split("T")[0]);
		    console.log("4작업종료일: " + item.end_date.toISOString().split("T")[0]);
		    console.log("5작업기간: " + item.duration);
		    console.log("6작업퍼센트: " + item.progress);
		    console.log("7상위작업: " + item.parent);
		    console.log("8작업우선순위: " + item.priority);
		    console.log("9작업명: " + item.content);
		    console.log("9담당자명: " + item.user);
		    
		    // Form에 입력값 할당 후 삭제 처리 
		    fromAdd(item);
		    ganntCRUD("deleteTask");
		});
		
		// 라이트박스의 save버튼을 눌렀을 때 유효성체크 
		gantt.attachEvent("onLightboxSave", function(id, item){
			var taskStart = item.start_date;
		    var taskEnd = item.end_date;
		    var scaleStart = gantt.config.start_date;
		    var scaleEnd = gantt.config.end_date;

		    if(!item.text){
		    	alert("작업명을 입력하세요!");
		        return false;
		    }
		    if(!item.content){
		    	alert("작업내용을 입력하세요!");
		        return false;
		    }
		    if(!item.mem_no){
		    	alert("담당자를 선택하세요!");
		        return false;
		    }
		    if(!item.priority){
		    	alert("우선순위를 입력하세요!");
		        return false;
		    }
		    if(!item.parent){
		    	alert("상위작업을 선택하세요!");
		        return false;
		    }
		    
		 	// 작업의 기간은 프로젝트의 기간을 넘지않도록 설정
		    if(scaleStart > taskEnd || scaleEnd < taskStart ){
		        alert("프로젝트의 기간은 " + scaleStart.toLocaleString() + " ~ " 
		        		+ scaleEnd.toLocaleString() + "입니다. 다시 선택해주세요!");
		        return false;
		    } 

		    return true;
		});
			
		// 작업의 내용 확인을 위해 오픈 설정
		gantt.config.open_tree_initially = true;
		
		// div에 간트차트 삽입
		gantt.init("gantt_here");
		
		$("#btngo").click(function(){
			location.href="${path}/ontask.do?method=mytaskList";
		});
		
		// Form에 데이터 할당하는 메소드
		function fromAdd(item) {
			
			// TimeZone으로 다른 시간대 맞춰주기
			var stDte = new Date(item.start_date);
			var edDte = new Date(item.end_date);
			stDte.setDate(stDte.getDate() + 1);
			edDte.setDate(edDte.getDate() + 1);
			
			$("[name=text]").val(item.text);
			$("[name=id]").val(item.id);
		    $("[name=content]").val(item.content);
		    $("[name=start_date]").val(stDte.toISOString().split("T")[0]);
		    $("[name=end_date]").val(edDte.toISOString().split("T")[0]);
		    $("[name=duration]").val(item.duration);
		    $("[name=progress]").val(item.progress);
		    $("[name=parent]").val(item.parent);
		    $("[name=priority]").val(item.priority);
		    $("[name=mem_no]").val(item.mem_no);
		    $("[name=pro_no]").val($("#proSel").val());
		}
		
		// 간트차트에 나타낼 작업 호출
		function ganttShow(no) {
			gantt.clearAll();
			$.ajax({
				type:"post",
				url:"${path}/ongantt.do?method=gatlist",
				data:"pro_no=" + no + "&emp_no=" + login_emp_no,
				dataType:"json",
				success:function(data){
					console.log("작업리스트 호출");
					console.log(data);
					obj = data.proDur;
					console.log(obj);
					console.log("프로젝트 시작일 : " + obj.pro_startdte);
					
					gantt.config.start_date = new Date(obj.pro_startdte);
					gantt.config.end_date = new Date(obj.pro_enddte);
					//console.log("프로젝트 시작일 : " + proInfo.pro_startdte);
					//console.log("프로젝트 종료일 : " + proInfo.pro_enddte);
					
					gantt.parse(data);
					gantt.refreshData();
					
				},
				error:function(err){
					console.log(err);
				}
			});
		}
		
		
		function ganntCRUD(method) {
			//gantt.clearAll();
			$.ajax({
				type:"post",
				url:"${path}/ongantt.do?method="+method,
				data:$("#taskFrm").serialize(),
				dataType:"json",
				success:function(data){
					console.log("CRUD");
					console.log(data);
					gantt.parse(data);
					//gantt.refreshData();
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
					
			<!-- Section : 구현 내용 -->
	        <div class="container-fluid">

			
				<ol class="breadcrumb" id="pagePath">
				  <li class="breadcrumb-item"><a href="#">Home</a></li>
				  <li class="breadcrumb-item"><a href="#">내작업</a></li>
				  <li class="breadcrumb-item active">작업관리</li>
				</ol>
				
				<div class="card shadow mb-4">
				  <div class="card-header">
					  <h4>작업 할당</h4>
				  </div>
				  <div class="card-body">
					<div class="row justify-content-between">
						<div class="col-sm-4 col-md-4 col-lg-4"><br>
							<select id="proSel"  class="form-select">
								<c:forEach var="pl" items="${proList}">
									<option value="${pl.pro_no}">${pl.pro_name}</option>
								</c:forEach>
							</select><br>
						</div>
					</div>
					<div id="gantt_here" style='width:100%; height:80vh;'></div><br>
					<div class="row justify-content-between">
					<div class="col-xs-4 col-sm-4 col-ms-4"></div>
					<div class="col-xs-4 col-sm-4 col-ms-4"></div>
					<div class="col-auto">
						<button class="btn btn-primary" type="button" id="btngo">작업목록 이동</button>　
					</div>
				</div><br>
				  </div>
				</div>


 			</div><!-- Section end -->
		</div><!-- End of Main Content -->		
		<jsp:include page="/common/footer.jsp"/>
	</div> 
	<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
    
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
	<i class="fas fa-angle-up"></i>
</a>

<div>
	<form id="taskFrm" class="form"  method="post">
		<input type="hidden" name="id" value="0">
		<input type="hidden" name="text">
		<input type="hidden" name="start_date">
		<input type="hidden" name="end_date">
		<input type="hidden" name="duration">
		<input type="hidden" name="progress">
		<input type="hidden" name="parent" value="0">
		<input type="hidden" name="priority">
		<input type="hidden" name="content">
		<input type="hidden" name="pro_no">
		<input type="hidden" name="mem_no">
	</form>
</div>
</body>
</html>