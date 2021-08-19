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

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("쿠키만들기");
	});

</script>
<body>
<%
	// a02_cookieMake.jsp : 쿠키 요청값 생성 페이지
	// a03_showCookie.jsp : 쿠키 확인 페이지

	String ckName = request.getParameter("ckName");
	String ckValue = request.getParameter("ckValue");
	if(ckName != null) {
		Cookie c1 = new Cookie(ckName, ckValue);
		response.addCookie(c1);
		// response.sendRedirect("이동할페이지") : 서버단에서 페이지 이동 처리
		response.sendRedirect("a03_showCookie.jsp");
	}
%>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>쿠키이름</th><td><input type="text" name="ckName" value=""/></td></tr>
		<tr><th>쿠키값</th><td><input type="text" name="ckValue" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="쿠키만들기"/></td></tr>
	</table>	
	</form>	
	
</body>
</html>