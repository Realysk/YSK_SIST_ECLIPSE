<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# fmt:유형 jstl 태그
	1. 데이터 유형을 변경하거나 원하는 데이터를 처리할 때 주로 활용된다.
	2. 공통 설정 변경
		String path = request.getContextPath() => <c:set var="path" value="${pageContext.request.contextPath}">
					  request.setCharacterEncoding("UTF-8") => <fmt:requestEncoding value="UTF-8">
	3. 날짜 처리
		1) 날짜 + 시간
		2) data type은 java.util.Date를 활용한다.
		3) 기본 형식
			<fmt:formatDate type="date|time|both" dateStyle="full|short" timeStyle="full|short" pattern="YYYY/MM/DD kk:mm:ss.S" value="선언된 데이터"/>
	4. 숫자 처리
		1) 숫자를 통화나 소숫점 이하 지정된 형식으로 처리
		2) type의 속성들
			currency : 통화 단위
			percent : % c처리
		3) pattern : 00,000,000.000 등과 같이 특정한 출력 형식을 처리할 수 있다.

--%>
<%

%>
<body>

	<h2 align="center"></h2>
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