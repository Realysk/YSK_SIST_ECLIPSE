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
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# AJAX로 Json 데이터 로딩
	1. 서버단에 있는 핵심 json 형식의 데이터를 ajax로 가져오는 것을 말한다.
	2. ajax처리 json데이터 필수 형식
		1) {속성:속성값},[{속성:속성값....}]
		2) 웹서비스상 json형식은 다음과 같은 형식을 준수하여야 정상적으로 객체화하여 사용할 수 있다.
		3) 형식 (ajax 처리 시 반드시 지켜야 한다.)
			{"속성":"문자열데이터","속성":숫자형/boolean형데이터}
			속성과 문자열 데이터는 반드시 ""(쌍따옴포) 사이에 입력해야 한다.
			cf) ''사이에 입력하거나 없이 입력하는 것은 정상처리가 되지 않는다.
				숫자형/boolean형 데이터는 반드시 ""/'' 없이 그대로 처리해야 한다.
	3. responseText로 받은 데이터는 문자열형 json데이터이기에 객체로 사용하려면 eval('('+xhr+')') 함수를 이용해야 한다. JSON.parse(xhr) 객체 함수 이용
		cf) json 객체로 서버에서 전달해오면 html화면을 구현된 내용을 처리하는 것보다 복잡하고 유효성 체크를 해야하는 단점은 있지만 서버에서 오는 데이터에 대한 부담을 줄여 보다 빠르고 효율적으로 처리할 수 있는 장점을 가지고 있다.

--%>
<%

%>
<body>

	<h2 align="center"></h2>
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