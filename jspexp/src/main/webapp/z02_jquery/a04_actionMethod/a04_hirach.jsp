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
# 계층구조 관련 메서드
	1. children("자식중선택자")
	2. parents() : 상위계층 객체들
	   parent() : 바로 상위 부모 객체
	3. next() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 다음 요소객체 지정
	4. prev() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 앞선 요소객체 지정
	5. siblings() : 형제요소객체들 지정

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("계층 구조 요소객체들 (클릭)").click(function() {
			$("p").parent().css("font-size", "30px");
			$("p").parent(".selected").css("background", "yellow");			
		});
	});

</script>
<body>

	<h2 align="center"></h2>
	<div><p>홍길동</p></div>
	<div class="selected"><p>이순신</p></div>
	
</body>
</html>