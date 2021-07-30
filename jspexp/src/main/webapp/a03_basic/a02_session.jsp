<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
%>
<%
//	[jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 
	
//	[YSK_SIST] 프로젝트에 사용
//		import="Project_SIST.Java.*" : VO, DAO import
	
//	공통 사용
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
		document.querySelector("h3").innerText="a01_basicObject에서 받아온 세션 범위";
	}
</script>
</head>
<%--

--%>

	<h3 align="center"></h3>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 세션 범위 확인 </th></tr>
			<tr><td colspan="2"><h2 align="center"> 세션 ID : <%=session.getAttribute("id") %> </h2></td></tr>
		</table><br><hr>
		</form>
<%

%>
<body>

</body>
</html>