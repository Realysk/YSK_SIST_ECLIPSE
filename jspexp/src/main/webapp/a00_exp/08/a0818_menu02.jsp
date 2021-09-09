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
	// 메뉴2는 session  기준으로 로딩..
 	String id = (String)session.getAttribute("id");
%>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
<body>
	<h2 align="center">메뉴2</h2>
	<%if(id!=null){ %>
	<h3 align="center">로그인 아이디:<%=id%></h3>
	<%} %>	
</body>
</html>