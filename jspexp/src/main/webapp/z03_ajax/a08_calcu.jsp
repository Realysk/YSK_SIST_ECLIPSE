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
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#plusBtn").click(plus);
		// 입력과 동시에 이벤트로 요청값과 결과값을 서버에 전달해서 처리
		$("[name=num01],[name=num02]").keyup(plus);
	});
	function plus() {
		var num01 = $("[name=num01]").val();
		var num02 = $("[name=num02]").val();
		var snd = "?num01="+num01+"&num02="+num02;
		var xhr = new XMLHttpRequest();
		xhr.open("get","z09_data.jsp"+snd, false);
		xhr.send();
		$("div").html(xhr.responseText);
	}
	
	// ex) a08_calcu.jsp [   ] [   ] -> z09_data.jsp
	// 		@@ + @@ = @@ <= z09_data.jsp

</script>
<body>

	<h2 align="center">동기 연산</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>숫자1</th><td><input type="text" name="num01" value="0"/></td></tr>
		<tr><th>숫자2</th><td><input type="text" name="num02" value="0"/></td></tr>
		<tr><td colspan="2"><input type="button" value="합산" id="plusBtn"/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>