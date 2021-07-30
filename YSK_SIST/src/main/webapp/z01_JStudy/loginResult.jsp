<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 결과 화면창 </title>
</head>
<body>

<!--  
#form에서 보낸 데이터 받기
1. name을 이용해서 받기 :  ${param.userid}
2. 자바로 받기 : <h1>< %=request.getParameter("userid") %>님 환영합니다.</h1> 
< % > : 자바식 사용 (앞에는 붙여야하는데 주석이 안먹어서 띄워놈)
 -->
${param.userid}
<h1><%=request.getParameter("userid") %>님 환영합니다.</h1>

	<%
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		if(id.equals("smart") && pw.equals("1234")) { 
		
		%>	
			로그인 성공! 
			
	<% } else { %>  
			로그인 실패! 
	
	<% } %>
</body>
</html>