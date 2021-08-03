<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# session2
	1. session은 서버와 클라이언트 관계에서 발생한 데이터를 서버에 저장하는 것이다.
	2. 기본 형식
		session.setAttrubute("key", "value");
	3. 객체의 저장
		session.setAttrubute("객체참조", new 객체());
	4. 객체의 호출
		(데이터유형)session.getAttribute("객체참조");
--%>
<%
	// session에 mem이라는 이름으로 저장 처리
	Member m = (Member)session.getAttribute("mem");
	// ex) a16_sessionExp.jsp 학생명, 국어, 영어, 수학 점수를 세션으로 설정.
	//	   a17_showSession.jsp 저장 된 session을 호출하여 출력
%>
<body>

	<form id="frm01" method="post">
	<table class="listTable" align="center">
		<tr><th colspan="2"> 세션 값 확인 (페이지 이동 후) </th></tr>
		<tr><th> ID </th><td><%=m.getId() %></td></tr>
		<tr><th> NAME </th><td><%=m.getName() %></td></tr>
		<tr><th> AUTH </th><td><%=m.getAuth() %></td></tr>
	</table>	
	</form>
	
</body>
</html>