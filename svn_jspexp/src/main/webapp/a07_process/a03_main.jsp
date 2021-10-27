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
		$("h2").text("include 액션 태그 연습");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	<%-- jsp:include 지시자에 의해 분리되더라도 query은 공유되기에 js코드에 신경써야 한다. --%>
	<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	if(pname!=null){
	%>
	<jsp:include page="a04_sub.jsp">
		<jsp:param value="<%=pname %>" name="pname"/>
		<jsp:param value="<%=price %>" name="price"/>
	</jsp:include>
	<%}%>
</body>
</html>