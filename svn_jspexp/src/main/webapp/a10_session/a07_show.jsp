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
	// 초기화면에 session id가 없으면 로그인하라고 뜨고..
	if("${id}"==""){
		alert("로그인이 필요합니다.\n로그인 페이지 이동")
		location.href="a06_login.jsp";
	}else{ 
		// session 값이 있을 때는 정상 프로세스 처리..
		// ${param.proc} == request.getParameter("proc")
		if("${param.proc}"=="insert") alert("등록처리수행");
		if("${param.proc}"=="update") alert("수정처리수행");
	}	
	$(document).ready(function(){
		// session 값은 el로 받아서 있을 때는 로그인 중..
		$("h2").text("${id}님 로그인중");
		// 기능 버튼을 클릭시,  insert/update 프로세스 처리
		$("#regBtn").click(function(){
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function(){
			$("[name=proc]").val("update");
			$("form").submit();
		});		
	});	
</script>
<body>
	<h2 align="center"></h2>
	<form method="post">
		<input type="hidden" name="proc"/>
	</form>
	<table align="center" class="listTable">
		<tr><td colspan="2" style="text-align:center" >
		<input type="button" id="regBtn" value="등록"/>
		<input type="button" id="uptBtn" value="수정"/></td></tr>
	</table>	
	
</body>
</html>