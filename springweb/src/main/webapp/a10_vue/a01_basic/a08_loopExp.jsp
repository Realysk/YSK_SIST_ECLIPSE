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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)",
				prod:{name:"맥북",price:1500000,cnt:3},
				empList:[
					{empno:7780,ename:"홍길동",job:"사원",sal:5000},
					{empno:7781,ename:"김길동",job:"대리",sal:6000},
					{empno:7782,ename:"마길동",job:"과장",sal:7000}
				]}
		});	
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
    <h2 align='center'>{{msg}}</h2>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  		<span v-for="(val,prop) in prod" >
	    	<input class="form-control mr-sm-2" :value="val" />
	    </span>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>

   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">
      <tr v-for="(val,prop) in prod" class="text-center">
        <th class="table-success">{{prop}}</th><td>{{val}}</td>
      </tr>
	</table>  		
		
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책</th>
        <th>급여</th>
      </tr>
    </thead>   	
    <tbody> 
    	<tr v-for="emp in empList" class="text-center">
    		<td>{{emp.empno}}</td>
    		<td>{{emp.ename}}</td>
    		<td>{{emp.job}}</td>
    		<td>{{emp.sal}}</td></tr>
    </tbody>
	</table>    
</div>
</body>
</html>