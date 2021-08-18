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
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("prev() 예제").click(function() {
			$("p").prev(".selected").css("font-size", "30px");
			$("p").prev().css("background", "yellow");
		});
	});

</script>
<body>

	<h2 align="center"></h2>
	<div class="selected"><span>홍길동</span></div>
	<p class="selected">이순신</p>
	<p>유관순</p>
	<p>유관순</p>
	<span class="selected">강감찬</span>
	<p>이성계</p>
	<p>이성계</p>
	<p>이성계</p>
	
</body>
</html>