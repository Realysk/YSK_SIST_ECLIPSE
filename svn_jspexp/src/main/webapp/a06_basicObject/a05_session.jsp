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
ex) session과 application 범위로 사원정보(아이디,패스워드,사원명,일반사용자,1000)와
	관리자정보(아이디, 패스워드,사원명,관리자,2000)을 설정하여, 다음화면(이동처리) a06_sessionScope.jsp
	에서 확인하세요.. 1조, 손들기(전원)  
--%>
<%
	session.setAttribute("emp", new Member("himan","7777","홍길동","일반사용자",1000));
	application.setAttribute("admin", new Member("higirl","8888","홍현정","관리자",2000));
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("session/application 저장");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">일반사용자</h3>
	<%
	Member mem = (Member)session.getAttribute("emp");
	if(mem!=null){
	%>
	<table  align="center" class="listTable">
		<tr><th>아이디</th><td><%=mem.getId() %></td></tr>
		<tr><th>패스워드</th><td><%=mem.getPass() %></td></tr>
		<tr><th>이름</th><td><%=mem.getName() %></td></tr>
		<tr><th>권한</th><td><%=mem.getAuth() %></td></tr>
		<tr><th>포인트</th><td><%=mem.getPoint() %></td></tr>
	</table>	
	<%}%>
	<h3 align="center">관리자</h3>
	<table  align="center" class="listTable">
		<tr><th>아이디</th><td>${admin.id}</td></tr>
		<tr><th>패스워드</th><td>${admin.pass}</td></tr>
		<tr><th>이름</th><td>${admin.name}</td></tr>
		<tr><th>권한</th><td>${admin.auth}</td></tr>
		<tr><th>포인트</th><td>${admin.point}</td></tr>
	</table>	
	<h3 align="center" onclick="location.href='a06_sessionScope.jsp'">session/application정보 확인</h3>
</body>
</html>