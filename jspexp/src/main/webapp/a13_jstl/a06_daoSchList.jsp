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
# useBean을 통한 요청값 및 검색데이터 리스트 처리
	1. form 만들기
	2. bean 객체 생성 및 요청값 처리
	3. bean 객체 생성 및 dao 처리
	4. 반복화면 리스트

--%>
<%

%>
<body>

	<h2 align="center">사원정보검색 JSTL</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value="${param.ename}"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value="${param.job}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<c:if test="${not empty param.ename }">
		<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
		<jsp:useBean id="sch" class="jspexp.z02_vo.Emp"/>
		<jsp:setProperty property="*" name="sch"/>
		<table align="center" class="listTable">
			<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
			<c:forEach var="emp" items="${dao.getPreparedEmpList(sch)}" varStatus="sts">
				<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.sal}</td><td>${emp.deptno}</td></tr>
			</c:forEach>
		</table>
	</c:if>	
	
</body>
</html>