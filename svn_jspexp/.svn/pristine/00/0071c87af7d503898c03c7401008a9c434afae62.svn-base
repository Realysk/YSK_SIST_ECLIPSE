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
	// 숫자 데이터는 Wrapper 클래스로 가져올 수 있다..unboxing
	int point = (Integer)session.getAttribute("point");
	point -= 20;
	session.setAttribute("point", point); // 차감후, session 값으로 할당..
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("구매페이지2!!(20차감)");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">구매 후 현재 포인트 :<%=point%></h3>
	<h3 align="center" onclick="location.href='a0813_buy1.jsp'">구매페이지1</h3>
	<h3 align="center" onclick="location.href='a0813.jsp'">초기포인트설정</h3>
	
	
</body>
</html>