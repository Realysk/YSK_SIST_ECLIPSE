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
		$("h2").text("구구단");
	});
</script>
</head>
<%-- 
# 
 [   ] X [   ] 정답 :[   ] [확인]
--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" width="50%" class="listTable">
		<tr><th><input type="text" name="grade" size="1" value="${grade}"/>
				X
				<input type="text" name="cnt" size="1" value="${cnt}"/>
			</th></tr>
			<tr><%-- controller에서 넘겨준 데이터 --%>
			<td  style="text-align:center" ><input type="text" name="inReply" size="2" value="0"/></td></tr>
		<tr><td style="text-align:center" ><input type="submit" value="확인"/></td></tr>
	</table>	
	</form>
</body>
</html>