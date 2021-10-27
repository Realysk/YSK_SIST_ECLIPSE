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
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}

	$(document).ready(function(){
		$("h2").text("메인화면");
		var auth = "${mem.auth}";
		$("#adminBtn").click(function(){
			if(auth=="관리자"){
				alert("관리자 기능 처리")
			}else{
				alert("권한이 없는 사용자입니다");
			}
		});
		$("#logOut").click(function(){
			if(confirm("로그아웃하시겠습니까?")){
				$("form").submit(); // 다시 controller에 요청값을 proc=logout 으로 전송
			}
		});
	});
</script>

</head>
<body>
	<form method="post"><input type="hidden" name="proc" value="logout"/></form>
	<h2 align="center"></h2>
	<h3 align="right">${mem.id}님 로그인 중
		<input type="button" value="로그아웃" id="logOut"/></h3>
	
	<input type="button" value="관리자기능 처리" id="adminBtn"/>
	<h3 align="center" onclick="location.href='<%=path%>/a04_basic/a06_main2.jsp'">
		페이지 이동</h3>

	
</body>
</html>