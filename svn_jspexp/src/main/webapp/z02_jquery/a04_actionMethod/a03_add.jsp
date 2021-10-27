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
# $("선택자").add("DOM객체")
1. 특정 DOM객체를 추가 처리..
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("클릭클릭").click(function(){
			// $("요소객체1").기능1().add("요소객체2").기능2("속성",속성값);
			// 요소객체1에는 기능1메서드, 기능2메서드 처리.
			// 요소객체2에는 기능2메서드만 적용.
			$("div").css("border","2px solid red").add("p").css("background","yellow");
		});
	});
</script>
<style>div{width:50px;height:50px;border:1px solid green;}</style>
<body>
	<h2 align="center"></h2>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<div></div>
	<p>추가 합니다.</p>
	
</body>
</html>