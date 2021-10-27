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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="forward 처리할 페이지";
	}
</script>
</head>
<%-- 
# jsp:forward
1. 해당 페이지로 요청값과 함께 이동 처리된다.
2. request 요청값은 함께 하여 이동 처리된다.
3. 기본 형식
	<jsp:forward page="이동할페이지"/>

--%>
<%
// a05_forwardAction.jsp?name=홍길동   를 통해 요청값도 함께 전송을 할 수 있다.
%>
<body>
	<h3 align="center"></h3>
	<jsp:forward page="a06_goPage01.jsp"></jsp:forward>	
	
</body>
</html>