<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.Date"
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
<%

%>
<c:set var="now" value="<%=new Date()%>"/>
<body>

<%-- 
# 0901 정리문제
	1. 날짜형 데이터에 대한 fmt 기본 형식을 기술하세요.
	
		<c:set var="now" value="<%=new Date()%>"/>
		<h3 align="center">fmt 처리 기본(날짜): <fmt:formatDate value="${now}"/></h3>
		<h3 align="center">fmt 처리 full(날짜): <fmt:formatDate type="date" dateStyle="full" value="${now}"/></h3>
		<h3 align="center">fmt 처리 short(날짜): <fmt:formatDate type="date" dateStyle="short" value="${now}"/></h3>
	
	2. 오늘을 기준으로 날짜와 현재시간을 full형식으로 출력처리하세요.
	
	--%>
   <table align="center" class="listTable">
      <tr>
      	<th> 금일 </th><td><fmt:formatDate type="date" dateStyle="full" value="${now}"/></td>
      </tr>
      <tr>
      	<th> 현재시간 </th><td><fmt:formatDate type="time" timeStyle="full" value="${now}"/></td>
      </tr>
   </table>		
	<%--
	
	3. 숫자형 데이터의 기본 속성을 기술하세요.
	
		<c:set var="num01" value="9524333.7432"/>
		<fmt:formatNumber value="${num01}"/>
	
	4. DB 접근하여 MVC 패턴으로 데이터를 출력하는 기본 프로세스를 controller, service, dao, view, model로 핵심코드와 함께 설명하세요.
	
		1) Controller
			(1) 요청값 처리 : request.getParameter("id")
			(2) 모델데이터 선언
				request.setAttribute("", 서비스단결과값) : Service (Dao객체 생성 호출) => Dao
				서비스
				DAO
			(3) View(jsp) 호출
		2) View
			(1) 초기화면
			(2) 요청값 처리 form
			(3) 결과 처리 내용 el/jstl로 출력
		3) 처리 순서
			(1) 각 기능별 파일 생성
			(2) 연동 처리
				서비스단 : DAO 생성 및 메서드 호출
				컨트롤러단 : 서비스단 생성 및 호출 (모델)
					뷰단 호출		
	
	5. MVC 패턴으로 등록된 ID인지 여부를 확인 처리(DAO 추가)하는 JSP 프로그램을 구현하세요.
	
	
	
--%>	
	
</body>
</html>