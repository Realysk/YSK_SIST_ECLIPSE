<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	errorPage = "z01_error.jsp"
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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# JSP에서 에러 처리
	1. JSP에서는 에러를 해당 예외가 발생했을 때 예외 페이지를 지정하여 처리한다.
	2. 처리 프로세스
		1) 예외 페이지 지정 : errorPage="처리할예외페이지"
		2) 에러 발생 시 => 지정한 예외 페이지 호출
		
	ex) a08_show.jsp를 통해서 String name = null; System.out.println(name.toString());
		을 선언하고 z02_error.jsp를 통해서 에러가 처리되도록 하세요.

--%>
<%
	System.out.println(1/0);
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>