<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDAO"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDTO"
%>
<%

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PICMAGINE : 회원 가입 완료 </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="PICMAGINE : 회원 가입이 완료되었습니다!";
	};

</script>
</head>
<body>

	<%
		JOINDAO dao = new JOINDAO();
		ArrayList<JOINDTO> jlist = dao.memberList();
		dao.Joined(new JOINDTO());
	%>
 
	<h3></h3>
	<table>
		<tr><th> NO. </th><th> NAME </th><th> ID </th><th> PW </th><th> TEL </th><th> EMAIL </th></tr>
		<%for(JOINDTO j:jlist) { %>
		<tr>
			<td><%=j.getMemcode() %></td>
			<td><%=j.getName() %></td>
			<td><%=j.getId() %></td>
			<td><%=j.getPw() %></td>
			<td><%=j.getTel() %></td>
			<td><%=j.getEmail() %></td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>