<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="A05_0729에서 받아 온 회원 정보";
	}
</script>
</head>
<%-- 
# 

--%>
<body>
	<script type="text/javascript">
		function insertFrm() {
			if(confirm("등록 페이지로 이동합니다.")) {
				location.href="A05_0729_2_memberInsert.jsp";
			}
		}
	</script>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><td colspan="2"><input type="button" value="등록" onclick="insertFrm()"/></td></tr>
	</table>	
	</form>
	<%
		A05_PreparedDao dao = new A05_PreparedDao();
	%>
	<table>
		<tr><th> ID </th><th> PW </th><th> NAME </th><th> AUTH </th><th> POINT </th></tr>
		<%for(Member m:dao.getMemberList()) { %>
			<tr>
				<td><%=m.getId() %></td>
				<td><%=m.getPass() %></td>
				<td><%=m.getName() %></td>
				<td><%=m.getAuth() %></td>
				<td><%=m.getPoint() %></td>
			</tr>
		<% } %>
	</table>	
	
</body>
</html>