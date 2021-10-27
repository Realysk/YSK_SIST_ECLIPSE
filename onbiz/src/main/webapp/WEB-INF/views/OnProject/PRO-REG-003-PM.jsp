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

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" 
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,
	400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/bootstrap.min3.css">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">


<style>
.card-body{
height:750px;
}
#dataTable{
width:100%;
font-align:center;
}
#button{
margin-top:600px;
}
.navbar{
height:20px;
margin-left:7px;
}

.table>tbody td {
padding: 0.5rem;
text-align:center;
font-size:11px;
}
.table>tbody th {
padding: 0.5rem;
text-align:center;
font-size:11px;
}

</style>
</head>
<script type="text/javascript">

			//1. 부서번호 검색처리 
			$(document).ready(function(){
				$("[name=pro_state]").change(function() { 
				var pro_state = $("[name=pro_state]").val();
				var sessionEmpNo = $("[name=sessionEmpNo]").val();
				console.log(sessionEmpNo);
				//var pro_kind = $("[name=pro_kind]").val();
			//	var pro_name = $("[name=pro_name]").val();
				console.log(pro_state);
			//	console.log(pro_kind);
			//	console.log(pro_name);
					$.ajax({
						type:"get",
						url:"${path}/projectlistajax.do?pro_state="+pro_state+"&emp_no="+sessionEmpNo,//+"&pro_name="+pro_name,//+"&pro_kind="+pro_kind
						//async:false,
						data:pro_state,sessionEmpNo,//,pro_kind,pro_name
						dataType:"json",
						success:function(data){
							var list = data.projectlist;
							var show ="";
							$(list).each(function(idx,pro){
								show += "<tr><td class ='pro_no' value ="+pro.pro_no+">"+pro.pro_no+
								"</td><td>"+pro.pro_name+"</td><td>"+pro.pro_startdte+
								"</td><td>"+pro.pro_enddte+"</td><td>"+pro.pro_kind+
								"</td><td>"+pro.pro_state+"</td><td>"+pro.pm+"</td><td><button class= 'badge rounded-pill bg-dark' value ="+pro.pro_no+">수정</button></td><td><button class= 'badge rounded-pill bg-dark' value = 'pro_no' >삭제</button></td></tr>"
							});
							$(".prolist").html(show);
						},
						error:function(err){
							console.log(err);
						}
					});
				});
				
				$("[name=pro_kind]").change(function() { 
					var pro_kind = $("[name=pro_kind]").val();
					var sessionEmpNo = $("[name=sessionEmpNo]").val();
					console.log(pro_kind);
					//var emp_no = $("[name=emp_no]").val();
					//console.log(emp_no);
					//	console.log(pro_kind);
					//	console.log(pro_name);
						$.ajax({
							type:"get",
							url:"${path}/projectlistajax2.do?pro_kind="+pro_kind+"&emp_no="+sessionEmpNo,//+"&emp_no="+emp_no,//+"&pro_name="+pro_name,
							data:pro_kind,sessionEmpNo,//,pro_kind,pro_name
							dataType:"json",
							success:function(data){
								var list = data.projectlist2;
								var show ="";
								$(list).each(function(idx,pro){
									show += "<td value ='"+pro.pro_no+"'>"+pro.pro_no+"</td><td>"+pro.pro_name+"</td><td>"+pro.pro_startdte
									+"</td><td>"+pro.pro_enddte+"</td><td>"+pro.pro_kind+"</td><td>"+pro_pro_state+"</td><td>"+pro.pro_emp_korname
									+"</td><td><button  class= 'badge rounded-pill bg-dark' >수정</button></td><td><button>작업</button></td></tr>";
								});
								$(".prolist").html(show);
							},
							error:function(err){
								console.log(err);
							}
						});
					});	
				
				//검색처리 
				$("#schpro").click(function() { 
					var pro_name = $("#pro_name").val();
					var sessionEmpNo = $("[name=sessionEmpNo]").val();
					console.log(pro_name);
						$.ajax({
							type:"get",
							url:"${path}/projectsch.do?pro_name="+pro_name+"&emp_no="+sessionEmpNo,
							//async:false,
							data:schpro,sessionEmpNo,
							dataType:"json",
							success:function(data){
								var list = data.projectsch;
								var show ="";
								$(list).each(function(idx,pro){
									show += "<tr><td class ='pro_no' value = "+pro.pro_no+">"+pro.pro_no+
									"</td><td>"+pro.pro_name+"</td><td>"+pro.pro_startdte+
									"</td><td>"+pro.pro_enddte+"</td><td>"+pro.pro_kind+
									"</td><td>"+pro.pro_state+"</td><td>"+pro.emp_korname+"</td><td><button value ='"+pro.pro_no
									+"'>수정</button></td><td><button class= 'task' value = 'pro_no' >작업</button></td></tr>"
									//ondblclick='javascript:detail(" + tk.id +")'
								});
								$(".prolist").html(show);
							},
							error:function(err){
								console.log(err);
							}
						});
					});	
				
					$(document).delegate(".pro_no","click",function(){
						var pro_no = $(this).text();
						console.log(pro_no);
						location.href = "${path}/proDetail.do?pro_no="+pro_no;
					});
					
					
					
					//수정버튼 
					$(document).delegate(".pro_no22","click",function(){
						var pro_no2 = $(this).val();
						//var pro_no2 = pro_no;
						console.log(pro_no2);
						location.href = "${path}/getViewProReg.do?pro_no="+pro_no2;
					});
					
					
					
					
		
		});	
