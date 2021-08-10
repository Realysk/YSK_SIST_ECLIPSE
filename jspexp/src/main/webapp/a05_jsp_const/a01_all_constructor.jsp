<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%> <%-- 디렉티브 (directive) --%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

// a01_all_constructor.jsp
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%> <%-- 스크립트 : 스크립트릿 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# JSP의 구성요소
	1. 디렉티브 (directive)
		
	2. 스크립트 : 스크립트릿, 표현식, 선언부
	3. 표현언어(el)
	4. 기본 객체 : request, response, session, out, pageContext, application
	5. 정적 데이터
	6. 표준액션 태그 : <jsp:include, <jsp:forward,
	7. 커스텀 태그와 표준 태그 라이브러리(JSTL) <c:set <c:forEach <c:if

--%>
<%!
	// declare(선언부)
	String name = "홍길동";
	public int plus(int num01, int num02) {
		return num01 + num02;
	}
%>
<%
	// scriptlet(스크립트릿)
	// 데이터 할당, 조건 반복문 처리
%>
<body>

	<h2 align="center"><%=name %></h2> <%-- expression(표현) --%>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>