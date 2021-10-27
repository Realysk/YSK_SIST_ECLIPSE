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
		$("h2").text("MVC 연산");
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>첫번째숫자</th><td><input type="text" name="num01" value="${num01}"/></td></tr>
		<tr><th>두번째숫자</th><td><input type="text" name="num02" value="${num02}"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="합산"/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
				${num01} + ${num02} = ${sum} <%-- controller에서 넘겨준 값 request.setAttribute(....); --%>
			</td></tr>
	</table>	
	</form>
	
	
</body>
</html>