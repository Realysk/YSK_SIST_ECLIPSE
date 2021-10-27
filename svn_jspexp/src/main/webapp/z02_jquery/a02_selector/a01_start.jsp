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
		$("h2").text("시작");
		$("*").css("color","blue");
		$("th").css("color","navy");
		$("table input").val("안녕하세요.."); // .val() : form하위 요속 객체 value 값 속성 처리 메서드.
		$("h1").css("color","red");
		$("h1").css("background-color","yellow");
		$("h3").css("color","blue");
		$("h3").css("background-color","orange");
		$("h4").css( {"color":"yellow","background-color":"blue"} );
	});
</script>
</head>
<%-- 
# 선택자(selector)
1. 문서 내에서 원하는 엘리먼트를 쉽게 식별하고 이를 추출하기 위해서 css/jquery에서
	제공 하는 기술이다.
2. 기본 css 선택자 : css 선택자를 통해서 DOM 객체를 선택할 수 있는 것을 말한다.
	1) * : 모든 엘러먼트 일치..
	2) E : 태그명이 E인 모든 엘리먼트
	3) E F : 태그명이 E이고 하위 엘리먼트 이름이 F인 엘리먼트..	
// ex) h1, h3, h4를 선언하고 각각의 글자 색상으로 빨 파 노로 처리하고, 배경색상을 jquery로 처리해보세요. 2조.
	4) E > F : E의 바로 아래  F엘리번트 선택.
	5) E + F : E의 형제 엘리먼트로 바로 다음 형제 F 엘리먼트
	6) E ~ F : E의 형제 엘리먼트로 다음에 오는 모든 F 엘리먼트
	7) E.C : 클래스명 C를 가지고 있는 모든 E 엘리먼트.
	8) E#I : 아이디가 I인 E엘리먼트.
	9) E[A] : 속성 A를 가지 E엘리먼트
	10) E[A=V] : 속성 A와 속성값 V를 가진 엘리먼트
	
	
--%>
<%

%>
<body>
	<h1>안녕하세요</h1>
	<h3>안녕하세요</h3>
	<h4>안녕하세요</h4>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>