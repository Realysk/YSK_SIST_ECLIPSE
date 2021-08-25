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

</head>
<%-- 
# 연산자
	1. 수치연산자
	2. 비교연산자
		== (eq), != (ne), >= (ge), <= (le), <(gt), >(lt)
		${num01 eq 25}
		${num01 ne 80}
	3. 논리연산자
		&& (and)
		|| (or)
		! (not)
		${point >= 80 && point < 90}
		${point ge 80 and point lt 90}
	4. empty 연산자
		값이 null, 빈 문자열 "", 배열 및 리스트 데이터의 길이가 0 ==> true
		${empty param.name} : 요청key로 name값이 없을 때 true로 처리된다.
		${not empty param.id} : 요청 id의 값이 있을 때 true로 처리된다.
	5. 각 범위별 기능 메서드
		${pageContext} : jsp page 객체로 다양한 객체의 범위에 따른 기능 메서드를 지원하고 있다.
		범위별 객체 ${pageScope} ${requestScope} ${sessionScope} ${applicationScope}
		요청값 처리 ${param} ${paramValues}
		요청 header ${header} ${headerValues}
		쿠키 ${cookie}
		초기 파라미터 ${initParam}
		ex) String path = request.getContextPath();
		=> el로 ${pageContext.requset.contextPath}
		다음 시간 jstl의 변수 설정으로 <c:set var="path" value="${pageContext.requset.contextPath}"/> 처리할 수 있다.

--%>

<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("기타 el의 기능 코드");
	});

</script>
<body>
	
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>점수</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="확인"/></td></tr>
	</table>
	</form>
	<h3 align="center">요청 점수 : ${param.point}</h3>
	<h3 align="center">70점 이상 여부 : ${param.point ge 70}</h3>
	<h3 align="center">empty : ${empty param.point}</h3> <%-- 값이 없음 --%>
	<h3 align="center">not empty : ${not empty param.point}</h3> <%-- 값이 있을 때 --%>
	
</body>
</html>