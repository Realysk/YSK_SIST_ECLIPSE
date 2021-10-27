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
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}

	$(document).ready(function(){
		$("h2").text("정답페이지");
	});
</script>
</head>
<%-- 
# a00_exp\a0809_result.jsp

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>입력한 내용</th></tr>
		<%-- 입력한 요청값은 el 태그를 활용해서 param.XXX 형식을 처리가 가능하다. --%>
		<tr><th>${param.grade} X ${param.cnt} = ${param.inReply}</th></tr>
	</table>	
	
</body>
</html>