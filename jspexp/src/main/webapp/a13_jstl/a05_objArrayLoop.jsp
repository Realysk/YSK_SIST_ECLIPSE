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
# DB 처리 리스트
	1. session 범위 객체.setAttribute("리스트명", dao.메서드());
		<c:forEach items="${리스트명}"/>
	2. useBean 활용 DB 객체 호출
		<c:forEach items="${dao.메서드()}"/>

--%>
<%
	request.setAttribute("plist", Arrays.asList(new Product("사과",3000,2), new Product("바나나",4000,3), new Product("딸기",12000,4)));
%>
<body>

	<h2 align="center">객체형 list 처리</h2>
	<table align="center" class="listTable">
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>수량</th></tr>
		<c:forEach var="prod" items="${plist}" varStatus="sts">
			<c:set var="tot" value="${tot+(prod.price*prod.cnt)}"/>
			<tr><td>${sts.count}</td><td>${prod.name}</td><td>${prod.price}</td><td>${prod.cnt}</td></tr>
		</c:forEach>
		<tr><th colspan="2">전체 총계</th><td colspan="2">${tot}</td></tr>
	</table>	
	
<%
	A05_PreparedDao dao = new A05_PreparedDao();
	request.setAttribute("empList", dao.getEmpList());
%>
	<h3 align="center">사원정보처리1</h3>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${empList}" varStatus="sts">
			<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.sal}</td><td>${emp.deptno}</td></tr>
		</c:forEach>
	</table>
	
	<h3 align="center">사원정보처리2</h3>
	<jsp:useBean id="dao2" class="jspexp.z01_database.A05_PreparedDao"/>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${dao2.getEmpList()}" varStatus="sts">
			<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.sal}</td><td>${emp.deptno}</td></tr>
		</c:forEach>
	</table>

</body>
</html>