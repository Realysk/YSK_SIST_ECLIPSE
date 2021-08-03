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
	// ex) a16_sessionExp.jsp 학생명, 국어, 영어, 수학 점수를 세션으로 설정.
	//	   a17_showSession.jsp 저장 된 session을 호출하여 출력
--%>
<%
	// session에 mem이라는 이름으로 저장 처리
	Student s = (Student)session.getAttribute("stu");
%>
<body>

	<form id="frm01" method="post">
	<table class="listTable" align="center">
		<tr><th colspan="2"> 세션 값 확인 (페이지 이동 후) </th></tr>
		<tr><th> NO. </th><td><%=s.getSno() %></td></tr>
		<tr><th> NAME </th><td><%=s.getName() %></td></tr>
		<tr><th> KOR </th><td><%=s.getKor() %></td></tr>
		<tr><th> MATH </th><td><%=s.getMath() %></td></tr>
		<tr><th> ENG </th><td><%=s.getEng() %></td></tr>
	</table>	
	</form>
	
</body>
</html>