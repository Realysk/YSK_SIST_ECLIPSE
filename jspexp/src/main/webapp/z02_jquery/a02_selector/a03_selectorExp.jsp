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
	// jquery 이벤트 $("h2").click(이벤트핸들러함수)
	$("h2#exp01").click(function() {
		// ex) div, span과 p태그 하위에 클래스 myClass에 대하여 선택자를 지정하고 해당 선택자에 대하여는 글자색상을 red로 처리하세요.
		// $("선택자1, 선택자2....")
		// alert("클릭");
		$("div, span, p.myClass").css("color","red");
	});
	$("h2#exp02").click(function() {
		$("div, span, p.myClass").css("color","red");
	});
	

</script>
</head>

<body>

	<h2 id="exp01" align="center"> 선택자연습1 </h2>
	<div> div </div>
	<p class="myClass">p class="myClass"</p>
	<p class="notMyClass">p class="notMyClass"</p>
	<span>span</span>
	
	<h2 id="exp02" align="center"> 선택자연습2 </h2>
	<ul class="tabnav">
		<li> 아이템 1 </li>
		<li> 아이템 2 
			<ul>
				<li> 중첩 아이템 1 </li>
				<li> 중첩 아이템 2 </li>
				<li> 중첩 아이템 3 </li>			
			</ul>
		</li>
		<li> 아이템 3 </li>
	</ul>
	
</body>
</html>