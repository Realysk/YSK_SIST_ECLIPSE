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
	// 요청된 id값 받기...
 	String id = request.getParameter("id");
	// 요청값이 있으면 session값 설정하기..
	if(id!=null)session.setAttribute("id", id);
	// 세션값이 있으면 session 값으로 가져오기..
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
<body>
	<h2 align="center">메뉴1</h2>
	<%if(id!=null){ %>
	<h3 align="center">로그인 아이디:<%=id%></h3>
	<%} %>	
</body>
</html>


