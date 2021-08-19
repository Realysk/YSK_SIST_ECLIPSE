<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
	isErrorPage="true"
%>
<% // isErrorPage="true"로 설정해야 exception 객체를 활용할 수 있다.
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
# a08_exception\a03_nullPointer.jsp

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("에러 발생");
	});

</script>
<body>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th> 에러내용 </th><td><%=exception.getMessage()%></td></tr>
		<tr><th> 처리방법 </th><td> 데이터가 없거나 객체 생성이 되어 있지 않습니다. </td></tr>
	</table>	
	
</body>
</html>