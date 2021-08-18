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
# has("선택자")
	1. 해당 객체의 선택자가 있으면 처리하는 기능 메서드
# slick(시작, 마지막)
	2. 특정한 요소객체의 시작과 마지막 부분을 선택해준다.
	3. event.target : 이벤트가 일어난 대상 객체
		.is("선택자") : 위 이벤트의 대상객체가 선택자에 해당하는 여부를 boolean값을 가져온다.
	

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("여러가지 기능메서드 (클릭)").click(function () {
			// ID가 ul01이고 바로 하위자식에 ul을 포함하고 있으면 배경색상을 pink로 처리
			$("#ul01>li").has("ul").css("background", "pink");
			$("#ul02>li").slice(2,4).css("background", "purple");
		});
		$("#ul02").click(function(event) { // 이벤트에 일어난 내용
			console.log(event.target);
			$(event.target).css("background", 'orange');
		});
		
		// ex1) event.target을 활용하여 div를 클릭하여 하위에 여러개의 h3를 만들어 클릭 시, 배경색상을 노란색으로 출력하세요.
		
		$("h3").text("h3 객체!!");
		$("#addBtn").click(function() {
			$("div").html($("div").html()+"<h4> h4 추가 </h4>");
		});
		$("div").click(function(event) {
			// 현재 화면에는 없지만 앞으로 만들어진 객체에 대한 이벤트 처리는 상위객체를 기준으로 이벤트를 선언하고 event.target을 통해서 이벤트가 일어나는 대상객체를 지정하고 .is("h3")를 통해서 하위객체를 선택자를 지정
			if($(event.target).is("h3")) $(event.target).css("background", "yellow").text("클릭1!!");
			if($(event.target).is("h4")) $(event.target).css("background", "pink").text("클릭2!!");
		});
		
		// ex2) 버튼을 만들고 추가를 클릭했을 때 #div h4로 컴퓨터 부분이 추가되게 하고 해당 컴퓨터 부분을 클릭 시 배경색상과 글자색상이 변경되게 하세요,
	});

</script>
<body>

	<h2></h2>
	<input type="button" value="컴퓨터부품추가" id="addPartBtn"/>
	<div id="div01"></div>
	
	<input type="button" value="추가" id="addBtn"/>
	<div>
		<h3></h3>
		<h3></h3>
		<h3></h3>
		<h3></h3>
		<h3></h3>
	</div>
	
	<ul id="ul01">
		<li>아이템1</li>
		<li>아이템2</li>
		<li>아이템3
			<ul>
				<li>아이템3-1</li>
				<li>아이템3-2</li>
				<li>아이템3-3</li>
			</ul>
		</li>
		<li>아이템4</li>
		<li>아이템5</li>
	</ul>
	
	<ul id="ul02">
		<li>아이템1</li>
		<li>아이템2</li>
		<li>아이템3</li>
		<li>아이템4</li>
		<li>아이템5</li>
	</ul>
	
</body>
</html>