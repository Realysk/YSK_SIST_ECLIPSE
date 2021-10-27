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
height:100%;
width: 900px;
}
.col-lg-4{
width:1000px;
}
#dataTable{
width:100%;
font-align:center;
}

.modal-dialog2  {
width:1000px;
margin:1.75rem auto;
}
.btn{
float:right;
font-size: 80%;
margin-bottom:10px;
}

.addbtn{
float:center;
font-size: 80%;
margin-bottom:10px;
}

.table>tbody td {
padding: 0.5rem;
text-align:center;
}

.table>tbody th {
padding: 0.5rem;
text-align:center;
}

th {
padding: 0.5rem;
text-align:center;
}
#pro {
margin-left:2px;
}


</style>
</head>
<script type="text/javascript">

//1. 부서번호 검색처리 - 멤버 목록(추가 시)	

				$(document).ready(function(){
					//var emp_no = "${login.emp_no}";
					var login_emp_no = "${login.emp_no}";
					var login_auth_name = "${login.auth_name}";
					var login_emp_korname = "${login.emp_korname}";
					console.log("로그인한 사람의 emp_no : " + login_emp_no);
					console.log("로그인한 사람의 auth_name : " + login_auth_name);
					
					if(login_auth_name != "pm") {
					 $(".del").attr("disabled", true);
					 $(".ch").attr("disabled", true);
					 $("#ad").attr("disabled", true);
						alert("TM은 정보조회만 가능합니다.");
					} 

				//1. 부서번호 검색처리 - 멤버 목록(추가 시)	
				$("#dept_name").change(function() {
					var sch4 = $(this).val();
					//$("#dname").text(sch4);
					console.log(sch4);
					$.ajax({
						type:"get",
						url:"${path}/empnameListAjax.do?dept_name="+sch4,
						//async:false,
						data:sch4,
						dataType:"json",
						success:function(data){
							var list = data.empnamelist;
							
							var show ="";
							$(list).each(function(idx,emp){
								show += "<tr><td>"+emp.emp_no+"</td><td><p class= 'emp_korname' value ='"+emp.emp_korname+"'>"
								+emp.emp_korname+"</td><td>"+emp.auth_name+"</td><td>"+emp.ptn_name
								+"</td><td><button class=' btn-primary addbtn' onclick = 'uptA("+emp.emp_no+")'>추가</button></td><tr></div>";
							
							});
							$(".selectBox").html(show);
						},
						error:function(err){
							console.log(err);
						}
					});
				});
				
			
	
				
		//6. 프로젝트 상세 
		$("#pro").click(function(){
		var pro_no = $("#pro_no2").val();
		location.href="${path}/prolist.do?pro_no="+pro_no;
		});
		
		
		$("#backReg").click(function() {
		$("#exampleModalCenter1").display="none";
		});
		
		
		});	
		
		//6. 멤버수정
			function uptA(emp_no){
				
				
						var pro_no= $("#pro_no2").val();
						alert(emp_no+"/"+pro_no);
						location.href = "${path}/memberupt2.do?pro_no="+pro_no+"&emp_no="+emp_no;
					
				}
			
		//5. 멤버삭제처리 
		function deleteA(mem_no,pro_no){
			//alert(mem_no+"/"+pro_no);
			location.href = "${path}/deletemem.do?mem_no="+mem_no+"&pro_no="+pro_no;
		}
		
		
	    //6. 변경버튼 클릭 시 처리 
	    	function changeA(mem_no){
	    		
					//var mem_no = $(this).val();
					console.log(mem_no);
					alert(mem_no);
					//var pro_no = $("#name=pro_no").text(pro_no);
					
					$.ajax({
						type:"get",
						url:"${path}/memobjajax.do?mem_no="+mem_no,
						//async:false,
						data:mem_no,
						dataType:"json",
						success:function(data){
							var list = data.memobj;
							var show ="";
							var show2 = "";
							$(list).each(function(idx,emp){
								//show += "<div class ='p-3 bg-gray-200' ><p class= 'emp_korname' value ='"+emp.emp_korname+"'>"+emp.emp_korname+"</p></div>";
								show += "<tr><td>"+emp.mem_no+"</td><td>"+emp.emp_no+"</td><td>"+emp.emp_korname+"</td><td>"
								+emp.mem_regdte+"</td><td><input type ='text' class ='datepicker' id = 'mem_witdte' value ="
								+emp.mem_witdte+"></td><td>"+emp.pro_no+"</td><td><select id ='mem_state'><option>"+emp.mem_state+"</option><option value ='활동'>활동</option><option value ='미활동'>미활동</option></select></td></tr>";
								show2 += "<input type ='hidden' value ='"+emp.mem_no+"' id = 'mem_no' />";
							});
							
							$(".selectBox3").html(show);
							$(".box3").html(show2);
						},
						error:function(err){
							console.log(err);
						}
					});
				
	    }
	    
	 //   7. 모달창에서 변경버튼 클릭 시 
	    	function changeB(){
			var mem_no = $("#mem_no").val();
			console.log(mem_no);
			var mem_witdte = $("#mem_widte").val();
			console.log(mem_witdte);
			var mem_state = $("#mem_state").val();
			console.log(mem_state);
			//alert(mem_state);
			var pro_no= $("#pro_no2").val();
			console.log(pro_no);
			alert(mem_no);
			alert(mem_witdte);
			alert(mem_state);
			alert(pro_no);
			$("[name=pro_no]").text(pro_no);
			location.href = "${path}/updatemem.do?mem_no="+mem_no+"&mem_state="+mem_state+"&pro_no="+pro_no+"&mem_widte="+mem_witdte;
		}
				
