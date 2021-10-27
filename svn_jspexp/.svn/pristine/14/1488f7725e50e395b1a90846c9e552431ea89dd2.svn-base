<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="jspexp.a01_start.A02_Entertainer"    
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="연예인!";
	};

</script>
</head>
<body>
<%
A02_Entertainer en = new A02_Entertainer("유재석","1972/8/14","MC");
%>
	<h3></h3>
	<table>
		<tr><th>이름</th><td><%=en.getName() %></td></tr>
		<tr><th>생년월일</th><td><%=en.getBirthdate() %></td></tr>
		<tr><th>분야</th><td><%=en.getPart()%></td></tr>
	</table>
</body>
</html>