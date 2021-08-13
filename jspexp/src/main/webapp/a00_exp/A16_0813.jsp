<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
	buffer="8kb"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# 정리문제
	1. session scope의 4가지 범위를 기술하세요.
	
		pageContext.setAttribute("pageVar", "홍길동(page)");
		request.setAttribute("requestVar", "김길동(request)");
		RequestDispatcher rd = request.getRequestDispatcher("a02_sessionScope2.jsp");
		rd.forward(request, response);
		session.setAttribute("sessionVar", "신길동(session)");
		application.setAttribute("applicationVar", "마길동(application)");	
	
	2. out 객체를 이용하여 buffer 메모리 8kb를 설정하고, 화면에 로그인 인증여부의 결과를 out객체를 활용하여 처리하되, buffer의 정보(크기,남은크기)도 함께 출력하세요.
	
		--%>
		<h3 align="center">버퍼의 크기 : <%=out.getBufferSize() %></h3>
		<h3 align="center">남은 버퍼의 크기 : <%=out.getRemaining() %></h3>
		<h3 align="center">자동 flush : <%=out.isAutoFlush() %></h3>
		<%--
	
	3. request 범위로 활용하여, 배달물건의 가격에 따른 등급(등급범위는 임의)이 다른 페이지(물건명,가격 요청값 표기)로 이동하게 처리하세요.
	    입력 : 물건명, 가격  페이지1(1등급), 페이지2(2등급), 페이지3(3등급)
	
	
	
	4. session 범위로 활용하여 초기페이지(세션값1000설정), 이동페이지2(세션값10차감), 이동페이지3(세션값20차감) 회원의 페이지마다 물건을 구매하는 부분을 간단하게 처리하는 부분으로 초기페이지에서 세션값을 설정한 후, 이동페이지2, 이동페이지3을 서로 이동하면서 계속 세션값이 차감되어 출력되게 하세요.
	
	
	
	5. application 범위로 web.xml에 이미지파일경로와 다운로드파일경로를 설정한 후, 해당 경로를 jsp페이지에서 호출하여, 출력하게 하세요.
	
	
	
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
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