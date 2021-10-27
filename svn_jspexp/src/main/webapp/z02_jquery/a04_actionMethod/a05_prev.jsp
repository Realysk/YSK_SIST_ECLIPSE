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
		$("h2").text("prev() 예제").click(function(){
			$("p").prev(".selected").css("font-size","30px");
			$("p").prev().css("background","yellow");
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<div class="selected"><span>홍길동</span></div>
	<p class="selected">이순신</p>
	<p>유관순</p>
	<p>유관순</p>
	<span class="selected">강감찬</span>
	<p>이성계</p>
	<p>이성계</p>
	<p>이성계</p>

</body>
</html>