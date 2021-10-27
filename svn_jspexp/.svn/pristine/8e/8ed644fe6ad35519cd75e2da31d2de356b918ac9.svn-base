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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="쿠키 생성(생성된 쿠키 확인)";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	Cookie c1 = new Cookie("pname","apple");
	Cookie c2 = new Cookie("price","3000");
	Cookie c3 = new Cookie("cnt","2");
	response.addCookie(c1);
	response.addCookie(c2);
	response.addCookie(c3);
%>
<body>
	<h3 onclick="location.href='a12_prodCookie.jsp'"  align="center"></h3>
		
	
</body>
</html>