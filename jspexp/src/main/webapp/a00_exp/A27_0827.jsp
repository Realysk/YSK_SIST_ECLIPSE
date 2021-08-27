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
# 정리문제
	1. XMLHttpRequest 객체의 get/post방식의 코드차이를 기술하세요
	
		get방식 요청값 처리 : url+"?key=value&key2=value2"...
		
		post방식 요청값 처리 : 아래의 기능 이외는 동일
			1) header 정보 변경
			xhr.setRequestHeader("Content-type", "application/x-www.form-urlencoded");
			2) send의 매개값으로 요청값 전달
			xhr.send("key=value&key2=value2");
			
	
	2. post방식/비동기으로 학생의 국어/영어/수학 점수를 입력하여 총점과 평균을 출력하세요.
	
	
	
	3. get방식/동기로 회원아이디를 입력하여 DAO를 통해 해당 회원의 아이디/패스워드, 이름, 권한, 포인트를 출력되게 하세요.
	
	
	
	4. jstl와 usebean을 활용하여 객체선언 및 데이터할당 3가지 방식을 기술하세요.
	
		<jsp:useBean id="객체참조명" class="@@@">
		<%
			mvc의 컨트롤에서 선언된 코드, jsp의 scriptlet코드
			request.setAttribute("객체참조명", new 객체명(@@@))>;
		%>
		<c:set var="변수명" value="${참조명}"/new 객체명("")"
		<c:set target="객체명(bean의 id, session scope의 변수명, c:set의 var=변수명)" property="프로퍼티이름/set메서드명" value="할당할값"/>
		${객체명.프로퍼티명}
		cf) 바로 el코드로 처리해도 된다. ${객체명.setName("홍길동")}
		ex) <c:set target="p01" property="name" value="마길동"/>
		${p01.name} : 변경된 데이터 확인		
	
	5. 임의의 구구단이 출력되어 입력값을 입력했을 때, 입력하지 않을 때와 정답/오답 jstl 조건문을 활용하여 처리하세요.
	
	
	
	6. 물건가격[   ] 갯수[   ] [구매]
    	구매 총계가 10만원 이상일 때, 10%할인, 5~10미만 5%, 그외는 3%할인 할인률과 최종 금액 표시 (jstl 활용 출력)
    	
    	
    	
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