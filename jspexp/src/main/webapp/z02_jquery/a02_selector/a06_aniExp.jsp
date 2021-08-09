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
			$("h2").text("입력 갯수 : " + $(":input").length);
			$("#run").click(function() {
				$(":animated").toggleClass("toggleWidth"); // toggleClass() 클래스 적용/미적용 반복
				// $(":animated") 동적인 처리가 일어나고 있는 선택자 객체
				// 클릭시마다 클래스의 적용 여부를 실행해준다. toggleClass() : addClass() / removeClass() 포함
			});
			function animateIt() {
				// slideToggle("속도", 반복할함수) : 해당 대상객체를 보였다가 보이지 않았다를 슬라이더 형식으로 처리한다.
				$("div:eq(0), div:eq(2)").slideToggle("slow", animateIt); // 재귀적 호출
			}
			animateIt();
			
			// ex) a06_aniExp.jsp div 위 내용으로 적용하되 색상은 파랑색 float:left;는 제거.
			//		class로는 width와 height 10px, 10px로 선언하여 3개의 div를 만들고 1번째 3번째가 slide로 보였다가 보이지 않았다를 처리 후
			//		버튼을 클릭 시 클래스를 적용/미적용 처리를 하세요.
		});
	
	</script>
</head>
<style>

	div {background:blue; border:1px solid red; width:70px; height:70px; margin:0 3px;}
	.toggleWidth{width:10px; height:10px;}
	
</style>
<body>

	<h2 align="center"></h2>
	<button id="run"> 실행 </button>
	<div></div>
	<div></div>
	<div></div>	
	
</body>
</html>