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
<style>
.row {
width:100%;
margin-left:0%;
}

.col-xl-8 .col-lg-7 {
margin-left:0;
width:100%;
}

.card {
width:98%;
margin-left:10px;
}
placholder {
font-size:80%;
font-weight:400;
}
.custom-select {
margin-bottom :10px;
}
.form-control-sm{
font-size:75%;
}
.navbar{
height:20px;
margin-left:10px;
}

.shadow {
border:1px;
}

</style>

  
</head>
<script type="text/javascript">


//1. 부서번호 검색처리 
			$(document).ready(function(){
				var login_emp_no = "${login.emp_no}";
				var login_auth_name = "${login.auth_name}";
				console.log("로그인한 사람의 emp_no : " + login_emp_no);
				console.log("로그인한 사람의 auth_name : " + login_auth_name);
				
				if(login_auth_name != "pm") {
					alert("PM만 사용가능합니다!");
					history.go(-1);
				}

				$("#dept_name").change(function() {
					var sch4 = $(this).val();
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
								show += "<option id = 'emp_korname' value ="+emp.emp_korname+">"+emp.emp_korname+"</option>";
							});
							$("#selectBox").html(show);
						},
						error:function(err){
							console.log(err);
						}
					});
				})
//2. 사원번호 출력 처리 
				$("#selectBox").change(function() {
					var sch5 = $(this).val();
					var sch4 = $("#dept_name").val();
					console.log(sch4);
					console.log(sch5);
					$.ajax({
					 type:"get",
					 url:"${path}/emptableListAjax.do?emp_korname="+sch5+"&dept_name="+sch4,
					 data:sch5,
					 dataType:"json",
					 success:function(data){
						 var list2 = data.emptablelist;
						 var show2 = "";
						 $(list2).each(function(idx,emplist){
							 show2 += "<tr><td>"+emplist.emp_no+"</td><td>"+emplist.emp_korname+"</td><td>"+emplist.emp_email+"</td><td>"+emplist.emp_hiredate+"</td></tr>";
						 });
//3. 사원추가 목록하단 추가 
						 $("#table").append(show2);
						 
					 },
					 error:function(err){
						 console.log(err);
					 }
					});
				})
//3-3. 파일처리 
			$(".form-control form-control-sm").on("change",function(){
			$(this).next(".small mb-1").text($(this).val());
		});
//4. 프로젝트 내용 등록 처리 
/*
				$("#regBtn").click(function(){
					if(confirm("등록하시겠습니까?")){
						$("#project").attr("action","${path}/proInsert.do");
						$("#project").submit();
					}
				});	
	*/			
			$("#emp_korname").change(function() {
				var pm = $("#emp_korname").val();
				console.log(pm);
				$("[name=emp_no]").text(pm);
				});
				
				
			$("#ordercom_no").change(function() {
					var ordercom_no = $("#ordercom_no").val();
					console.log(ordercom_no);
					$("#ordercom_no2").text(ordercom_no);
					
					});
			$(".spro_kind").change(function() {
					var pro_kind = $(this).val();
					console.log(pro_kind);
					$("[name=pro_kind]").val(pro_kind);	
					});	
			$(".ordercom_no").change(function() {
				var ordercom_no = $(this).val();
				console.log(ordercom_no);
				$("[name=ordercom_no]").val(ordercom_no);	
				});	
	
			$("#pro_budget").on("focus",function(){
				var val = $("#pro_budget").val();	
			if(!isEmpty(val)) {
				val = val.replace(/,/g,"");
				$("#pro_budget").val(val);
			}
			});
			
			$("#pro_budget").on("blur",function() {
				var val = $("#pro_budget").val();
			if(!isEmpty(val)&& isNumeric(val)){
				val=currencyFormatter(val);
				$("#pro_budget").val(val);
			}
		});
		
		
					$( "#pro_startdte,#pro_enddte" ).datepicker({
			            changeMonth: true,
			            changeYear: true,
			            showMonthAfterYear: true,
			            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
			            dateFormat:'yy/mm/dd',
			        });
			       
			       $("#pro_startdte").datepicker("option", "maxDate", $("#pro_startdte").val());
			       $("#pro_startdte").datepicker("option", "onClose", function (selectedDate){
			           $("#pro_enddte").datepicker( "option", "minDate", selectedDate );
			           });
			       
			       $("#pro_enddte").datepicker();
			       $("#pro_enddte").datepicker("option", "minDate", $("#pro_enddte").val());
			       $("#pro_enddte").datepicker("option", "onClose", function (selectedDate){
			           $("#pro_startdte").datepicker( "option", "maxDate", selectedDate );
			          });
			       
			       
			       
			       
			       
			       $("#regBtn").click(function () {
			    	   var result = "등록되었습니다."
			    
			   				$("#project").submit();
			    	  
			   
			       });
			});
			
			/*
			function isEmpty(value){
				
				if(value.length==0 || value ==null){
					return true;
				}else {
					return false;
				}
			}
			
			function isNumeric(value){
				var regExp =/^[0-9]+$/g;
				return regExp.test(value);
			}
			
			function currencyFormatter(amount){
				return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
			}*/
