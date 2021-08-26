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
# jstl의 조건문 처리

--%>
<%

%>
<body>

	<h2 align="center">JSTL 조건문 처리</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>점수</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="합격확인"/></td></tr>
	</table>	
	</form>
	<c:if test="${not empty param.point}"> <%-- 요청값이 있을 때 출력 처리 --%>
	<h3 align="center">${param.point} 점에
		<c:choose>
			<c:when test="${param.point>=90}">A등급</c:when>
			<c:when test="${param.point>=80}">B등급</c:when>
			<c:when test="${param.point>=70}">C등급</c:when>
			<c:when test="${param.point>=60}">E등급</c:when>
			<c:otherwise>F등급</c:otherwise>
		</c:choose> 입니다.
	</h3>
	</c:if>
	
	<%-- ex) 가격 : [   ] 수량 : [   ] [구매] => 구매 총계가 10만원 이상일 때 10% 할인, 5~10만원 미만 5% 할인, 그 외는 3% 할인, 할인율과 최종 금액 표시 --%>
	
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>수량</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	<c:if test="${not empty param.price}"> <%-- 요청값이 있을 때 출력 처리 --%>
	<h3 align="center"> 구매 총계 : ${param.price * param.cnt}, 할인 금액 : 
		<c:choose>
			<c:when test="${(param.price * param.cnt)*0.9}">A등급</c:when>
			<c:when test="${(param.price * param.cnt)*0.95}">A등급</c:when>
			<c:when test="${(param.price * param.cnt)*0.97}">A등급</c:when>
			<c:otherwise>F등급</c:otherwise>
		</c:choose> 원 입니다.
	</h3>
	</c:if>
	
</body>
</html>