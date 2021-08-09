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
		$("h2").text("구구단 정답 페이지");
	});
	
	var msg = "${msg}";
	if(msg != "") {
		alert(msg);
	}

</script>
</head>
<%-- 
# \a00_exp\A12_0809_result.jsp

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th> 입력한 정답 </th></tr>
		<%-- 입력한 요청 값은 el 태그를 활용해서 param.XXX 형식으로 처리가 가능하다. --%>
		<tr><td> ${param.grade} X ${param.cnt} = ${param.inReply} </td></tr>
	</table>	
	
</body>
</html>