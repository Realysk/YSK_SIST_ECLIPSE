<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	ex)   a11_requestParam.jsp에 요청key name, age, loc를 넘기고,
	값을 받아, 화면에 이름 @@@, 나이 @@@, 사는 곳 @@@를 출력하세요.
	1조..
	 --%>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String loc = request.getParameter("loc");
	%>	 
	<h2>이름 : <%=name%>, 나이:<%= age %>, 사는 곳:<%=loc %></h2>
</body>
</html>