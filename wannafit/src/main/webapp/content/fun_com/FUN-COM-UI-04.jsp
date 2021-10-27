<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">

$("#schBtn").click(function() {
	schFun();
});

//3. 펀딩함수 				
function schFun() {
	var xhr = new XMLHttpRequest();
	var categoryV = $("[name=category]").val();
	var stateV = $("[name=state]").val();
	
	var qstr = "proc=sch&cfp_atecory=" + categoryV + "&fp_state=" + stateV;
	xhr.open("get", "${path}/fundingsup.do?" + qstr, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var flist = JSON.parse(xhr.responseText);
			console.log(flist);
			var show = "";
			$(flist).each(
					function(idx, fundinglist) {
						show += "<tr id='detail2' onclick='detail("+fundinglist.id+")' class='text-center'><td>"
								+ fundinglist.id + "</td>";
						show += "<td>" + fundinglist.fp_category + "</td>";
						show += "<td>" + fundinglist.fp_title + "</td>";
						show += "<td>" + fundinglist.fp_state + "</td>";
						show += "<td>" + fundinglist.fp_enddate
								+ "</td></tr>";

					});
			
			$(".tbody").html(show);
		}
	};
	xhr.send();
}

});

	// script 바로 하단에 선언하세요.
	/*
	function detail(empno){
		$("#frm02 [name=ename]").val("홍길동");
		//alert(empno);
		
	} */	
	$("#regBtn").on("click",function(){
		
		console.log($("#frm02").serialize());
		
		xhr.open("get","${path}/ajaxEmp.do?proc=insert&"+$("#frm02").serialize(),true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				var elist = JSON.parse(xhr.responseText);
				//console.log(elist);
				if(!confirm("등록 성공\n계속 등록하시겠습니까?")){
					$("#clsBtn").click();// 닫기 처리를 강제 실행을 통해 모달 창 닫힘
				}
				// form의 입력 내용 초기화 처리..
				$("#frm02").each(function(){
					this.reset();
				});		
				var show="";
				$(elist).each(function(idx,emp){
					show+="<tr class='list text-center' data-toggle='modal' onclick='detail("+emp.empno+")' data-target='#exampleModalCenter'><td>"
							+emp.empno+"</td>";
					show+="<td>"+emp.ename+"</td>";
					show+="<td>"+emp.job+"</td>";
					show+="<td>"+emp.sal+"</td>";
					show+="<td>"+emp.deptno+"</td></tr>";
				});
				$("tbody").html(show);
				
			}
		};
		xhr.send();				
		
	});

});

function detail(empno){
	$("#exampleModalLongTitle").text("사원정보상세");
	$("#regBtn").text("수정");
	xhr.open("get","${path}/ajaxEmp.do?proc=detail&empno="+empno,true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4&&xhr.status==200){
			var emp = JSON.parse(xhr.responseText);
			$("#frm02 [name=empno]").val(emp.empno);
			$("#frm02 [name=ename]").val(emp.ename);
			$("#frm02 [name=job]").val(emp.job);
			$("#frm02 [name=mgr]").val(emp.mgr);
			$("#frm02 [name=hiredateS]").val(emp.hiredate.toLocaleString());
			$("#frm02 [name=sal]").val(emp.sal);				
			$("#frm02 [name=comm]").val(emp.comm);				
			$("#frm02 [name=deptno]").val(emp.deptno);				
		}
	};
	xhr.send();			
	
}	
</script>
</head>

<body>
<div class="jumbotron text-center">
<h2 >사원정보</h2>
</div>
<div class="container">
<h2 align='center'></h2>
<form id="frm01" class="form-inline"  method="post">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <input class="form-control mr-sm-2" name="ename" placeholder="사원명" />
    <input class="form-control mr-sm-2" name="job" placeholder="직책명" />
    <button class="btn btn-info" type="button" id="schBtn">Search</button>
    <button class="btn btn-success" type="button" 
    	data-toggle='modal' data-target='#exampleModalCenter'
    	
    	>등록</button>
    
	</nav>
	
</form>
<table class="table table-hover table-striped">
	<col width="20%">
	<col width="20%">
	<col width="20%">
	<col width="20%">
	<col width="20%">
<thead>
  <tr class="table-success text-center">
    <th>사원번호</th>
    <th>사원명</th>
    <th>직책명</th>
    <th>급여</th>
    <th>부서명</th>
  </tr>
</thead>	
<tbody>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
</tbody>
</table>    

</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" 
aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
  <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLongTitle">사원정보</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
	<form id="frm02" class="form"  method="post">
     <div class="row">
      <div class="col">
        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="empno" >
      </div>
      <div class="col">
        <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
      </div>
     </div> 		
     <div class="row">
      <div class="col">
        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
      </div>
      <div class="col">
        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
      </div>
     </div> 
     <div class="row">
      <div class="col">
        <input type="text" class="form-control" placeholder="관리자번호 입력" name="mgr">
      </div>
      <div class="col">
        <input type="text" class="form-control"
			 onfocus="(this.type='date')" placeholder="입사일 입력(YYYY-MM-DD)" name="hiredateS">
      </div>
    </div> 
     <div class="row">
      <div class="col">
        <input type="text" class="form-control" placeholder="급여 입력" name="sal">
      </div>
      <div class="col">
        <input type="text" class="form-control" placeholder="보너스 입력" name="comm">
      </div>
    </div> 
	</form>
  </div>
  
  <div class="modal-footer">
    <button type="button" class="btn btn-primary" id="regBtn">등록</button>      
    <button type="button" class="btn btn-secondary" id="clsBtn" data-dismiss="modal">Close</button>

  </div>
</div>
</div>
</div>
</body>
</html>