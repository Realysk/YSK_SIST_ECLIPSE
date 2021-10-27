<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"   
    import = "wannafit.content.schedule.*"
    import = "wannafit.content.vo.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value ="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<link rel="stylesheet" href="${path}/content/A_settings/schedule.css">
<style>
.btn {
width: 10%;
font-size: 3px;
margin-left:300px;
background :#6C7EAA;
border-radius: 5px;
text-color :white;
float:center;
}
</style>
<script type="text/javascript">

</script>
</head>
<%-- 
# 

--%>
<%
String display = request.getParameter("param");
String Snum = display;
if(Snum ==null) Snum = "";

%>


<%
ScheduleDao dao = new ScheduleDao();
ArrayList<Schedule> ScheduleList = dao.getSchedule(Snum);
%>
<body>

	<nav class="navbar">
		<div class="nav-wrapper">
		<ul class="logo">
			<li><a href="${path}/login.do">WANNAFIT</a></li>
		</ul>
		</div>
	    
		<div class="menu-wrapper">
		<form><input type="hidden" name="proc"/></form>
				<ul class="menu">
				<li><span id="usrGroup">${login_UsrGroup}</span></li>
				<li><span id="usrID">${login_User}님</span></li>
				<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
				<!--  조건문으로 각 회원별 마이페이지 연결 -->
				
				<c:choose>
					<c:when test="${not empty login_User and login_UsrGroup eq '일반회원'}">
						<li><a href="${path}/mamcrud.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '트레이너'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '기업'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
				</c:choose>
				
				</ul>
		</div>
	</nav>
	
	
	<nav class="navar1-1">
		<div><b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b></div>
	</nav>
  
	<nav class="navbar2">
		<ul class="side_menu1">
			<li><a href="${path}/content/mapfit/wfmap01.jsp"><b>맵핏</b></a></li>
			<li><a href="${path}/reserve.do"><b>예약</b></a></li>
			<li><a href="${path}/schgrp.do"><b>그룹핏</b></a></li>
			<li><a href="${path}/funding.do"><b>펀인핏</b></a></li>
			<li><a href="${path}/minepit.jsp"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
<%if(Snum!=null) { %>
	<form method = "post">
	<table>
	<%for(Schedule s:ScheduleList) {%>
		<tr><td>제목</td><td><%=s.getTitle()%></td></tr>
		<tr><td>해야할일1</td><td><%=s.getWork1()%></td></tr>
		<tr><td>해야할일2</td><td><%=s.getWork2()%></td></tr>
		<tr><td>해야할일3</td><td><%=s.getWork3()%></td></tr>
		<tr><td>해야할일4</td><td><%=s.getWork4()%></td></tr>
		<tr><td>날짜</td><td><%=s.getDate()%></td></tr>
		<tr><td>댓글</td><td><%=s.getComment()%></td></tr>
		<%} %>	
		<%} %>
	</table>
		<h3><input type ="button" class ="btn" value ="일정 신규 등록" onclick ="change()"/></h3>
	</form>
</body>
	<script type="text/javascript">
	function change(){
    window.open("a02_scheduler.jsp","popupView","width=350 height=350"); 
}
	</script>
</html>