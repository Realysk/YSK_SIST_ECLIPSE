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
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		deptRegBtn deptUptBtn deptDelBtn 
		--%>
		$("#regBtn").click(function(){
			$("#exampleModalLongTitle").text("부서정보등록");
			$("#deptRegBtn").show();
			$("#deptUptBtn").hide();
			$("#deptDelBtn").hide();
			$("#frm02 input").val(""); // 상세화면 확인 후, 등록 처리시 초기값 설정
		});	
		$("#deptRegBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#frm02").attr("action","${path}/deptInsert.do");
				$("#frm02").submit();
			}
		});		
		$("#deptUptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#frm02").attr("action","${path}/deptUpdate.do");
				$("#frm02").submit();
			}
		});	
		$("#deptDelBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#frm02").attr("action","${path}/deptDelete.do");
				$("#frm02").submit();
			}
		});	
		
		
		//// deptUpdate.do deptDelete.do
    	$(".list").click(function(){
			$("#exampleModalLongTitle").text("부서정보(수정/삭제)");
			$("#deptRegBtn").hide();
			$("#deptUptBtn").show();
			$("#deptDelBtn").show();   		
    		var deptno = $(this).children().eq(0).text();
    		var dname = $(this).children().eq(1).text();
    		var loc = $(this).children().eq(2).text();
    		$("#frm02 [name=deptno]").val(deptno);
    		$("#frm02 [name=dname]").val(dname);
    		$("#frm02 [name=loc]").val(loc);
    	});
		
			
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>부서정보</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="dname" value="${param.dname}" placeholder="부서명" />
	    <input class="form-control mr-sm-2" name="loc" value="${param.loc}"   placeholder="부서위치" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" id="regBtn"
	    	data-toggle="modal" data-target="#exampleModalCenter" 
	    type="button">등록</button>
	    
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
    <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>부서위치</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="dept" items="${deptList}">
    	<tr class="text-center list" data-toggle="modal" data-target="#exampleModalCenter" >
    		<td>${dept.deptno }</td>
    		<td>${dept.dname }</td>
    		<td>${dept.loc}</td></tr>
    	</c:forEach>
     </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">부서정보등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
	      </div>	
	     </div>
	     <div class="row">     
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서명 입력" name="dname">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서 위치 입력" name="loc">
	      </div>
	     </div>
	    </form> 
      </div><!-- deptRegBtn deptUptBtn deptDelBtn  -->
      <div class="modal-footer">
        <button type="button" id="deptRegBtn" class="btn btn-success">등록</button>     
        <button type="button" id="deptUptBtn" class="btn btn-primary">수정</button>     
        <button type="button" id="deptDelBtn" class="btn btn-warning">삭제</button>     
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
</body>
</html>