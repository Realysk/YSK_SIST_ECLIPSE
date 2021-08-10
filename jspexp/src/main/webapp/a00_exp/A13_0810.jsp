<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%

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
		$("h2").text("08.10 정리 문제");
		
		var tds2 = $("#exp03 td");
		var ranIdx = Math.floor(Math.random()*tds2.length);
		for(var idx=0; idx<tds2.length; idx++) {
			$("#exp03 td").eq(idx).text(idx+1);
		}
		$("#exp03 td").eq(ranIdx).text("꽝");
		$("#exp03 td").eq(ranIdx).css("color", "red");
		$("#exp03 td").eq(ranIdx).css("background-color", "yellow");
		
		$("#run").click(function() {
			$(":animated").toggleClass("toggleWidth");
		});
		function animateIt() {
			$("div:eq(0), div:eq(2), div:eq(4), div:eq(6), div:eq(8), div:eq(10)").slideToggle("slow", animateIt);
			$("div:eq(0), div:eq(2), div:eq(4), div:eq(6), div:eq(8), div:eq(10)").css("background-color", "orange");
		}
		animateIt();
		
	});

</script>
<style>

	div {float:right; background:blue; border:1px solid red; width:70px; height:70px; margin:0 3px;}
	.toggleWidth{width:10px; height:10px;}
	
</style>
</head>
	<h2 align="center"></h2>
<%-- 
# # 정리문제
	1. [JS] 위치기반 선택자 중, :even과 :nth-child(even) 차이점을 기술하세요.
	
		:even - 페이지 전체의 짝수번째 엘리먼트 반환
		:nth-child(even) - 짝수 자식 엘리먼트 반환
	
	2. 위치기반 선택자를 활용하여 테이블의 배경색상을 행단위 짝/홀로 변경하여 출력하세요.
	
		--%>
			<table align="center" width="50%" id="exp02" style="text-align:center" class="listTable">
				<col width="33%"><col width="33%"><col width="33%">				
				<tr><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td></tr>
			</table><br>		
		<%--
	
	3. 4*4테이블을 1~16로 출력하여 만들고, 이 중 폭탄이 들어간 CELL 1개를 만들어 클릭시, 꽝이라는 문자열은 빨강색, 배경색상은 노랑색으로 처리하세요.
	
		--%>
			<table align="center" width="100%" id="exp03" style="text-align:center" class="listTable">
				<col width="25%"><col width="25%"><col width="25%"><col width="25%">			
				<tr><td></td><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td><td></td></tr>
				<tr><td></td><td></td><td></td><td></td></tr>
			</table><br>		
		<%--	
	
	4. 클래스 적용에 대한 기능 메서드를 기술하세요.
	
		# 필터 선택자
			$(":animated") : 현재 애니메이션이 적용되고 있는 엘리먼트 선택
			$(":button") : 모든 유형의 버튼을 선택한다. (input[type=submit], input[type=reset], input[type=button])
			$(":checkbox") : 체크박스 엘리먼트를 선택한다.
			$(":checked") : 선택 된 체크박스나 라디오 버튼을 선택한다.
			$(":contains(food)") : 텍스트 food가 포함하는 엘리먼트만 선택
			$(":disabled") : 비활성화 상태인 모든 폼 엘리먼트 선택
			$(":enabled") : 활성화 상태인 모든 폼 엘리먼트 선택
			$(":file") : 모든 파일 엘리먼트를 선택한다.
			$(":header") : 헤더 엘리먼트 선택 (h1~h6)
			$(":hidden") : 감춰진 엘리먼트
			$(":image") : 폼 이미지
			$(":input") : 폼 엘리먼트만 선택
			$(":not(filter)") : 필터의 값을 반대로 변경
			$(":parent") : 자식 엘리먼트를 포함한 엘리먼트
			$(":password") : 패스워드 엘리먼트
			$(":radio") : 라디오 버튼 엘리먼트
			$(":reset") : 리셋 버튼 엘리먼트
			$(":selected") : 선택 된 엘리먼트만 선택		
	
	5. 10개의 div가 오른쪽으로 리스트된 화면에서 짝수 div인 것만 sliding되게 처리하고, 버튼을 클릭시 마다 배경색상과 폭이 변경되게 처리하세요.

		--%>
			<button id="run"> 실행 </button>
			<div></div>
			<div></div>
			<div></div>	
			<div></div>	
			<div></div>	
			<div></div>	
			<div></div>	
			<div></div>	
			<div></div>	
			<div></div>				
		<%--

--%>
<body>
	
</body>
</html>