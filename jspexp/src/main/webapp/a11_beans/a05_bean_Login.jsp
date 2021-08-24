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
#  ex) 로그인 화면 구성해서, bean으로 요청값을 받아 dao를 호출하여 데이터가 있으면 
	session bean에 등록되게 처리하세요..~~ 2조..전체(손들기)

--%>
<jsp:useBean id="mem" class="jspexp.z02_vo.Member" scope="session"/>
<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao" scope="session"/>
<jsp:setProperty property="*" name="mem"/>
<%
	
if(mem.getId()!=null){
	log(mem.getId()+":"+ mem.getPass());
	// 요청값으로 받아서 bean에 데이터를 담은 후.. mem에 할당 처리..
	mem = dao.login2(mem.getId(), mem.getPass());
	session.setAttribute("mem",mem);
}
%>
<script type="text/javascript">
	var name = "${mem.name}";
	if(name!=""){
		alert(name+"님 로그인 성공\n세션설정");
	}
	$(document).ready(function(){
		$("h2").text("로그인(bean)");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="로그인"/></td></tr>
	</table>	
	</form>
	<h3  align="center" >현재 세션 내용</h3>
	<h3 align="center" onclick="location.href='a06_showSession.jsp'">다른 페이지에서 session 확인</h3>
	<table  align="center" class="listTable">
		<tr><th>아이디</th><td>${mem.id}</td><th>패스워드</th><td>${mem.pass}</td></tr>
		<tr><th>이름</th><td>${mem.name}</td><th>권한</th><td>${mem.auth}</td></tr>
		<tr><th>포인트</th><td>${mem.point}</td><th></th><td></td></tr>
	</table>	
	
</body>
</html>