<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
		document.querySelector("h3").innerText="반복문";
	};

</script>
</head>
<body>

	<h3></h3>
	<%for(int cnt=1; cnt<=10; cnt++) { %>
	<h4><%=cnt %>. 안녕하세요!! </h4>
	<% } %>
	
	<table>
		<%for(int cnt=1; cnt<=10; cnt++) { %>
		
		<tr><th><%=cnt %></th><td> 안녕하세요!! </td></tr>
		
		<% } %>
	</table>
	

	
</body>
</html>