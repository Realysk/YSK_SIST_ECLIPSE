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
# application 기본 객체 : 초기 파라미터
	1. 초기화 파라미터 설정 : web.xml 파일 활용
		<context-param>
			<description> 파라미터 설명
			<param-name> 파라미터 이름
			<param-value> 파라미터 값

	2. application 초기 파라미터 관련 기능 메서드
		getInitParameter(String name)
		getInitParameterNmaes()
	
--%>
<%
	String info01 = application.getInitParameter("DB_IP");
	String info02 = application.getInitParameter("DB_PORT");
	String info03 = application.getInitParameter("DB_SID");
	String info04 = application.getInitParameter("DB_Username");
	String info05 = application.getInitParameter("DB_Pass");

	// ex) DB의 port/sid/username/pass를 web.xml에 설정하고 화면에 출력하세요.
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("application info");
	});

</script>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" style="text-align:center" class="listTable">
		<tr><th> IP </th><td><%=info01%></td></tr>
		<tr><th> PORT </th><td><%=info02%></td></tr>
		<tr><th> SID </th><td><%=info03%></td></tr>
		<tr><th> Username </th><td><%=info04%></td></tr>
		<tr><th> Pass </th><td><%=info05%></td></tr>
	</table>	
	</form>

</body>
</html>