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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# jsp의 기본 객체..
1. jsp는 변수들을 저장할 때, 특정한 범위로 처리할 수 있다.
	(page 범위, 시간 -session time, 브라우저와 서버 관계, 서버)
	cf) java - 데이터유형과 메모리의 크기 ==> jsp - 데이터유형 + 시간과 페이지 범위
	ex) 로그인한 후, DB접속 후, 가진 Member정보를 웹 페이지마다 가지고 있어서
		각 페이지마다 접근 권한을 활용할거나 로그인 유지 처리에 필요한 범위 - session
2. 범위 내용
	pageContext(page), request(요청), session(세션), application(서버) 
3. 사용방법
	.setAttribute("키", "값");
	.getAttribute("키");  해다 키를 가져온다.
--%>
<%
	session.setAttribute("id", "하이맨");
%>
<body>
	<h3 align="center"></h3>
	<a href="a02_session.jsp">세션범위 확인</a>	
	
</body>
</html>