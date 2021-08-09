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
		$("h2").eq(1).text("선택");
		$("h2").first().css("color", "navy");
		$("h2:even").css("background-color",'yellow');
		// $("h2").length() : 해당 객체의 길이
		var ranIdx = Math.floor(Math.random()*$("h2").length);
		$("h2").eq(ranIdx).text("빙고");
		
		// ex) 3X3 테이블을 만들고 해당 셀에 1~9 번호를 입력 후 특정 임의의 부분에는 배경색상을 노란색으로 글자를 "빙고"로 출력하세요.
		
		var tds = $("#gTab td"); // JS로 DOM 객체로 지정 처리
		console.log("크기 : " + tds.length);
		var ranIdx = Math.floor(Math.random()*tds.length);
		// td 객체에 번호를 설정 처리
		for(var idx=0; idx<tds.length; idx++) {
			$("#gTab td").eq(idx).text(idx+1);
		}
		$("#gTab td").eq(ranIdx).css("background-color", "yellow");
		$("#gTab td").eq(ranIdx).text("빙고");
	});

</script>
</head>
<%-- 
# 위치기반 선택자
	$("선택자")
	:first : 페이지에서 처음으로 일치하는 엘리먼트
	:last : 마지막으로 일치하는 엘리먼트
	:even : 페이지 전체의 짝수번째 엘리먼트 반환
	:odd : 페이지 전체의 홀수번째 엘리먼트 반환
	:eq(n) : n번째로 일치하는 엘리먼트
	:gt(n) : greater then : n번째(포함하지 않음) 이후의 일치하는 엘리먼트 반환
	:lt(n) : less then : n번째(포함하지 않음) 이전의 일치하는 엘리먼트 반환
	:first-child : 첫 번째 자식 엘리먼트
	:last-child : 마지막 자식 엘리먼트
	:nth-child(n) : n번째 자식 엘리먼트 반환
	:nth-child(even) : 짝수 자식 엘리먼트 반환
	:nth-child(odd) : 홀수 자식 엘리먼트 반환
	:nth-child(Xn+Y) : 전달 된 공식에 따른 n번째 자식 엘리먼트 반환 (Y는 0일 경우 생략 가능)

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<h2 align="center"></h2>
	<h2 align="center"></h2>

	<table align="center" width="50%" id="gTab" style="text-align:center" class="listTable">
		<col width="33%"><col width="33%"><col width="33%">
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>