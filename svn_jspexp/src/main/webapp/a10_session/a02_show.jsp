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

</head>
<%-- 
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("session값 확인");
	});
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>num02</th><td>${num02}</td></tr>
		<tr><th>prod</th><td>${prod.name},${prod.price},${prod.cnt}</td></tr>
		<tr><th>mlist</th>
			<td><%-- jstl의 반복문 --%>
				<c:forEach var="mem" items="${mlist}">
					${mem.id }, ${mem.auth}<br>
				</c:forEach>
			</td>
			</tr>
	</table>
	
</body>
</html>