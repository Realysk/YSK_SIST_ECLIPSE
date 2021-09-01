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
	ex) ID로 회원정보 MVC AJAX로 검색처리 하세요.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		var xhr = new XMLHttpRequest();
		$("[name=id]").keyup(function(event) {
			if(event.keyCode==13) {
				var idVal = $("[name=id]").val();
				console.log($("[name=id]").val());
				xhr.open("get","${path}/schMem.do?id="+idVal,true);
				xhr.send();
				xhr.onreadystatechange=function() {
					if(xhr.readyState==4&&xhr.status==200) {
						var jTxt = xhr.responseText;
						$("#show td").text("");
						if(jTxt!="{}") {
							var mem = JSON.parse(xhr.responseText);
							console.log(mem);
							$("#show td").eq(0).text(mem.id);
							$("#show td").eq(1).text(mem.pass);
							$("#show td").eq(2).text(mem.name);
							$("#show td").eq(3).text(mem.auth);
							$("#show td").eq(4).text(mem.point);
						} else {
							alert("해당 회원정보는 존재하지 않습니다.");
						}
					}
				};
			}
		});
	});

</script>
<style> td {text-align:center} </style>
<body>
	
	<h2 align="center">회원정보 MVC (AJAX)</h2>
	<table align="center" class="listTable">
		<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
	</table><br><hr><br>
	<table id="show" align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%">
		<tr><th> ID </th><td></td></tr>
		<tr><th> PASS </th><td></td></tr>
		<tr><th> NAME </th><td></td></tr>
		<tr><th> AUTH </th><td></td></tr>
		<tr><th> POINT </th><td></td></tr>
	</table>	
	
</body>
</html>