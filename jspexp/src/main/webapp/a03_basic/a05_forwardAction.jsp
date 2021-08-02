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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="forward 처리 할 페이지";
	}
</script>
</head>
<%-- 
 # jsp:forward
 	1. 해당 페이지로 요청 값과 함께 이동 처리된다.
 	2. request 요청 값은 함께 하여 이동 처리된다.
 	3. 기본 형식
 		<jsp:forward page="이동할페이지"/>

--%>
<%
	// a05_forwardAction.jsp?name=홍길동 을 통해 요청 값도 함께 전송할 수 있다.
%>
<body>
	
	<h3 align="center"></h3>
	<jsp:forward page="a06_goPage01.jsp"></jsp:forward>
	
</body>
</html>