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
	});
</script>
</head>

<body>
<%-- 
		
--%>	
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">modelAttribute 처리</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
        <select  class="form-control" >
    	<c:forEach var="dept" items="${dlist}">
    		<option value="${dept.deptno}">${dept.dname }</option>
    	</c:forEach>
    	</select>
    	<select class="form-control" >
    		<option value="">회원선택하세요!!</option>
    		<c:forEach var="mem" items="${mlist }">
    			<option value="${mem.pass}">${mem.id}</option>
    		</c:forEach>
    	</select>
    	
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="id" placeholder="회원아이디" />
	    <input class="form-control mr-sm-2" name="name" placeholder="회원명" />
	    <input class="form-control mr-sm-2" name="auth" placeholder="회원권한" />
	    <input class="form-control mr-sm-2" name="point" placeholder="포인트" />
	    <button class="btn btn-info" type="submit">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>이름</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td>${mem.id}</td><td>${mem.name}</td>
    		<td>${mem.auth}</td><td>${mem.point}</td></tr>
    </tbody>
	</table>    
</div>

</body>
</html>