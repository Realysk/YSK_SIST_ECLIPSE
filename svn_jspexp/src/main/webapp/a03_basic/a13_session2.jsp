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
		//$("h2").text("시작");
	});
</script>
</head>
<%-- 
# session2
1. session은 서버와 클라이언트 관계에서 발생한 데이터를
	서버에 저장하는 것이다.
2. 기본형식
	session.setAttribute("key","value");
3. 객체의 저장..	
	session.setAttribute("객체참조", new 객체());
   객체의 호출.
    (데이터유형)session.getAttribute("객체참조");
--%>
<%
	// session에 mem이라는 이름으로 저장처리..
	session.setAttribute("mem", 
				new Member("himan","7777","홍길동","관리자",1000));
%>
<body>
	<h2 align="center" onclick="location.href='a14_sessionVal.jsp'">페이지 이동</h2>
		
	
</body>
</html>