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
	session bean에 등록되게 처리하세요..~~ 
1. 프로세스
	1) form 화면에서 id, pass값을 입력한 후,
	2) 입력된 id, pass을 받아서 데이터 처리를 하고,
	3) 해당 데이터가 있으면 session을 처리한다.

2. 구현순서
	1) form 화면 구성
		[name=id], [name=pass]
	2) form화면에 name값에 해당하는 property가 있는 VO 객체 만들기
		setId(), setPass()
	3) 초기화면과	입력 후, 요청값이 있는 것을 구분
	4) setProperty property="*"을 통해서 전체 요청값을 vo객체에 할당
	5) 데이터 있는지 여부에 따른 session.setAttribute()를 선언 활용

--%>

<%-- 페이지 범위로 dao와 요청값 받은 Member 객체를 선언 --%>
<jsp:useBean id="mem" class="jspexp.z02_vo.Member" />
<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao" />
<jsp:setProperty property="*" name="mem"/>
<%
	
if(mem.getId()!=null){ // 요청값이 있는 경우..(초기/요청화면 구분)
	log(mem.getId()+":"+ mem.getPass());
	// 요청값으로 받아서 bean에 데이터를 담은 후.. mem에 할당 처리..
	mem = dao.login2(mem.getId(), mem.getPass());
	// 인증이 되었을 때, session 값을 설정 처리해 준다.
	if(mem!=null)
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