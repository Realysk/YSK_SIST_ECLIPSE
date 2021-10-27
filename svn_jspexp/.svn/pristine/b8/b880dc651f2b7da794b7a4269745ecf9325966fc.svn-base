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
5. [jsp] <jsp:forward>를 활용하여 물건명과 가격, 갯수를 입력하여 결과페이지(물건명,계)를 출력하세요.

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("구매정보");
	});
</script>
<body>
<% 
	String name = request.getParameter("name");
	if(name!=null){
%>
		<jsp:forward page="a0818_3.jsp"/>
<%}%>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
</body>
</html>