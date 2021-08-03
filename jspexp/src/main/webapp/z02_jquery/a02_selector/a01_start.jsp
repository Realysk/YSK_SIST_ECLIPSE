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
<script type="text/javascript">
	$(document).ready(function() {
		$("h1").text("빨간색");
		$("h3").text("파란색");
		$("h4").text("노란색");
		$("h1").css("background-color", "red");
		$("h3").css("background-color", "blue");
		$("h4").css("background-color", "yellow");
	});

</script>
</head>
<%-- 
# 선택자 (selector)
	1. 문서 내에서 원하는 엘리먼트를 쉽게 식별하고 이를 추출하기 위해서 css/jquery에서 제공 하는 기술이다.
	2. 기본 css 선택자 : css 선택자를 통해서 DOM 객체를 선택할 수 있는 것을 말한다.
		1) * : 모든 엘리먼트 일치
		2) E : 태그명이 E인 모든 엘리먼트
		3) E F : 태그명이 E이고 하위 엘리먼트 이름이 F인 엘리먼트
		// ex) h1, h3, h4를 선언하고 각각의 글자 색상으로 빨, 파, 노로 처리 후 배경색상을 jquery로 처리해보세요.
		4) E > F : E의 바로 아래 F 엘리먼트 선택
		5) E + F : E의 형제 엘리먼트로 바로 다음 형제 F 엘리먼트
		6) E ~ F : E의 형제 엘리먼트로 다음에 오는 모든 F 엘리먼트
		7) E.C : 클래스명이 C를 자기오 있는 모든 E 엘리먼트
		8) E & I : 아이디가 I인 E 엘리먼트
		9) E[A] : 속성 A를 가진 E 엘리먼트
		10) E[A=V] : 속성 A와 속성 값 V를 가진 엘리먼트

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><td><h1></h1></td></tr>
		<tr><td><h3></h3></td></tr>
		<tr><td><h4></h4></td></tr>
	</table>	
	</form>
	
</body>
</html>