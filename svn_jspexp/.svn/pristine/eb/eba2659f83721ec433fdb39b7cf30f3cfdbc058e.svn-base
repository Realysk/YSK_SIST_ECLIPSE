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
	String sch = request.getParameter("sch");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("검색내용");
	});
</script>
<body>
	<h2 align="center"></h2>
	<%if(sch!=null){%>
	<h3 align="center">검색 내용:<%=sch%></h3>
	<%} %>
</body>
</html>
<%--
ex) 물건명:[   ] 가격:[    ] [구매] a03_main.jsp
	구매한물건은 @@@ 가격은 @@@ ==> jsp include 페이지에서 처리.(a04_sub.jsp)
	1조 메시지 전달, 전체(손들기)  

 --%>







