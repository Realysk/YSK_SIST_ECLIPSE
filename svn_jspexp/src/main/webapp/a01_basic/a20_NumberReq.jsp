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
<title>Insert title here</title>
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="숫자형 데이터 처리";
	}
</script>
</head>
<body>
	<h3 align="center"></h3>
	<form id="frm01" action="a21_numRev.jsp">
	<table>
		<tr><th>첫번째 숫자</th><td><input type="text" name="num01" value=""/></td></tr>
		<tr><th>두번째 숫자</th><td><input type="text" name="num02" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="합산"/></td></tr>
	</table>	
	</form>
</body>
</html>