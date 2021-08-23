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
		$("h2").text("시작");
	});

</script>
<body>

	<%-- ?name=사과&price=3000&cnt=5 --%>

	<h2 align="center"></h2>
	<jsp:useBean id="pd02" class="jspexp.z02_vo.Product"/>
	<jsp:setProperty property="name" name="pd02"/>
	<jsp:setProperty property="price" name="pd02"/>
	<jsp:setProperty property="cnt" name="pd02"/>
	<h3 align="center">Product 객체 (Param 이용)</h3>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${pd02.name}</td></tr>
		<tr><th>가격</th><td>${pd02.price}</td></tr>
		<tr><th>수량</th><td>${pd02.cnt}</td></tr>
	</table>
	
</body>
</html>