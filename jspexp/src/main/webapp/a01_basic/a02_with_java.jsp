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
		document.querySelector("h3").innerText="신상 명세서";
	};

</script>
</head>
<body>

	<%
		// script로 java 코드 선언 영역
		// java + html의 최종 결과를 client에 넘기고 그 넘긴 html을 브라우저에서 랜더링하기 때문에 java 코드를 확인할 수 없다.
		String name = "홍길동";
		int age = 25;
		String loc = "서울 신림동";
	%>

	<h3> 신상 명세서 </h3>
	<table>
		<tr><th> 이름 </th><th> 나이 </th><th> 거주지 </th></tr>
		<tr><td><%=name %></td><td><%=age %></td><td><%=loc %></td></tr>
	</table>
	
</body>
</html>