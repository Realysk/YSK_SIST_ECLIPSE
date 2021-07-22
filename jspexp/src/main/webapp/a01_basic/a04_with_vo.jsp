<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a01_start.A01_Movie"
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
		document.querySelector("h3").innerText="최신 영화";
	};

</script>
</head>
<body>

<%
	A01_Movie m = new A01_Movie("블랙 위도우", 2289583, "2021.07.07");
%>

	<h3></h3>
	<table>
		<tr><th> 제목 </th><td><%=m.getTitle() %></td></tr>
		<tr><th> 관객 수 </th><td><%=m.getVisitCnt() %></td></tr>
		<tr><th> 개봉일 </th><td><%=m.getOpenDate() %></td></tr>
	</table>
	
</body>
</html>