<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"  
    isErrorPage="true"  
    %>
<%	//  isErrorPage="true"  로 설정되어야지 exception 객체를 활용할 수 있다.
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
		$("h2").text("에러발생했습니다!!");
	});
</script>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>에러내용</th><td><%=exception.getMessage() %></td></tr>
		<tr><th>처리방법</th><td>데이터가 없거나 객체 생성이 되어 있지 않습니다!</td></tr>
	</table>	
</body>
</html>