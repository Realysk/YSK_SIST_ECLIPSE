<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 요청값에 대한 한글 encoding  처리
	String path = request.getContextPath(); 
	// 기준 경로 설정.\jspexp\src\main\webapp
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--외부 css 설정 호출.. --%>
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
	<h3></h3>
	<table>
		<tr><th><%="타이틀" %></th></tr>
		<tr><th>${'에러발생은 아니고, validation 처리'}</th></tr>
	</table>
</body>
</html>