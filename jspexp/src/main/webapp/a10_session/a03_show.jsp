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

</head>
<%-- 
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("세션값 확인");
	});

</script>
<body>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01}</td></tr>
		<tr><th>세션값2</th><td>${num02}</td></tr>
		<tr><th>세션값3</th><td>${num03}</td></tr>
		<tr><th colspan="2" id='ckSession'>세션값 설정</th></tr>
	</table>
	
<script type="text/javascript">
	$("#ckSession").click(function() {
		var num03 = "${num03}";
		if(num03=="") {
			alert("세션 종료\n 세션 섫정페이지 이동");
			location.href="a03_deleteSession.jsp";
		}
	});
	
	// ex) ID : [  ] [로그인] 해당 ID로 로그인했을 때 session을 설정(5초)하고 (a06_login.jsp)
	//	   페이지를 이동(a07_show.jsp) ''###님 로그인 중' 으로 처리한 후, 기능버튼(등록)을 클릭 시, 시간전에는 기능수행 alert(), 시간이 지나면 로그인을 하게 처리하세요.
	
</script>
	
</body>
</html>