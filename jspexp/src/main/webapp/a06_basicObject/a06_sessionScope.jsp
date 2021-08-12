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
	Member emp = (Member) session.getAttribute("emp");
	Member admin = (Member) application.getAttribute("admin");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
<body>

	<h2 align="center"></h2>
	<%
	if(emp!=null) {
	%>
	<table align="center" class="listTable">
		<tr><th>ID</th><td><%=emp.getId() %></td></tr>
		<tr><th>PW</th><td><%=emp.getPass() %></td></tr>
		<tr><th>NAME</th><td><%=emp.getName() %></td></tr>
		<tr><th>AUTH</th><td><%=emp.getAuth() %></td></tr>
		<tr><th>POINT</th><td><%=emp.getPoint() %></td></tr>
	</table>
	<% } %>
	<%
	if(admin!=null) {
	%>
	<table align="center" class="listTable">
		<tr><th>ID</th><td><%=admin.getId() %></td></tr>
		<tr><th>PW</th><td><%=admin.getPass() %></td></tr>
		<tr><th>NAME</th><td><%=admin.getName() %></td></tr>
		<tr><th>AUTH</th><td><%=admin.getAuth() %></td></tr>
		<tr><th>POINT</th><td><%=admin.getPoint() %></td></tr>
	</table>
	<% } %>	
	
</body>
</html>