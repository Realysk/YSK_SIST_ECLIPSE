<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
%>
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
		document.querySelector("h3").innerText="시작!!";
	};

</script>
</head>
<body>

	<%
		ArrayList<String> list = new ArrayList<String>();
	%>

	<h3></h3>
	<table>
		<tr><th><%="타이틀" %></th></tr>
		<tr><td>${'내용'}</td></tr>
	</table>
	
</body>
</html>