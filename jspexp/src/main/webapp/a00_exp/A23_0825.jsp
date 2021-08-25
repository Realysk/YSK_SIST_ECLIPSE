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

</head>
<%-- 
# 정리문제
	1. session 4가지 범위로 변수를 선언하여 출력하세요.
	
		pageScope
		requestScope
		sessionScope
		applicationScope
	
	2. el에 의해 과일명 배열을 출력하세요.
	
		request.setAttribute("array01", new String[]{"사과","바나나","딸기"});
		<tr><th>array01</th><td>${array01[0]}, ${array01[1]}, ${array01[2]}</td></tr>
	
	3. el을 활용하여 쇼핑몰에 구매한 내용을 요청값에 의해 객체로 할당 후 선택한 할인율(10,15,20%)에 따라 구매정보를 출력하세요.
	
		
	
	4. 아이디 패스워드를 입력하여 el로 요청값으로 인증여부(himan/7777)를 출력하세요.
	
		
	
	5. 아래와 같은 등록정보를 처리한 화면을 el로 다음 페이지에서 출력하세요.
		아이디:[   ] 패스워드:[   ] 성별:()남()여 취미:[]음악[]운동[]여행[]독서[]게임[]
		[등록]
	
	
	
	6. session으로 List 객체를 선언하고 사원정보(사원번호, 사원명, 직책)을 입력하여 누적 처리한 리스트를 출력하세요.



--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
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