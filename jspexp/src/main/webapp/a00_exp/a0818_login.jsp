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
	});
</script>
<body>
	<h2 align="center">로그인</h2>
	<form id="frm01" method="post" action="a0818.jsp"><%-- 로그인 후, 초기 페이지로 이동 --%>
	<input type="hidden" name="page01" value="a0818_menu01.jsp"/><%--  메뉴는 menu01로 이동되게 hidden값 설정. --%>
	<table align="center" class="listTable">
		<tr><th>로그인아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="로그인"/></td></tr>
	</table>	
	</form>
</body>
</html>