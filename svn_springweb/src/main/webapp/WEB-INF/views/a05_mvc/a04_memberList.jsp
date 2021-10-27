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
		
		--%>	
		$(".data").click(function(){
			$("#exampleModalLongTitle").text("회원상세");
			var id = $(this).children(0).eq(0).text();
			var pass = $(this).children(0).eq(1).text();
			var name = $(this).children(0).eq(2).text();
			var auth = $(this).children(0).eq(3).text();
			var point = $(this).children(0).eq(4).text();
			$("#frm02 [name=id]").val(id);
			$("#frm02 [name=pass]").val(pass);
			$("#frm02 [name=name]").val(name);
			$("#frm02 [name=auth]").val(auth);
			$("#frm02 [name=point]").val(point);
			$("#regBtn").hide();
			$("#uptBtn").show();
			$("#delBtn").show();
		});
		$("#regFrm").click(function(){
			$("#exampleModalLongTitle").text("등록");
			$("#frm02 input").val("");
			$("#regBtn").show();
			$("#uptBtn").hide();
			$("#delBtn").hide();
		});
		// action="${path}/memberInsert.do" 
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#frm02").attr("action","${path}/memberInsert.do");
				$("#frm02").submit();
			}
		});
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("#frm02").attr("action","${path}/memberUpdate.do");
				$("#frm02").submit();
			}
		});		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#frm02").attr("action","${path}/memberDelete.do");
				$("#frm02").submit();
			}
		});			
	});
</script>
</head>

<body>
<%-- 
		
--%>	
<div class="jumbotron text-center">
  <h2 >회원정보</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="name" value="${param.name}" placeholder="회원명" />
	    <input class="form-control mr-sm-2" name="auth" value="${param.auth}"  placeholder="권한" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" type="button" id="regFrm"
	    	data-toggle="modal" data-target="#exampleModalCenter">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
    <thead>
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>패스워드</th>
        <th>이름</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="mem" items="${memList}">
    	<tr class="data text-center"  data-toggle="modal" data-target="#exampleModalCenter">
    		<td>${mem.id}</td><td>${mem.pass}</td><td>${mem.name }</td>
    		<td>${mem.auth }</td><td>${mem.point}</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="frm02" class="form"  method="post">
      <div class="modal-body">
		
	     <div class="row">
	      <div class="col">
	        <input type="text" 
	        class="form-control" placeholder="아이디 입력" name="id">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="패스워드 입력" name="pass">
	      </div>
	     </div> 
	     <div class="row">
	      <div class="col">
	        <input type="text" 
	        class="form-control" placeholder="이름 입력" name="name">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="권한 입력" 
	        		name="auth">
	      </div>
	     </div> 	
	     <div class="row">
	      <div class="col">
	        <input type="text" 
	        class="form-control" placeholder="포인트 입력" name="point">
	      </div>
	     </div> 	            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="regBtn" class="btn btn-primary">등록</button>
        <button type="button" id="uptBtn"  class="btn btn-info">수정</button>
        <button type="button" id="delBtn"   class="btn btn-warning">삭제</button>
      </div>
      </form> 
    </div>
  </div>
</div>
</body>
</html>