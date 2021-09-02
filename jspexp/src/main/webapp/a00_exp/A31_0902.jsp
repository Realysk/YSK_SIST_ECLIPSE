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
<body>

<%-- 
# 0902 정리문제
	1. com.google.gson.Gson api를 활용하여 객체를 json 문자열로, json 문자열을 객체로 변환하는 기본 메서드를 기술하세요.
	
		객체명 변수명 = new 객체명(매개변수1, 매개변수2,...);
		Gson Gson변수명 = new Gson();
		// 1. 객체를 JSON 문자열로 변환 처리
		String json변수명 = Gson변수명.toJson(변수명);
		System.out.println("JSON 문자열 데이터 : " + json변수명);
		// 2. JSON 문자열을 Person 객체로 변환 처리
		//		"는 \"가 자동으로 붙어서 저리된다.
		String json변수명2 = "{\"name\":\"마길동\",\"age\":29,\"loc\":\"제주도\"}";
		객체명 json변수명2 = gson변수명.fromJson(json2, 객체명.class);
		System.out.println(변수명.get매개변수);
	
	2. MVC 패턴을 활용하여 ajax 데이터를 처리하려고 한다. controller, service, dao, view 단 위주로 처리하는 핵심 프로세스를 정리하세요.
	
		1) Controller
			(1) 요청값 처리 : request.getParameter(요청값)
			(2) 모델데이터 선언
				request.setAttribute("", 서비스단결과값) : Service (Dao객체 생성 호출) => Dao
				Service
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
	
	3. 전날 처리한 ajax 회원 id 조회 화면에서 등록, 수정, 삭제를 버튼으로 추가하여 ajax로 처리해보세요.
	
		
	
--%>	
	
</body>
</html>