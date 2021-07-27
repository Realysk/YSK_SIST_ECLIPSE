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
		document.querySelector("h3").innerText="a21_NumberReq에서 받아온 데이터";
	};

</script>
</head>
<body>
	<h3 align="center"></h3>
<%
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	if(num01S==null) num01S = "0";
	if(num02S==null) num02S = "0";
	int num01 = Integer.parseInt(num01S);
	int num02 = Integer.parseInt(num02S);
	int sum = num01 + num02;
%>
	<h2 align="center"><%=num01 %> + <%=num02 %> = <%=sum %></h2>
	
</body>
</html>