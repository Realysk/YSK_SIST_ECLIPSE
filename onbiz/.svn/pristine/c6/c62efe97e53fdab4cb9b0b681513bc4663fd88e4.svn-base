<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" 
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,
	400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">


<style>
.card-body{
height:600px;
}
#dataTable{
width:100%;
font-align:center;
}
#button{
margin-top:600px;
}
 .input-group>.input-group-prepend>.input-group-text {
 width:200px;
 }
</style>
</head>
<script type="text/javascript">
var login_emp_no = "${sessionEmpNo}";
var sessionEmpauth = "${sessionEmpauth}";
console.log("로그인유저의 emp_no : " + login_emp_no);
console.log("선택한 프로젝트의 멤버번호 : " + sessionEmpauth);

	$(document).ready(function(){
		
		//등록 
		/*
		var isInsert = "${detail.risk_name}";
		if(isInsert!=""){
			if(confirm("등록되었습니다!\n계속등록하시겠습니까?")){
				$(":input").val("");
				$("[name=risk_no2]").val(0);
				$("[name=risk_no]").val(0);
			}else{
				$("#list").submit();
			}
		}
		*/
		
		//7. 태스크 이름 가져오기 
		$("#pro_no3").change(function() {
			var projectname2 = $(this).val();
			console.log(projectname2);
			 $("[name=pro_no]").val(projectname2);
			$.ajax({
			 type:"get",
			 async: false,
			 url:"${path}/Onrisk.do?method=tasklist&pro_no="+projectname2+"&emp_no="+login_emp_no, 
			 data:projectname2,
			 dataType:"json", 
			 success:function(data){
				 var list2 = data.tasklist;
				 var tasklist2= "";
				 $(list2).each(function(idx,tasklist){
					 tasklist2 += "<option value = "+tasklist.task_no+">"+tasklist.task_name+"</option>";
				 });
				 $("#tasklist").html(tasklist2);
				 
			 },
			 error:function(err){
				 console.log(err);
			 }
			});
		});
		
		
		//8. 태스크이름 선택 시 멤버번호할당 
			$("#tasklist").change(function() {
			var taskno = $(this).val();
			//${"#task_no"}.val(taskno);
			console.log(taskno);
			$.ajax({
			 type:"get",
			 async: false,
			 url:"${path}/Onrisk.do?method=memname&task_no="+taskno, 
			 data:taskno,
			 dataType:"json", 
			 success:function(data){
				 var list2 = data.memname;
				 var mem_name= "";
				 $(list2).each(function(idx,memname){
					 mem_name += "<input type ='text' value ='"+memname.mem_no+"' class='form-control'  name ='mem_no' readonly/>";
					 console.log(mem_name);
				 });
				 $("#memname").html(mem_name);
				 
			 },
			 error:function(err){
				 console.log(err);
			 }
			});
		});
		
		//2. 조회화면 
		$("#goMain").click(function(){
			$(location).attr("href","${path}/Onrisk.do?method=list&emp_korname='"+${login.emp_korname}+"'&emp_no="+${login.emp_no}+"&auth_name='"+${login.auth_name}+"'");	
		});
		//3. 등록처리 
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#Onrisk").submit();
			}
		});
	
		
		//4. 파일처리 custom-file-input custom-file-label
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});

		//5. 프로젝트 값 옮기기 
		
		$(".pro_no11").change(function() {
		 var pro_no = $(this).val();
		 console.log(pro_no);
		 $("[name=pro_no]").val(pro_no);
		});
		
		
		$(".tasklist").change(function(){
			var task_no = $(this).val();
			console.log(task_no);
			$("[name=task_no]").val(task_no);
		});
		
		//6. 상태값 담기 
		$(".risk_state").change(function() {
			 var risk_state = $(this).val();
			 console.log(risk_state);
			 $("[name=risk_state]").val(risk_state);
			});			
		
		//7. 종류 값 담기 
		$(".risk_kind").click(function() {
			 var risk_kind = $(this).val();
			 console.log(risk_kind);
			 $("[name=risk_kind]").val(risk_kind);
			});
	    $("#risk_occdte").datepicker();    
	    
		
	
		
	});
