<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	%>
	<h2>아이디:<%=id %></h2>
	<h2>패스워드:<%=pass %></h2>
	<h2>이름:<%=name %></h2>
	<h2>나이:<%=age %></h2>
</body>
</html>