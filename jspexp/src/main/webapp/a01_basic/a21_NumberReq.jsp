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
		document.querySelector("h3").innerText="숫자형 데이터 처리";
	};

</script>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01" action="a22_numRev.jsp">
	<table>
		<tr><th> 첫번째 숫자 </th><td><input type="text" name="num01" value=""/></td></tr>
		<tr><th> 두번째 숫자 </th><td><input type="text" name="num02" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="합산"/></td></tr>
	</table>
	</form>
	
</body>
</html>