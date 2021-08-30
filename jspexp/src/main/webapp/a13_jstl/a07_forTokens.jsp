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
# forTokens
	1. 구분자에 의해서 데이터를 나누어서 처리하는 것을 말한다.
		ex) 데이터(사과^바나나^딸기) : 구분자 ^에 의해 ["사과", "바나나", "딸기"]가 만들어지면 이 내용을 반복문에 의해 처리되는 것을 말한다.
	2. 기본 형식
		<c:forTokens var="변수명" items="구분자포함데이터" delims="구분자" varStatus="sts변수">
		${변수명} : 단위 데이터
	3. 속성
		var : 구분자에 의해 추출된 단위 데이터를 할당할 변수명을 지정.
		items : 구분자가 포함되어 있는 문자열 데이터
			ex) 사과^바나나^딸기
		delims : 구분자
		varStatus : index, count, first, last 등의 효과적인 변수를 활용 기능

--%>
<%

%>
<body>

	<h2 align="center">구분자 처리</h2>
	<c:forTokens var="color" items="red, green, blue" delims="," varStatus="sts">
	<h3 align="center">${sts.count}) ${color}</h3>
	</c:forTokens>
	<%--
	ex) 과일명 사과;오렌지;수박;딸기; 를 구분자로 처리하여 2X2 테이블에 출력하세요.
	 --%>
	<table align="center" class="listTable">
		<c:forTokens var="fruit" items="사과;오렌지;수박;딸기" delims=";" varStatus="sts">
			<c:if test="${sts.count%2==1}"><tr></c:if>
				<td>${fruit}[${sts.index}]</td>
			<c:if test="${sts.count%2==0}"></tr></c:if>
		</c:forTokens>
	</table>
</body>
</html>