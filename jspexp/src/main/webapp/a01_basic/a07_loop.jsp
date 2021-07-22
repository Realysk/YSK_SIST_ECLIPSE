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
		document.querySelector("h3").innerText="반복문 예제";
	};

</script>
</head>
<body>

	<%-- 
		a07_loop.jsp
		
		h5, select option(반복), ul li(반복), input, table tr td에 해당 요소객체에 반복문을 활용하여 출력하세요. 
	--%>

	<h3></h3>
	<table>
		<tr><th><%="타이틀" %></th></tr>
		<tr><td>${'내용'}</td></tr>
	</table>
	
</body>
</html>