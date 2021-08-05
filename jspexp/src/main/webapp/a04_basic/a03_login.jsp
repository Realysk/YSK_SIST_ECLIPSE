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
		$("h2").text("로그인");
	});
</script>
</head>
<%-- 
# 
webapp\a04_basic\a03_login.jsp
--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post"><%-- action이 설정되지 않으면
	현재 페이지를 호출한 controller를 호출한다. --%>
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="로그인"/></td></tr>
	</table>	
	</form>

	
</body>
</html>