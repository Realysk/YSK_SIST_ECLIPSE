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
	$(document).ready(function(){
		$("h2").text("시작");
	});
	function class01(){
		// 클래스의 선택자는 .
		$(".myClass").css("border","2px solid blue");
	}
	function class02(){
		$(".otherClass").css("color","red");
	}
	function class03(){
		// $(".클래스1.클래스2").css({"속성1":"속성1값","속성2":"속성2값"})
		$(".myClass.otherClass").css({"color":"red","border":"2px solid blue"});
	}
</script>
</head>
<%--
ex) 클릭시, myClass는 border  2px solid blue 속성 설정
          otherClass는 글자 색상을 빨강색 속성 설정..  3조..
--%>
<body>
	<h2 align="center"></h2>
	<h3 align="center" onclick="class01()">myClass 적용</h3>
	<h3 align="center" onclick="class02()">other클래스 적용</h3>
	<h3 align="center" onclick="class03()">myClass와 other클래스 적용</h3>
	<div class="myClass">div class="notMe"</div>
	<div class="otherClass">div class="otherClass"</div>
	<span class="myClass otherClass">span class="myClass"</span>	
</body>
</html>