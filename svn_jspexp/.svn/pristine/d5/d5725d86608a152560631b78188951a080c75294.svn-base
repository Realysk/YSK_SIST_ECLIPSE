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
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 
구매물품:[   ] 구매가격[   ] 구매 갯수[    ]
--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>구매물품</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>구매갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
</body>
</html>