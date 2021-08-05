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
		$("h2").text("메인화면");
		var auth = "${mem.auth}";
		$("#adminBtn").click(function() {
			if(auth=="관리자") {
				alert("관리자 기능 처리");
			} else {
				alert("권한이 없습니다.");
			}
		});
		${"#logout"}.click(function() {
			if(confirm("로그아웃을 하시겠습니까?")) {
				$("form").submit(); // 다시 controller에 요청 값을 proc=logout으로 전송				
			}
		});
	});

	var msg = "${msg}";
	if(msg!="") {
		alert(msg);
	}

</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	
	<form method="post"><input type="hidden" name="proc" value="logout"/></form>
	<h2 align="center"></h2>
	<h3 align="right">${mem.id}님 로그인 중 <input type="button" value="로그아웃" id="logout"/></h3>
	<input type="button" value="관리자기능" id="adminBtn"/>
	<h3 align="center" onclick="location.href='<%=path%>/a04_basic/a06_main2.jsp'"> 페이지 이동 </h3>

</body>
</html>