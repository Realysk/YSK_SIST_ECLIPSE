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
		document.querySelector("h3").innerText="쿠키 생성 (생성 된 쿠키 확인)";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	Cookie c1 = new Cookie("pname", "apple");
	response.addCookie(c1);
	Cookie c2 = new Cookie("price", "3000");
	response.addCookie(c2);
	Cookie c3 = new Cookie("cnt", "4");
	response.addCookie(c3);
%>
<body>

	<h3 onclick="location.href='a12_prodCookie.jsp'" align="center"></h3>

</body>
</html>