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
		$("#run").click(function(){
			$(":animated").toggleClass("toggleCls"); 
			
			
			// toggleClass() 클래스 적용/미적용 반복
		});
		function animateIt(){
			// 첫번째와 세번째 요소객체 선택. 
			$("div:eq(0), div:eq(2)").slideToggle("slow",animateIt); // 재귀적 호출...
		}
		animateIt();		
	});
</script>
</head>
<style>
	div{
		background:blue;border:1px solid red;
		width:70px;height:70px;margin:0 3px;
	}
	.toggleCls{width:10px;height:10px;}
</style>
<body>
	<h2 align="center"></h2>
	<button id="run">실행</button>
	<div></div>
	<div></div>
	<div></div>	
	
</body>
</html>