</script>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">

      <jsp:include page="/common/sidebar.jsp"/>


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                 <jsp:include page="/common/header.jsp"/>
                <!-- 상단바 끝 -->
                
               <!-- Begin Page Content -->
                <div class="container-fluid">
   <ol class="breadcrumb" id="pagePath">
					<li class="breadcrumb-item">나의 프로젝트 리스트 </li>
					<li class="breadcrumb-item">프로젝트 상세</li> &nbsp
					<li class="breadcrumb-item active"><a href="${path}/onapproval.do?method=applist">프로젝트 멤버상세</a></li>
				
				</ol>
                    <!-- Content Row -->
                    <div class="row">
  					<div class="card-body">
                                    <div class="chart-pie pt-4"> 
                           
                                 <button class="btn btn-success btn-icon-split" data-toggle="modal" 
								data-target="#exampleModalCenter" id ="ad">구성원추가</button>
                                 <table class="table table-bordered" vertical-align='middle' id="dataTable" width="100%" 
                                cellspacing="0">
<!--<col width="5%">-->
   	<col width="5%">
   	<col width="5%">
   	<col width="7%">
   	<col width="10%">
   	<col width="5%">
   	<col width="10%">
   
   	<col width="5%">
   	<col width="7%">
   	<col width="5%">
   	<col width="5%">


								
								<tr>
								<!--  <th>사진</th>-->
								<th>사원번호</th>
								<th>멤버번호</th>
								<th>이름</th>
								<th>부서명</th>
								<th>직급명</th>
								<th>이메일</th>
								<!--<th>등록일</th>-->
							<!--<th>철회일</th>-->
								<th>상태</th>
								<th>프로젝트번호</th>
								<th>수정</th>
								<th>삭제</th>
								</tr>
                                 <c:forEach var="memdetail" items="${memdetail}">
                                	<tr>

                                	<td><p>${memdetail.emp_no}</p></td>
                                	<td><p>${memdetail.mem_no}</p></td>
                                	<td>${memdetail.emp_korname}</td>
                                	<td>${memdetail.dept_name}</td>
                                	<td>${memdetail.auth_name}</td>
                            		<td>${memdetail.emp_email}</td>
                            		<input type="hidden" value ="${memdetail.pro_no}" id ="pro_no2"/>
                            		
                            		<td>${memdetail.mem_state}</td>	
                            		<td>${memdetail.pro_no}</td>	
                            		
                            		<td><button  data-toggle="modal" 
									data-target="#exampleModalCenter1" id ="ch" class=" badge rounded-pill bg-dark ch"  onclick = "changeA('${memdetail.mem_no}')" >변경</button></td>
                            		<td><button id = "del" class=" badge rounded-pill bg-dark del"  onclick = "deleteA('${memdetail.mem_no}','${memdetail.pro_no}')" > 삭제 </button></td>
                                	</tr>
                                </c:forEach>
                                </table>
                              
                                    </div>
                                  
                                 
                                </div>
                       
					
                    </div>
				
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

          

            <!-- End of Footer -->

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
  <div class="modal-dialog2 modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">프로젝트 멤버추가</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="regFrm" class="form" action ="${path}/memberupt2.do" method="post">
		 <input type  = "hidden" value ="" name ="pro_no"/>
		<input type ="hidden" value ="" name ="emp_no" id="emp_no2"/>
		</form>
			 <!-- First Column -->
                        <div class="col-lg-4">
                            <!-- Custom Text Color Utilities -->
                          
                                
                                <div class="card-body">  
                                     <div class="table-responsive">
                                        <select id="dept_name" selected>
                                 <c:forEach var="deptlist" items="${dept}">
  									<option value="${deptlist.dept_name}">${deptlist.dept_name}</option>
                                	 </c:forEach>
									</select>
                                	<table class="table table-bordered" id="dataTable" width="100%" 
                               		 cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>사원번호</th>
                                            <th>사원명</th>
                                            <th>권한</th>                             
                                            <th>직급</th>                             
                                            <th>추가</th>
                                         
                                        </tr>
                                    </thead>
                                    <tbody class ="selectBox">
                                      
                                    </tbody>
                                </table>
                            </div>
                          
                                 </div>
                                
                            
                            
                            </div>
                          
                      
					
                        
                                <!-- Card Header - Dropdown -->
         
                        </div> 
						                     
                        
                       
			  <div class="modal-footer">
			  
   <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id="btnReg" class="btn btn-primary">등록</button>
        
      </div>
                        

                       
	   
      </div>
    
    </div>
  </div>

    <jsp:include page="/common/footer.jsp"/>
  
    
    
    
    
    
    <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog2 modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">프로젝트 멤버 수정</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="regFrm" class="form" action ="${path}/memberupt2.do" method="post">
		 <input type  = "hidden" value ="" name ="pro_no"/>
		<input type ="hidden" value ="" name ="emp_no" id="emp_no2"/>
		</form>
			 <!-- First Column -->
                        <div class="col-lg-4">
                            <!-- Custom Text Color Utilities -->
                          
                                
                                <div class="card-body">  
                                     <div class="table-responsive">
                                     
                                <form action ="${path}/memdelete.do" method = "post" id ="frmdel" >
                                <table class="table table-bordered" id="dataTable" width="100%" 
                                cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>멤버번호</th>
                                            <th>사원번호</th>
                                            <th>사원이름</th>                             
                                            <th>등록일</th>                             
                                            <th>철수일</th>                             
                                            <th>프로젝트번호</th>                             
                                            <th>상태</th>                                
                                        </tr>
                                    </thead>
                                    <tbody class ="selectBox3">       
                                    </tbody>
                                </table>
                                <div class ="box3" ></div>
                                </form>  
                            </div>   
                                 </div>                     
                            </div>
                        </div>                     
			  <div class="modal-footer">
        <button type="button" id="backReg" class="btn btn-secondary" data-dismiss="modal"  aria-label="Close">취소</button>
        <button type="button" id="delReg" class="btn btn-secondary" data-dismiss="modal">삭제</button>
        <button type="button" id="btnReg"  onclick = "changeB()"  class="btn btn-primary">등록</button>
      </div>
                        

                       
	    </form> 
      </div>
    
    </div>
  </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>