<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//$("h2").text("선택자 연습1");
		// jquery 이벤트   $("선택자").click(이벤트핸들러함수);
		$("h2#exp01").click(function(){
			// ex) div, span과  p태그하위에 클래스 myClass에 대하여 선택자를 지정하고,
			//     해당 선택자에 대하여는 글자색상을 red로 처리하세요.. 4조
			// $("선택자1, 선택자2 ....")
			//alert("클릭");
			$("div, span, p.myClass").css("color","red");
		});
		$("h2#exp02").click(function(){
			// ex) class명이 topnav인 ul 바로밑(*) li의  border  3px double red로
			//    처리하세요. 5조..
			$("ul.topnav>li").css("border","2px double red");
		});
	});
</script>
</head>
<body>
	<h2 id="exp01" align="center">선택자연습1</h2>
	<div>div</div>
	<p class="myClass">p class="myClass"</p>
	<p class="notMyClass">p class="notMyClass"</p>
	<span>span</span>
	<h2 id="exp02" align="center">선택자연습2</h2>
	<ul class="topnav">
	  <li>아이템 1</li>
	  <li>아이템 2
	    <ul>
	    <li>중첩 아이템 1</li>
	    <li>중첩 아이템 2</li>
	    <li>중첩 아이템 3</li>
	    </ul>
	  </li>
	  <li>아이템 3</li>
	</ul>	
	
</body>
</html>