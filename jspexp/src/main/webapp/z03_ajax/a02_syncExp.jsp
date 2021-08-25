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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("물건정보 (Click)").click(function() {
			// 1. 객체 생성
			var xhr = new XMLHttpRequest();
			// alert("객체생성 : " + xhr);
			// 2. 비동기 여부와 서버의 자원 요청
			//		get 방식으로 서버에 있는 z01_data.txt 호출, 비동기 여부는 false로 동기 처리.
			xhr.open("get","z02_data.txt", false);
			// 3. 서버 전송
			xhr.send();
			// 4. 서버에 결과값 받기
			var data = xhr.responseText;
			$("h3").text("받은 데이터 : " + data);
		});
	});
	
	// ex) a02_syncExp.jsp / z02_data.txt (물건정보) h2 클릭 시 물건정보를 가져와서 출력하세요.
	
</script>
<body>

	<h2 align="center"></h2>
	<h3 align="center"></h3>
	
</body>
</html>