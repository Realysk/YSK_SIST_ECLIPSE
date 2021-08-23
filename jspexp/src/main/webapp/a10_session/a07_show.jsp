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
		$("h2").text("${id}님 로그인중");
		$("#regBtn").click(function(){
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function(){
			$("[name=proc]").val("update");
			$("form").submit();
		});		
	});
	if("${id}"==""){
		alert("로그인이 필요합니다.\n로그인 페이지 이동")
		location.href="a06_login.jsp";
	}else{ 
		if("${param.proc}"=="insert") alert("등록처리수행");
		if("${param.proc}"=="update") alert("수정처리수행");
	}	
</script>
<body>
	<h2 align="center"></h2>
	<form method="post">
		<input type="hidden" name="proc"/>
	</form>
	<table align="center" class="listTable">
		<tr><td colspan="2" style="text-align:center" >
		<input type="button" id="regBtn" value="등록"/>
		<input type="button" id="uptBtn" value="수정"/></td></tr>
	</table>	
	
</body>
</html>