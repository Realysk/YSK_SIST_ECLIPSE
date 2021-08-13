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
# application을 통한 서버 정보
	1. getServerInfo() : 간단한 서버 정보
	2. getMajorVersion() : 서블릿 규약 메이저 버전
	3. getMinorVersion() : 서블릿 규약 마이너 버전
	4. application.log() : 서버 단위 로그 메세지 기록
		cf) log() : jsp의 기본 로그 표시

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
<body>

	<h2 align="center"></h2>

	<table align="center" class="listTable">
		<tr><th>서버정보</th><td><%=application.getServerInfo() %></td></tr>
		<tr><th>서블릿 규약 메이저 버전</th><td><%=application.getMajorVersion() %></td></tr>
		<tr><th>서블릿 규약 마이너 버전</th><td><%=application.getMinorVersion() %></td></tr>
	</table>
	<%
		log("로그 메세지 기록 ## JSP에서 기본 console로 출력되는 내용");
		application.log("로그 메세지 기록 (application 단위 로그)");
	%>
	
	<%-- ex) 물건명, 가격, 수량 변수로 선언하여 System.out.println(), log, application.log()로 서버 console에 출력하세요. --%>
	
	<%
		String name = "사과";
		int price = 3000;
		int cnt = 5;
		System.out.println(name + " : " + price + " : " + cnt);
		log(name + " : " + price + " : " + cnt);
		application.log(name + " : " + price + " : " + cnt);
		String ename = request.getParameter("ename");
		// 1. 에러 tracking 1단계 서버의 console
		log("요청값1 : " + ename);
	%>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=ename%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<% 	log("요청값2 : " + ename);
		if(ename!=null) { %>
	<h3> 이름 : <%=ename.toString() %></h3>
	<% } %>
</body>
</html>