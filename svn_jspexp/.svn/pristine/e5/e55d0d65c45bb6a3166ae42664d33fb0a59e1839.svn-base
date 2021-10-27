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
		$("h2").text("VIP 페이지");
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${pname}</td></tr>
		<tr><th>가격</th><td>${price}</td></tr>
		<tr><th>갯수</th><td>${cnt}</td></tr>
		<tr><th>총비용</th><td>${price*cnt}</td></tr>
		<tr><th>할인후금액</th><td>${tot} (${disratio} %)</td></tr>
	</table>	
	
</body>
</html>