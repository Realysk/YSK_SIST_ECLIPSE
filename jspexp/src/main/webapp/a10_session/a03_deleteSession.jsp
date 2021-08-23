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

<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("세션삭제");
	});
</script>
<body>
	<h2 align="center"></h2>
<%
// 1. 세션의 설정
session.setAttribute("num01", 25);
session.setAttribute("num02", 5);
session.setAttribute("num03", 10);
%>


	<table  align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01 }</td></tr>
		<tr><th>세션값2</th><td>${num02 }</td></tr>
<%
// 2. 세션의 삭제
session.removeAttribute("num02");
session.setMaxInactiveInterval(10); // 10초로 처리함..
%>		
		<tr><th>세션값2(세션값 삭제)</th><td>${num02 }</td></tr>
		<tr><th id="ckSession">세션값3(세션값 삭제)</th><td>${num03 }</td></tr>
	</table>	
<script type="text/javascript">
	$("#ckSession").click(function(){
		location.href="a03_show.jsp";
	});
</script>	
</body>
</html>