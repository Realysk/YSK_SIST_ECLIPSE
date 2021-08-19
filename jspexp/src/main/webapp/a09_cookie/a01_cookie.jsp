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
# 쿠키 (Cookie)
	1. 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송된다.
	2. 동작 방식
		1) 쿠키 생성 : 웹 서버 => 브라우저 (쿠키저장소) : response.addCookie(new Cookie(name, value));
		2) 쿠키 저장 : 브라우저의 쿠키 저장소에 저장 처리 : 
		3) 쿠키 전송 : 브라우저 => 웹 서버 (요청 객체를 통해서 전달) : request.getCookies();
	3. 쿠키의 구성
		1) 구성 요소
			- 이름 : 각각의 쿠키를 구별하는데 사용되는 이름
			- 값 : 쿠키의 이름과 관련된 값
			- 유효시간 : 쿠키의 유지 시간
			- 도메인 : 쿠키를 전송할 도메인
			- 경로 : 쿠키를 전송할 요청 경로
		2) 쿠키 이름의 제약 (특수문자와 한글 처리)
			- 쿠키의 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 있다.
			- 콤마, 새미콜롬, 공백 등의 문자는 포함할  수 없다.
			- $로 시작할 수 없다.
			=> encoding 처리를 해야 한다.

--%>
<%
	// 1. 쿠키 생성하기
	Cookie cookie = new Cookie("cookie01", "strawberryTaste");
	response.addCookie(cookie);
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("쿠키 생성, 생성된 쿠키 확인").click(function() {
			location.href="a01_basic.jsp";
		});
	});

</script>
<body>

	<h2 align="center"></h2>
<%
	Cookie[] cookies = request.getCookies();
%>
	<table align="center" class="listTable">
		<tr><th>쿠키 이름</th><th>쿠키 값</th></tr>
		<% if(cookies != null) { 
			for(Cookie ck:cookies) {
		%>
		<tr><td><%=ck.getName() %></td><td><%=ck.getValue() %></td></tr>
		<% 
				}
			}
		%>
	</table>	
	
</body>
</html>