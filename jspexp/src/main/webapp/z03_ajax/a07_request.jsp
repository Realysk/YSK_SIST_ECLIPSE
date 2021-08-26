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
</head>
<%-- 
# 요청값에 따른 반응값 처리
	1. get방식 요청값 처리
		url+"?key=value&key2=value2"...
		
	2. 데이터를 처리해주는 방식
		1) .txt : 입력된 데이터를 전송
		2) .html : html 태그 결과 코드를 전송
		3) .jsp : jsp로 요청값을 받은 화면을 처리
		4) controller(MVC패턴)의 결과로 문자열을 받는 처리

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		var xhr = new XMLHttpRequest();
		$("#schBtn").click(function() {
			var nameVal = $("[name=name]").val();
			xhr.open("get","z08_data.jsp?name="+nameVal,false);
			xhr.send();
			$("div").html(xhr.responseText);
		});
	});
	
	// ex) a08_calcu.jsp [   ] [   ] -> z09_data.jsp
	// 		@@ + @@ = @@ <= z08_data.jsp

</script>
<body>

	<h2 align="center">HTML 화면 호출</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><td colspan="2"><input type="button" id="schBtn" value="호출" style="align:center"/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>