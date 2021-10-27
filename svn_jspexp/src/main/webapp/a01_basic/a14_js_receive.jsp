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
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	%>
	<h2>js를 통해 넘겨온 물건명:<%=pname%></h2>
	<h2>js를 통해 넘겨온 물건명:<%=price%></h2>
	<h2>js를 통해 넘겨온 물건명:<%=cnt%></h2>
	<%
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String name = request.getParameter("name");
   String auth = request.getParameter("auth");
   %>
   <table>
      <tr><th>회원아이디</th><td><%=id%></td></tr>
      <tr><th>패스워드</th><td><%=pass%></td></tr>
      <tr><th>회원명</th><td><%=name%></td></tr>
      <tr><th>권한</th><td><%=auth%></td></tr>
   </table>	
	
	
</body>
</html>