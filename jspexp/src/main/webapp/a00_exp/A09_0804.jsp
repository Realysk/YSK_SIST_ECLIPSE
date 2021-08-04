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
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# 정리문제
	1. jquery에서 CDN 방식 lib 로딩이란 무엇인가?
	
		파일명을 적용시키는 대신 해당 사이트의 링크로 적용시키는 방법
	
	2. jquery의 계층 구조 선택자의 형식을 기본 예제를 통해서 기술하세요.

		1) * : 모든 엘리먼트 일치
		2) E : 태그명이 E인 모든 엘리먼트
		3) E F : 태그명이 E이고 하위 엘리먼트 이름이 F인 엘리먼트
		4) E > F : E의 바로 아래 F 엘리먼트 선택
		5) E + F : E의 형제 엘리먼트로 바로 다음 형제 F 엘리먼트
		6) E ~ F : E의 형제 엘리먼트로 다음에 오는 모든 F 엘리먼트
		7) E.C : 클래스명이 C를 자기오 있는 모든 E 엘리먼트
		8) E & I : 아이디가 I인 E 엘리먼트
		9) E[A] : 속성 A를 가진 E 엘리먼트
		10) E[A=V] : 속성 A와 속성 값 V를 가진 엘리먼트		
	
	3. jquery를 선택자를 활용해서 password와 password 확인 항목에 대한 일치여부 유효성 체크를 하세요.
	
		
	
	4. [js] 전날 한 class를 선언하고, 객체를 생성하는 형식을 활용하여, 장바구니에 담은 상품을 누적처리하세요.
	    물건 매장
	    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
	
	
	
	5. [jsp]위 내용을 jsp로 요청값으로 넘기고, session에 누적처리하는 프로그램을 작성하고, [장바구니확인하러가기] 를 통해 현재 담기 session 객체를 리스트 확인하세요.
	
	
	

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