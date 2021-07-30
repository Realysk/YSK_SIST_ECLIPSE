<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
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
		document.querySelector("h3").innerText="a02_session.jsp로 넘길 세션 범위 확인";
	}
</script>
</head>
<%--
 # JSP의 기본 객체
 	1. JSP는 변수들을 저장할 때 특정한 범위로 처리할 수 있다.
 		(page 범위, 시간 - session time, 브라우저와 서버 관계, 서버)
 		cf) JAVA - 데이터 유형과 메모리의 크기 => JSP - 데이터 유형 + 시간과 페이지 범위
 		ex) 로그인 상태의 DB 접속 후 가진 Member 정보를 웹 페이지마다 가지고 있어서 각 페이지마다 접근 권한을 활용 하거나 로그인 유지 처리에 필요한 범위 - session
 	2. 범위 내용
 		pageContext(page), request(요청), session(세션), application(서버)
 	3. 사용 방법
 		.setAttribute("KEY", "VALUE");
 		.getAttribute("KEY"); // 해당 키를 가져온다.
--%>
<%
	session.setAttribute("id", "하이맨");
%>

	<h3 align="center"></h3>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 세션 범위 </th></tr>
			<tr><td colspan="2"><a href="a02_session.jsp"> 세션 범위 확인 </a></td></tr>
		</table><br><hr>
		</form>
<%

%>
<body>

</body>
</html>