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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("contains 예제");
		$("#btn").click(function() {
			var ename = $("[name=ename]").val();
			// td:contains('특정문자열') : 해당 문자열이 포함되어 있는 td
			$("td:contains('" + ename + "')").css("background-color", "yellow");
		});
	});

</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>찾는 이름</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="button" id="btn" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th>이름</th></tr>
		<tr><td>홍길동</td></tr>
		<tr><td>김길동</td></tr>
		<tr><td>신길동</td></tr>
		<tr><td>오길동</td></tr>
	</table>	
	
</body>
</html>