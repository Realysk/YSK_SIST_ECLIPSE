<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="a11_requestParam.jsp에서 받아온 요청 값 [EX1]";
	};

</script>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String loc = request.getParameter("loc");
	%>

	<h3></h3>
	<table>
		<tr><th> ID </th><th> PW </th><th> NAME </th><th> LOC </th></tr>
		<tr>
			<td><%=id %></td>
			<td><%=pass %></td>
			<td><%=name %></td>
			<td><%=loc %></td>
		</tr>
	</table>
	
</body>
</html>