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
# ex) session과 application 범위로 사원정보(아이디, 패스워드, 사원명, 일반사용자, 1000)와 관리자정보(아이디, 패스워드, 사원명, 관리자, 2000)을 설정하여, 다음화면 a06_sessionScope.jsp에서 확인하세요.

--%>
<%
	session.setAttribute("emp", new Member("himan","7777","홍길동", "일반사용자", 1000));
	application.setAttribute("admin", new Member("kingman","9999","마길동", "관리자", 2000));
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("예제");
	});

</script>
<body>

	<jsp:forward page="a06_sessionScope.jsp"/>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th> ID </th><td><%=session.getAttribute("id") %></td></tr>
		<tr><th> PW </th><td><%=session.getAttribute("pass") %></td></tr>
		<tr><th> NAME </th><td><%=session.getAttribute("name") %></td></tr>
		<tr><th> AUTH </th><td><%=session.getAttribute("auth") %></td></tr>
		<tr><th> POINT </th><td><%=session.getAttribute("point") %></td></tr>
	</table><br>
	<table align="center" class="listTable">
		<tr><th> ID </th><td><%=application.getAttribute("id") %></td></tr>
		<tr><th> PW </th><td><%=application.getAttribute("pass") %></td></tr>
		<tr><th> NAME </th><td><%=application.getAttribute("name") %></td></tr>
		<tr><th> AUTH </th><td><%=application.getAttribute("auth") %></td></tr>
		<tr><th> POINT </th><td><%=application.getAttribute("point") %></td></tr>
	</table><br>
	
</body>
</html>