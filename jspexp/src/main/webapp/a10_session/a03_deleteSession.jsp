<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("세션 삭제");
	});

</script>
<body>

	<h2 align="center"></h2>
<%
	// 1. 세션의 설정
	session.setAttribute("num01", 25);
	session.setAttribute("num02", 5);
	session.setAttribute("num03", 10);
%>
	<table align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01}</td></tr>
		<tr><th>세션값2</th><td>${num02}</td></tr>
<%
	// 2. 세션의 삭제
	session.removeAttribute("num02");
	session.setMaxInactiveInterval(10);
%>
		<tr><th>세션값2 (삭제)</th><td>${num02}</td></tr>
		<tr><th id="ckSession">세션값3 (삭제)</th><td>${num03}</td></tr>
	</table>
<script type="text/javascript">
	$("#ckSession").click(function() {
		var num03 = "${num03}";
		alert("세션값 확인 : " + num03);
		location.href="a03_show.jsp";
	});
</script>
	
</body>
</html>