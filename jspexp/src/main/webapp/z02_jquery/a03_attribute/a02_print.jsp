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
# JQuery의 출력과 value
	1. .html() : html로 랜더링할 내용과 html 코드를 가져온다.
	2. .text() : 글자 그대로 html코드 그대로 가져온다.
	3. .val() : 속성의 values값 처리 및 가져올 때 사용한다.
	
# callback 함수 형태
	$("선택자").기능메서드(function(idx){return "설정할 값"});

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("출력 관련 속성");
		$("div").eq(0).text("<h2>안녕하세요.</h2>"); // 저장
		$("div").eq(1).html("<h2>안녕하세요.</h2>"); // 저장
		$("div").eq(2).text($("form").html()); // 호출
		$("div").eq(3).css("border","1px solid blue").text($("form").text());
		$("[name=ename]").val("홍길동");
		$("h2").text("저장된 값 가져오기 : " + $("[name=ename]").val());
		$("input").val("데이터1");
		$("input").eq(1).val("^^");
		$("h3").text(function(idx) {
			return idx + " 안녕하세요!";
		});
		$("div").html(function(idx) {
			return "<h"+(idx+1)+">반갑습니다!!</h"+(idx+1)+">";
		});
		
		/*
		$("다중의요소").html(function(idx) {return ""});
		$("다중의요소").css("속성", function(idx) {return ""});
		*/
	});

</script>
<body>

	<h2 align="center"></h2>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>

	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>