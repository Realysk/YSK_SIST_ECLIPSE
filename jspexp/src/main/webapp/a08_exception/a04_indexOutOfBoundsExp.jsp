<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
	isErrorPage="true"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("에러발생");
	});

</script>
<body>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th> 에러내용 </th><td><%=exception.getMessage() %></td></tr>
		<tr><th> 처리내용 </th><td> 배열의 범위를 확인하세요. </td></tr>
	</table>	
	
</body>
</html>