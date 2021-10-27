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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	//브라우저에 있는 쿠키를 서버단에 request를 통해서 보내서 확인하게..
	Cookie[] cks =request.getCookies();
%>
<body>
	<h3 align="center"></h3>
	<table class="listTable">
		<%for(Cookie c:cks){%>
		<tr><th><%=c.getName() %></th><td><%=c.getValue() %></td></tr>
		<%}%>
	</table>	
	
</body>
</html>