</script>
<body>
 <body id="page-top">
 <!-- Topbar -->
                
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
					<li class="breadcrumb-item">리스크관리</li>
					<li class="breadcrumb-item active">리스크등록</a></li>
					
				</ol>
               
				<form id="list" action="${path}/onapproval.do?method=applist" method="post">
					<input type="hidden" value="1">
				</form>               
               
              <form id="Onrisk" enctype="multipart/form-data" action="${path}/Onrisk.do?method=insert&emp_korname=${login.emp_korname}&emp_no=${login.emp_no}&auth_name=${login.auth_name}" method ="post">
               		<input type="hidden"/>
                    <!-- DataTales Example -->
                  
                    <div class="card my-4">
                        <h5 class="card-header">리스크 등록</h5>
                        <div class="card-body">
							<div class="form-group row">
				            	<label class="col-sm-1 col-form-label text-center">제 목</label>
				                	<div class="col-sm-5">
				                       <input name="risk_name" value="${detail.risk_name}" class="form-control" />
				                    </div>
				                    
				               	<label class="col-sm-1 col-form-label text-center">유형</label>
				               	 <div class="col-sm-5">
				              	       <select  class= "custom-select custom-select-sm form-control form-control-sm  risk_kind">
 										<option>유형</option>
 		   								 <option value ="기술">기술</option>
 		   								 <option value ="일정지연">일정지연</option>
 										</select>
 										<input type="hidden" value= "" name = "risk_kind"/>
				                     </div>  
				            </div>
							<div class="form-group row">
							<label class="col-sm-1 col-form-label text-center">프로젝트</label>
				                	<div class="col-sm-5">
				            	 <select name = "projectname2" id = "pro_no3" class= "custom-select custom-select-sm form-control form-control-sm prono11" >
 			<option>프로젝트</option>
 			<c:forEach var = "projectlist" items ="${projectlist}">
 		    <option value ="${projectlist.pro_no}">${projectlist.pro_name}</option>
			</c:forEach>
 			</select>
 			<input type="hidden" value= "" name = "pro_no"/>
				                    </div>
				               	<label class="col-sm-1 col-form-label text-center">작업명</label>
				                    <div class="col-sm-5">
				                    <select id = "tasklist" class ="custom-select custom-select-sm form-control form-control-sm tasklist">
				                    
				                    </select>
				                     <input type = "hidden" name="task_no" class="form-control" value="" />	
				                       </div>
				                     
				            </div>
							<div class="form-group row">
				            	<label class="col-sm-1 col-form-label text-center">멤버</label>
				                	<div class="col-sm-5" id ="memname">
				                       <input name="mem_no" id="mem_no" class="form-control" 
										value="" readonly/>	
				                    </div>
				               	<label class="col-sm-1 col-form-label text-center">상태</label>
				                    <div class="col-sm-5">
				                        <select class= " custom-select custom-select-sm form-control form-control-sm risk_state" >
 			<option>상태</option>
 		    <option value ="오픈">오픈</option>
 		    <option value ="홀드">홀드</option>
 		    <option value ="조치중">조치중</option>
 		    <option value ="완료">완료</option>
 			</select>
 			<input type="hidden" value= "" name = "risk_state"/>
				                    </div>
				            </div>				            
							<div class="form-group row">
				            	<label class="col-sm-1 col-form-label text-center">발생일</label>
				                	<div class="col-sm-5">
				                     <input name="risk_occdte" id ="risk_occdte" class="form-control datepicker" type = "text" value =""
									value="${detail.risk_occdte}" placeholder="발생일을 입력하세요" />	
				                    </div>
				               	<label class="col-sm-1 col-form-label text-center">작 성 자</label>
				                    <div class="col-sm-5">
				                      <input class="form-control" placeholder="작성자입력하세요" value ="${login.emp_korname}" readonly />	
				                    </div>
				            </div>
							<div class="form-group row">
								
				            	<label class="col-sm-1 col-form-label text-center">첨부파일</label>
				                	<div class="col-sm-5">
				                     	<input type="file" name="report" class="custom-file-input"  placeholder="첨부파일을선택하세요" id="file01" >
										<input class="form-control" id="fname"
										value="${detail.report}" />		
				                    </div>
				                
				               	<label class="col-sm-1 col-form-label text-center">상위글번호</label>
				                    <div class="col-sm-5">
				                       <input name="risk_no2" class="form-control" 
				placeholder="상위글번호" value="${detail.risk_no2}" readonly/>	
				                    </div>
				            </div>
							<div class="form-group row">
				               	<label class="col-sm-1 col-form-label text-center">내 용</label>
				                    <div class="col-sm-12">
								    	<textarea name="risk_content" rows="6" 
				class="form-control" 
				placeholder="내용입력하세요" >${detail.risk_content}</textarea>	
				                    </div>   
				            </div>				                       			            			            
                        </div>
                      
                    	<div style="text-align:right; margin:1%;">
                    			
                    			<button type="button"  id="regBtn"  class="btn btn-info">등록</button>
			<button type="button"  id="goMain"  class="btn btn-success">조회 화면으로</button>
						</div>                      
                        
                    </div>
                    
                    </form>
                
                </div>
                <!--  섹션 끝  -->

            </div>
            <!-- End of Main Content -->
			<jsp:include page="/common/footer.jsp"/>

        </div>
       
    
  
</body>
</html>