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
		$("h2").text("반복문 처리");
	});

</script>
</head>
<%-- 
# JSTL의 반복문 처리
	1. 기본 형식
		<c:forEach var="cnt" begin="시작변수" end="마지막변수" step="증감단위>
			<h2>${cnt}</h2>
		</c:forEach>
		for문과 비교
		<% for(int cnt=시작변수; cnt<=마지막변수; cnt++(증감단위)) { %>
			<h2>$<cnt%></h2>
		<% } %>
	2. 기타 옵션
		<c:forEach var="str" items="${배열형데이터}" varStatus="sts">
			<h2>${sts.index}</h2>
		</c:forEach>
		1) varStatus="sts"
			${sts.index} : 반복문에서 0부터 시작하는 index를 출력
			${sts.count} : 반복문에서 1부터 시작하는 count를 출력
			${sts.first} : boolean을 첫번째 값인지 여부를 나타냄
			${sts.last} : boolean을 마지막 값인지 여부를 나타냄
		int index = 0;
		int count = 1;
		boolean first = false;
		boolean last = false;
		for(String str:array) {
			if(index == 0) {
				first = true;
			}
			if(count == array.length) {
				lasy = true;
			}
			index++;
			count++;
		}

--%>
<%

%>
<body>

	<h2 align="center">반복문 처리</h2>
	
	<h3 align="center">1~15까지 출력</h3>
	<c:forEach var="cnt" begin="1" end="15">
		<span>${cnt},</span>
	</c:forEach>
	
	<h3 align="center">20~50까지 짝수 출력</h3>
	<c:forEach var="cnt" begin="20" end="50" step="2">
		<span>${cnt},</span>
	</c:forEach>
	
	<%--
		ex) 반복문 연습
			1. h5로 1~7까지 출력하면서 안녕하세요 표시
			2. 테이블의 열을 1~3열까지 @@행 @@열 표기
			2. 테이블의 행을 1~5행까지 @@행 @@열 표기
	 --%>
	 
	<h3 align="center">ex1) 1~7까지 h5로 안녕하세요 표기</h3>
	<c:forEach var="cnt" begin="1" end="7">
		<h5>${cnt}</h5>
	</c:forEach>	
	
</body>
</html>