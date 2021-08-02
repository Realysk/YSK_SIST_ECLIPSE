<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	isErrorPage = "true"
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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="요청 시 에러가 발생했습니다.";
	}
</script>
</head>
<%-- 
# 에러 페이지 처리
	1. 속성 선언
		isErrorPage = "true"
	2. exception를 참조로 하는 여러가지 메서드를 사용할 수 있음.

--%>
<%

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th> Error Type </th><td> <%=exception.getClass().getName() %> </td></tr>
		<tr><th> Error Message </th><td> <%=exception.getMessage() %> </td></tr>
		<tr><th colspan="2"> 잠시 기다리면 담당자와 통화가 가능합니다. </th></tr>
		<tr><th> 담당자 </th><td> 홍길동 대리 (010-7777-0000) </td></tr>
	</table>	
	</form>	
	
</body>
</html>