</script>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">
<jsp:include page="/common/sidebar.jsp"/>


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                
                    <!-- Topbar Navbar -->
               <jsp:include page="/common/header.jsp"/>
               
                <!-- 상단바 끝 -->
                
             <div class="container-fluid">
				
                    <!-- Page Heading -->
                  
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">나의 프로젝트 리스트</h6>
                        </div>
                        
                        <div class="card-body">  <form id="frm01" method="post">
                <input type="hidden"/>
                   
                    <!-- DataTales Example -->
                  
                     
                        <div class="card-body">
                           
                                
                                	<div class="row">
                                		<div class="col-sm-12 col-md-6">
                                		
                                				<label>
                                					<select name ="pro_state" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm ">
                                						<option value="">상태 선택</option>
                                						<option value="진행중">진행중</option>
                                						<option value="완료">완료</option>
                                					
                                					</select>
                                				</label>
                                				&nbsp;
                                				<!-- 콤보박스로 검색 -->
                                				<label>
                                					<select name="pro_kind" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                						<option value="분류선택">분류선택</option>
                                						<option value="웹">웹</option>
                                						<option value="모바일">모바일</option>
                                						<option value="모바일">소프트웨어</option>
                                					</select>
                                				</label>
                                				&nbsp;

												<label>
													<input type="text" class="form-control form-control-sm pro_name" id="pro_name" value ="" placeholder="프로젝트 검색" aria-controls="dataTable">
												</label>    
												<lable>
												<input type="button" id ="schpro" class="btn btn-secondary dark" value ="검색"/>
												</lable>
                                		</div>		
                                		<input type = "hidden" value ="${sessionEmpNo}" name = "sessionEmpNo"/>
                                		
                                </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" 
                                cellspacing="0">
                                    <thead>
                                 <col width="8%">
   								<col width="15%">
   								<col width="10%">
   								  <col width="10%">
   								<col width="7%">
   								<col width="7%">
   								  <col width="7%">
   								<col width="7%">
   								<col width="7%">
   			
                                        <tr>
                                            <th>프로젝트번호</th>
                                            <th>프로젝트명</th>
                                            <th>시작일</th>
                                            <th>종료일</th>
                                            <th>종류</th>
                                            <th>상태</th>
                                            <th>PM</th>
                                            <th>수정</th>
                                            <th>삭제</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody class ="prolist">
                                       <c:forEach  items = "${getprolistloading}" var ="getprolistloading">
                                      <tr><td>${getprolistloading.pro_no}</td>
                                      <td>${getprolistloading.pro_name}</td>
                                      <td><fmt:formatDate pattern="yyyy/MM/dd " value="${getprolistloading.pro_startdte}"/> </td>
                                      <td><fmt:formatDate pattern="yyyy/MM/dd " value="${getprolistloading.pro_enddte}"/> </td>
                                      <td>${getprolistloading.pro_kind}</td>
                                      <td>${getprolistloading.pro_state}</td>
                                      <td>${getprolistloading.pm}</td>
                                      <td>수정</td>
                                      <td>삭제</td>
                                      </tr>
                                     </c:forEach>
                                    </tbody>
                                </table>
                            </div>
              
                 <ul class="pagination justify-content-center">
		
	  <li class="page-item"><a class="page-link" 
	  	href="javascript:goPage(${OnRiskSch.startBlock-1})">Previous</a></li>
	  
		  <c:forEach var="cnt" begin="${OnRiskSch.startBlock}" 
		  	end="${OnRiskSch.endBlock}">
		  <li class="page-item ${OnRiskSch.curPage==cnt?'active':''}">
		  	<a class="page-link" href="javascript:goPage(${cnt})">1</a></li>
		  </c:forEach>
	  <li class="page-item"><a class="page-link" 
	  href="javascript:goPage(${OnRiskSch.endBlock+1})">Next</a></li>
	</ul>    

                </div>

          
            <!-- End of Main Content -->

            <!-- Footer -->
           <jsp:include page="/common/footer.jsp"/>

            <!-- End of Footer -->

        </div>
        

    </div>

</body>
</html>