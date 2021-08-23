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
		$("h2").text("세션값 확인");
	});
</script>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>세션값1</th><td>${num01 }</td></tr>
		<tr><th>세션값2</th><td>${num02 }</td></tr>	
		<tr><th>세션값3</th><td>${num03 }</td></tr>
		<tr><th colspan="2" id='ckSession'>
			세션값 설정</td></tr>
	</table>		
<script type="text/javascript">
	$("#ckSession").click(function(){
		var num03 = "${num03}";
		if(num03==""){
			alert("세션이 종료되었습니다.\n세션설정페이지 이동");
			location.href="a03_deleteSession.jsp";
		}
	});
	// ex) id:[  ] [로그인] 해당 아이디로 로그인했을 때, session을 설정(5초)하고(a06_login.jsp),
	//     페이지를 이동(a07_show.jsp) ###님 로그인중 처리한 후, 기능버튼(등록)을 클릭시, 
	//     시간전에는 기능수행 alert(), 시간이 지나면 로그인을 하게 처리 - 3조, 전체(손)
	
</script>		
</body>
</html>