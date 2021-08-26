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
# 요청값 post방식처리
	1. 아래의 기능 이외는 동일
		1) header 정보 변경
		xhr.setRequestHeader("Content-type", "application/x-www.form-urlencoded");
		2) send의 매개값으로 요청값 전달
		xhr.send("key=value&key2=value2");

--%>
<script type="text/javascript">
	$(document).ready(function() {
		var xhr = new XMLHttpRequest();
		$("[name=id],[name=pass]").keyup(function() {
			if(event.keyCode==13) {
				var id = $("[name=id]").val();
				var pass = $("[name=pass]").val();
				var snd = "?id="+id+"&pass"+pass;
				console.log(snd);
			}
		});
	});

</script>
<body>

	<h2 align="center"> 비동기 POST 방식 </h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th> PW </th><td><input type="password" name="pass" value=""/></td></tr>
	</table>	
	</form>	
	
</body>
</html>