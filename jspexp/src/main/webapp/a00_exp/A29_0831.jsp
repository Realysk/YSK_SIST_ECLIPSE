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
	$(document).ready(function(){
		$("[name=ename],[name=job]").keyup(function(event){
			//if(event.keyCode==13){
			search();
			//}
		});
		$("#schBtn").click(function(){
			search();
		});
	});
	function search(){
		var snd = "ename="+$("[name=ename]").val()+"&job="+$("[name=job]").val();
		var xhr = new XMLHttpRequest();
		xhr.open("post","z13_data.jsp",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send(snd);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				$("div").html(xhr.responseText);
			}
		};
	}
</script>
</head>

<%

%>
<body>
	
	<h2 align="center">08.31 정리문제</h2>
<%-- 
# 정리문제
	1. [AJAX] 부서정보 keyup 이벤트로 ajax로 검색되게 처리하세요. 단, JSON 데이터를 만들어서 처리가 되게 하세요. (DAO 연동)
	
	--%>
		<form id="frm01" method="post">
		<table align="center" class="listTable">
			<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
			<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
			<tr><td colspan="2" style="text-align:center" ><input type="button" id="schBtn" value="검색"/></td></tr>
		</table>	
		</form>
		<div></div>
	<%--
	
	2. [JSTL] forTokens의 속성들을 기술하세요.
	
		- 속성
		var : 구분자에 의해 추출된 단위 데이터를 할당할 변수명을 지정.
		items : 구분자가 포함되어 있는 문자열 데이터
			ex) 사과^바나나^딸기
		delims : 구분자
		varStatus : index, count, first, last 등의 효과적인 변수를 활용 기능	
	
	3. [JSTL] forTokens를 이중으로 활용하여 문자열데이터 "사과^3000^2^@오렌지^2000^3@수박^1200^3"을 처리하여 테이블에 출력하세요.
	
	--%>
		<table align="center" class="listTable">
			<c:forTokens var="prod" items="사과^3000^2^오렌지^2000^3^수박^1200^3" delims="^" varStatus="sts">
				<c:if test="${sts.count%3==1}"><tr></c:if>
				<c:forTokens var="prod" items="사과^3000^2^@오렌지^2000^3@수박^1200^3" delims="@" varStatus="sts">
					<td>${prod}[${sts.index}]</td>
				</c:forTokens>
				<c:if test="${sts.count%3==0}"></tr></c:if>
			</c:forTokens>
		</table>
	<%--	

--%>
	
</body>
</html>