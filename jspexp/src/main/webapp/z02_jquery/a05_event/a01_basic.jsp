<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").on("click", function() {
			$(this).css("background", "yellow").text("안녕하세요!!");
		});
	});

</script>
</head>
<%-- 
# JQuery의 이벤트 처리
	1. 이벤트 등록하기
		$("요소객체").on("이벤트명", 이벤트핸들러함수);
		이 메서드로 해당 엘리먼트에 원하는 이벤트를 적용할 수 있다.
		적용 가능한 이벤트는 click, mousedown, focus, resize등 여러 가지가 있다.
		인자가 기술한 함수는 이벤트가 발생했을 시 자동 실행된다.
	2. JQuery에서 지원하는 이벤트
		blur : focus가 가능한 엘리먼트, 엘리먼트가 포커스를 잃을 때 발생
		focus : focus가 가능한 엘리먼트, 엘리먼트가 포커스를 잃을 때 발생
		load : 모든 엘리먼트, 엘리먼트가 자신과 모든 서브 엘리먼트들이 로딩을 마쳤을 때 발생
		resize : window 엘리먼트, 브라우저의 크기가 변경되었을 때 window 객체에서 발생
		click : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터를 위치시키고 마우스 버튼을 누르고 뗐을 때 반응
		dblclick : 모든 엘리먼트, 엘리먼트가 더블 클릭 되었을 때 발생
		mousedown : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고 마우스 버튼을 눌렀을 때 발생
		mouseup : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고 바우스 버튼을 놓을 때 발생
		mousemove : 모든 엘리먼트, 마우스 포인터가 엘리먼트 내부에서 움직일 때 발생
		mouseover : 모든 엘리먼트, 마우스 포인터가 엘리먼트 안으로 이동할 때 발생
		mouseout : 모든 엘리먼트, 마우스 포인터가 엘리먼트에서 벗어날 때 발생
		select : input type="text", textarea, 내부의 텍스트들을 선택했을 때, (영역이 반전되었을 때) 발생
		keydown : focus가 가능한 엘리먼트, 키보드를 누를 때 발생, 키를 누르고 있어도 1회만 발생
		keypress : focus가 가능한 엘리먼트, 키보드를 누를 때 발생, 키를 누르고 있으면 연속적으로 발생

--%>
<%

%>
<body>

	<h2 align="center">초기 화면 내용</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>