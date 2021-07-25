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
		document.querySelector("h3").innerText="PICMAGINE : 회원 정보";
	};

</script>
</head>
<body>

	<%
//		String name = "";
		
		JOINDTO dto = new JOINDTO();
//		dto.setName("TestName");		
//		dto.setId("TestId");
//		dto.setPw("Test1111");
//		dto.setTel("010-2020-2021");
//		dto.setEmail("testid@gmail.com");
			
		JOINDAO dao = new JOINDAO();		
		// 실제 DB접근해서 Insert 하는부분	
		dao.Joined(dto);			
		// 기존 저장되있는 회원목록을 보여주기 위한 변수
		ArrayList<JOINDTO> jlist = dao.memberList();							
	%>
 
	<h3></h3>
	<table>
		<tr><th> NO. </th><th> ID </th><th> PW </th><th> TEL </th><th> EMAIL </th><th> AUTH </th></tr>
		<%for(JOINDTO j:jlist) { %>
		<tr>
			<td><%=j.getMemno() %></td>
			<td><%=j.getMemid() %></td>
			<td><%=j.getMempw() %></td>
			<td><%=j.getMemtel() %></td>
			<td><%=j.getMememail() %></td>
			<td><%=j.getMemauth() %></td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>