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

	// 한글 요청값에 처리. post 방식일 떼 처리
	request.setCharacterEncoding("utf-8");
	// contextpath는 프로젝트 명으로 물리적으로 서버상의 jspexp\src\main\webapp 기준으로 접근하여 여러가지 자원(파일/이미지/CSS)등을 절대위치로 접근이 가능하다.
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
<%-- 
# request 기본 객체 (client => server)
	1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공.
	2. 주요 기능
		1) 클라이언트와 관련된 정보 읽기 기능
		2) 서버와 관련된 정보 읽기 기능
		3) 클라이언트가 전송한 요청 파라미터 읽기 기능
		4) 클라이언트가 전송한 요청 헤더 읽기 기능
		5) 클라이언트가 전송한 쿠키 읽기 기능
		6) 속성 처리 기능
	3. 기본 정보 제공 메서드
		http://localhost:7080/jspexp/index.jsp
			1) request.getRemoteAddr() : 웹 서버에 연결한 클라이언트의 IP 주소를 구한다.
			2) request.getMethod() : 웹 브라우저가 정보를 전송할 때 사용한 방식을 구한다.
			3) request.getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다. ex) jspexp/index.jsp
			4) request.getContextPath() : JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다. ex) jspexp
			5) request.getServerName() : 연결할 때 사용한 서버 이름을 구한다. ex) localhost
			6) request.getServerPort() : 서버가 실행 중인 포트 번호를 구한다. ex) 7080
--%>
<%

%>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("request");
	});

</script>
</head>

<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>클라이언트 주소</th><td><%=request.getRemoteAddr()%></td></tr>
		<tr><th>요청한 URL</th><td><%=request.getRequestURI()%></td></tr>
		<tr><th>서버 이름</th><td><%=request.getServerName()%></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>	
	
</body>
</html>