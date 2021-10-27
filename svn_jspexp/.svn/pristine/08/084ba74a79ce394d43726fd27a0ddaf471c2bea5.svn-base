<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 

--%>
<%
Student stu=(Student)session.getAttribute("stu");

%>
<body>
	<h2 align="center" >학생 session</h2>
	<table width="60%" align="center" class="listTable">
		<tr><th>이름</th><td><%=stu.getName() %></td></tr>
		<tr><th>국어</th><td><%=stu.getKor() %></td></tr>
		<tr><th>영어</th><td><%=stu.getEng() %></td></tr>
		<tr><th>수학</th><td><%=stu.getMath() %></td></tr>
	</table>	
	
</body>
</html>