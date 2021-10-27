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
		$("h2").text("시작");
		var auth = "${mem.auth}";
		if(auth==""){
			alert("로그인이 필요합니다");
			location.href="a05_bean_Login.jsp";
		}
		$("#adminBtn").click(function(){
			if(auth=="관리자"){
				alert("관리자 메뉴 처리!!")
			}else{
				alert("권한이 없으므로 처리 불가능합니다.!!")
			}
		});
		$("#norBtn").click(function(){
			alert("일반사용자 메뉴처리!!")
		});		
	});
</script>
<body>
	<h3  align="center" >현재 세션 내용</h3>
	<p align="center">
	<input type="button" value="관리자메뉴" id="adminBtn"/>
	<input type="button" value="일반사용자메뉴" id="norBtn"/>
	</p>
	<table  align="center" class="listTable">
		<tr><th>아이디</th><td>${mem.id}</td><th>패스워드</th><td>${mem.pass}</td></tr>
		<tr><th>이름</th><td>${mem.name}</td><th>권한</th><td>${mem.auth}</td></tr>
		<tr><th>포인트</th><td>${mem.point}</td><th></th><td></td></tr>
	</table>	
	<h3 align="center" onclick="location.href='a05_bean_Login.jsp'">로그아웃</h3>
	
</body>
</html>