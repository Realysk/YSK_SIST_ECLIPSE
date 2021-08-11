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
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("form js+jsp");
		$("#regBtn").click(function() {
			// 등록 처리 프로세스 표시
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function() {
			// 수정 처리 프로세스 표시
			$("[name=proc]").val("update");
			$("form").submit();
		});
		$("#delBtn").click(function() {
			// 삭제 처리 프로세스 표시
			$("[name=proc]").val("delete");
			$("form").attr("action","<%=path%>/a05_jsp_const/a08_delete.jsp");
			$("form").submit();
		});
		$("#mainBtn").click(function() {
			// 메인 이동 처리 프로세스 표시
			location.href = "<%=path%>/a05_jsp_const/a09_main.jsp";
		});
	});

</script>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
		<input type="hidden" name="proc"/>
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2">
				<input type="button" value="등록" id="regBtn"/>
				<input type="button" value="수정" id="uptBtn"/>
				<input type="button" value="삭제" id="delBtn"/>
				<input type="button" value="메인" id="mainBtn"/>
			</td>
		</tr>
	</table>
	</form>
	<%
		String proc = request.getParameter("proc");
		if(proc != null) {
	%>
		<h3 align="center">처리되는 프로세스 : <%=proc %></h3>
	<% } %>
	
</body>
</html>