</script>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="/common/sidebar.jsp"/>
        
        <!-- 사이드바 끝 -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                   <jsp:include page="/common/header.jsp"/>
                
                
                <!-- !!섹션 : 구현 내용 입력부분!! -->
               
                  <div class="container-fluid">

                 
                  
                    <!-- Content Row -->
                   
      <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">프로젝트 정보입력</h6>
                                </div>
                                <div class="card-body">
                                    <form id ="project" enctype="multipart/form-data" action="${path}/prolist.do" method="post">
                                  
									<c:set var="today" value="<%=new Date()%>"/>

                                        <label class="small mb-1"  name ="pro_regdte" >등록일</label><span>&nbsp<fmt:formatDate value="${today}"/></span><br>
                                        <label class="small mb-1" >담당자</label><span>&nbsp${login.emp_korname}님</span><br>
                                       
                                        <hr>
                                     
                                         <span class="small mb-1" >프로젝트명</span> <input name ="pro_name" class ="form-control form-control-sm" type = "text" value ="" 
                                         placeholder ="프로젝트명을 입력하세요"><br>
                                        <span class="small mb-1" >프로젝트유형</span>
                                         <select name="spro_kind" class= "custom-select custom-select-sm form-control form-control-sm spro_kind">
                                        <option>전체</option><option>웹</option><option>모바일</option><option>소프트웨어</option></select><br>
                                        <input type="hidden" value =""  id = "pro_kind2" name ="pro_kind"/>
                                       
                                	   <span class="small mb-1" >프로젝트등급</span> <input name ="pro_goal" class ="form-control form-control-sm " type = "text" value ="" placeholder="A/B/C단위로 입력하세요" ><br>
                                       <span class="small mb-1" >프로젝트내용</span> <input name ="pro_content" class ="form-control form-control-sm" type = "text" value ="" placeholder="프로젝트의 내용을 입력하세요"><br>       
                                       <span class="small mb-1" >시작일</span><input name ="pro_startdte" id="pro_startdte" class ="form-control form-control-sm datepicker" type = "text" value ="" >~
                                        <span class="small mb-1" >종료일</span><input name ="pro_enddte" id="pro_enddte"  class ="form-control form-control-sm datepicker2"  type = "text" value ="" ><br>
                                        <span class="small mb-1" >요청예산</span><input name ="pro_budget" id ="pro_budget" 
                                       class ="form-control form-control-sm" type = "text" value ="" placeholder="요청예산을 입력하세요" ><br>
                                        <span class="small mb-1" >발주처</span>
                                            <select id ="ordercom_no" class= "custom-select custom-select-sm form-control form-control-sm ordercom_no" >
                                            <c:forEach var="order" items="${ordercom}">
                                            <option value ="${order.ordercom_no}">${order.ordercom_name}</option>
                                            </c:forEach>
                                            </select><br>
                                            <input type = "hidden" id = "ordercom_no2" name ="ordercom_no"  value =""/>
                    					 <span  class="  small mb-1" >파일명</span><br>
                    					 <input type="text" name= "pro_plandoc" class ="form-control form-control-sm" value="" placeholder="파일명을 입력하세요"/><br>
                                         <span class="small mb-1" >파일을 선택하세요</span><input type="file" name="report" class="form-control form-control-sm" id="file01">
										     		
                                    <hr>
                                    <span class="small mb-1" >수정내역</span> <textarea name ="pro_uptcontent" class ="form-control form-control-sm " type = "text" value =""
                                    placeholder="프로젝트 수정내역을 입력하세요 (신규입력시 입력하지 마세요)" ></textarea><br>
                                    <input type="button" align = 'center' class="btn btn-outline-primary"  value="등록" id="regBtn">
	   							
	   							 </form>
                                </div>
                            </div>

                        </div>

                     
                               
                                <!-- Card Body -->
                            <!--    <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        
                                        <p class="small mb-1" > 구성원 등록 </p>
                                        
                                           <select id ="dept_name" name = "dept_name"  class= "custom-select custom-select-sm form-control form-control-sm">
                                         <option value="" selected="selected">전체</option>
                                        <c:forEach var="deptlist" items="${dept}">
                                            <option value ="${deptlist.dept_name}" >${deptlist.dept_name}</option>
                                            </c:forEach></select> 
                                  
                                        <select id ="selectBox" name = "dept_name_sub" class= "custom-select custom-select-sm form-control form-control-sm">
                                      
                                        </select> <p>+</p><br>
                                        
                                        <div class ="div1">
                                        <table  class ="table table-bordered dataTable">
                                        <thead>
                                        <tr>
                                        <th>연번</th><th>사원번호</th><th>이름</th>
                                        
                                        </thead>
                                        <tbody id ="table">  
                                        <tr> <td>1</td><td>7889</td><td>유재석</td></tr>
                                      
                                        </tbody>
                                        </table>
                                    
                                    </div>
                                 
                                   <div>
                                   <table id="table2">
                                   
                                   </table>
                                   </div>
                                    </div>
                                 
                                    <p></p>
                                    <p></p>
                                    
                                 <div class="card-body">
                                 <div class="chart-pie pt-4">
                                 <p class="small mb-1" > </p>    
                                
	   							 </div>-->
	   							
 								 </div>
 	

                                </div>
                            </div>
                        </div>
                        
                    </div>

                    </div>
                        </div>
                    </div>

                </div>
               
                <!--  섹션 끝  -->

            <!-- End of Main Content -->

            <!-- Footer -->
           <jsp:include page="/common/footer.jsp"/>

            <!-- End of Footer -->

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
</body>
</html>