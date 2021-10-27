<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	var userSession = "${login_User}";
	var usrGrp = "${login_UsrGroup}";
	console.log("[그룹핏 검색] 유저세션 : " + userSession);
	console.log("[그룹핏 검색] 유저그룹세션 : " + usrGrp);

	$(document).ready(function() {
		
		grpSch();
	 		 	
		function grpSch() {
		 	var xhr = new XMLHttpRequest();
			$("#grpshow td").text("");
			var gf_nameVal = $("[name=gf_name]").val();
			var wm_idVal = $("[name=wm_id]").val();		
			xhr.open("get","${path}/schgrp.do?proc2=sch&gf_name="+gf_nameVal+"&wm_id="+wm_idVal, true);
			xhr.send();
			xhr.onreadystatechange=function() {
				if(xhr.readyState==4&&xhr.status==200) {
					var jTxt = xhr.responseText;
					if(jTxt!="{}") {
 						var grp = JSON.parse(xhr.responseText);
						var idx = 0;
						var show = "";
						$.each(grp, function(idx, gp) {
							console.log(grp);
							show += "<tr><td>"+(idx+1)+"</td><td>"+gp.gf_name+"</td><td>"+gp.gf_category+
									"</td><td>"+gp.wm_id+"</td><td>"+gp.gf_date+"</td></tr>";
						});
						
						$("#grpshow tbody").html(show);
												
					} else {
						alert("존재하지 않는 그룹핏입니다.");					
					}
				}
			};
		}
	 	
	 	
	 	$("[name=gf_name],[name=wm_id]").keyup(function(event) {
			if(event.keyCode==13) {
				grpSch();
		}
	});
});
</script>
<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
/* .side_menu2:hover {color: #A9BF9F;} */

:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;
    --beige--color: #D9B68B;
}

*,
*::befor,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

table {
    background-color: white;
    border-collapse: collapse;
    box-shadow: 0px 5px 10px var(--gray-300-color);
    overflow: hidden;
}

table thead {
    box-shadow: 0px 5px 10px var(--gray-300-color);
    background-color: var(--gray-150-color);
}

table thead td {
    padding: 1rem 2rem;
    letter-spacing: 0.1rem;
    font-size: 0.8rem;
    font-weight: 900;
}

table tbody td {
    padding: 1rem 2rem;
    font-size: 0.8rem;
    border-top:1px solid var(--gray-300-color);
}

table th:nth-child(odd){
    background-color: var(--gray-150-color);
    border-top:1px solid var(--gray-300-color);
}
	
.aside {
	position:absolute;
	width:15%;
	height:1000px;
	border-right:1px solid black;
	margin-top:5%;
	float:left;
}

.section {
	position:relative;
	left:18%;
	width:85%;
	height:100%;
	margin:0 auto;
	margin-top:5%;
	margin-bottom:10%;
	float:left;
}

.main-container {
	position:relative;
	width:80%;
	height:950px;
	margin:0 auto;
	border:1px solid black;
	border-radius:1px 1px 1px 1px;
}

.main-container div{
	width:100%;
	margin:0 auto;
	padding:5%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
}

.main-table, .sub-table {
	width:90%;
	border:1px solid black;
}

.main-table td{
	height:35px;
	border:1px solid black;
}

.tab-title {
	width:150px;
	padding:1%;
	text-align:center;
}

#btnTag{
	width:100px;
	height:100px;
	margin:0 auto;
	padding:1%;
	border:1px dotted black;
}

.sub-table td{
	height:40px;
	border:1px solid black;
}

.sub-table p{
	height:20px;
	margin:7px;
}

td{text-align:center;}

#usrID {
	color:#A9BF9F;	
}

:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;

    --point-bg-color: #f4f6fb;
    --point-font-color: #8C4D16;
    --point-bg2-color: #A9BF9F;
}

.section {
	position:relative;
	top:60px;
	width:100%;
	height:80%;
	margin:0 auto;
}

#img-container {
	width:100%;
	height:600px;
	margin:0 auto;
	text-align:center;
}

.footer {
	position:relative;
	width:100%;
	height:100px;
	color:var(--gray-500-color);
	text-align:center;
	padding-top:4%;
	padding-bottom:2%;
}

.footer p {
	font-size:10pt;
}
	
</style>
<body>

	<nav class="navbar">
		<div class="nav-wrapper">
		<ul class="logo">
			<li><a href="${path}/login.do">WANNAFIT</a></li>
		</ul>
		</div>
		
		<div class="menu-wrapper">
			<c:choose>
				<c:when test="${empty login_User || login_User == ''}">
				<form><input type="hidden" name="proc"/></form>
					<ul class="menu">
						<li><a href="${path}/content/user/UT001-Login.jsp">로그인</a></li>
						<li><a href="${path}/content/user/UT002-Sti.jsp">회원가입</a></li>
						<li><a href="#">워너핏 X 파트너</a></li>
					</ul>
				</c:when>
				<c:when test="${not empty login_User && login_User != ''}">
				<form><input type="hidden" name="proc"/></form>
					<ul class="menu">
						<li><span id="usrGroup">${login_UsrGroup}</span></li>
						<li><span id="usrID">${login_User}님</span></li>
						<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
				<c:choose>
					<c:when test="${not empty login_User and login_UsrGroup eq '일반회원'}">
						<li><a href="${path}/mamcrud.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '트레이너'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
				</c:choose>
					</ul>
				</c:when>
			</c:choose>
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
			<li><a href="${path}/content/mypage/minepit.jsp"><b>마인핏</b></a></li>
		</ul>
	</nav>
   
   <%-- 그룹핏 가입 - 검색 화면 --%>
	<section style="margin-top:10%;">
		   		<div>
	   			<h3 style="text-align:center;">
	   				<span style="margin-right:10%;" class="side_menu2" onclick="location.href='GF006-add.jsp'"> 그룹핏 등록 </span>
	   				<span>|</span>
	   				<span style="margin-left:10%;" class="side_menu2" onclick="location.href='GF009-join.jsp'"> 그룹핏 검색 </span>
	   			</h3>
	   			<hr>
	   		</div>
	   		<div>
	   			<h3 style="text-align:center;">
		   			<span style="margin-leftt:5%;" class="side_menu2"> 검색 </span>
		   			<span style="margin-leftt:5%;" class="side_menu2"><h5> 원하는 그룹핏을 검색하세요. </h5></span>
		   		</h3>
		   		<hr>
		   	</div>
		   	<div>
		   	<table align="center">
				<tr><th> 그룹핏 : </th><td><input type="text" name="gf_name" placeholder="그룹핏 이름을 입력하세요."/></td></tr>
				<tr><th> 리더 ID : </th><td><input type="text" name="wm_id" placeholder="검색할 ID를 입력하세요."/></td></tr>
		   	</table>
		   	<hr>
		   	</div>
		   	
			<input type="hidden" name="proc2"/>
			<table id="grpshow" align="center" width="100%" style="text-align:center" border>
				<col width="5%"><col width="60%"><col width="10%"><col width="10%"><col width="15%">
					<thead><tr><th> NO. </th><th> 그룹핏 </th><th> 카테고리 </th><th> 리더 </th><th> 생성일 </th></tr></thead>
					<tbody></tbody>
			</table>
			
			<div>
		   		<input type="button" value="그룹핏 등록" onclick="location.href='GF006-add.jsp'" style="margin-right:10px;"/>	   			
		   	</div>   	
	</section>
	
	<jsp:include page="/content/A_settings/main_footer.jsp"/>

</body>
</html>