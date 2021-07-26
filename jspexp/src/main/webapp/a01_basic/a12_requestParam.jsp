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
		document.querySelector("h3").innerText="Request : 요청 값 넘기기 (예제)";
	};

</script>
</head>
<body>

	<%--
		ex) a12_requestParam.jsp에 요청key name, age, loc을 넘기고 값을 받아, 화면에 이름 @@@, 나이 @@@, 거주지 @@@을 출력하세요.
			-> a12_requestParam.jsp?name=홍길동&age=25&loc=서울
	 --%>
	
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String loc = request.getParameter("loc");
	%>
	<h3></h3>
	<table>
		<tr><th> 이름 </th><th> 나이 </th><th> 거주지 </th></tr>
		<tr>
			<td><%=name%></td>
			<td><%=age%></td>
			<td><%=loc%></td>
		</tr>
	</table>
	
</body>
</html>