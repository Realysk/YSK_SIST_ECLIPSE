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
		document.querySelector("h3").innerText="a11_requestParam에서 받아온 요청 값 [JS]";
	};

</script>
</head>
<body>

	<%
		String prod = request.getParameter("prod");
	%>

	<h3></h3>
	<h4> JS를 통해 넘겨온 물건명 (1) </h4>
	<table>
		<tr><th> 물건명 </th></tr>
		<tr><td><%=prod %></td></tr>
	</table>
	
	<%
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String cnt = request.getParameter("cnt");
	%>

	<h4> JS를 통해 넘겨온 물건명 (2) </h4>
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th></tr>
		<tr>
			<td><%=pname %></td>
			<td><%=price %></td>
			<td><%=cnt %></td>
		</tr>
	</table>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String auth = request.getParameter("auth");
	%>

	<h4> JS를 통해 넘겨온 회원 정보 [EX] </h4>
	<table>
		<tr><th> ID </th><th> PW </th><th> NAME </th><th> AUTH </th></tr>
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=auth %></td>
		</tr>
	</table>
	
	<%
		String id2 = request.getParameter("id2");
		String pw2 = request.getParameter("pw2");
	%>

	<h4> [07.27] JS를 통해 넘겨온 회원 정보 [EX] </h4>
	<table>
		<tr><th> ID </th><th> PW </th></tr>
		<tr>
			<td><%=id2 %></td>
			<td><%=pw2 %></td>
		</tr>
	</table>
	
</body>
</html>