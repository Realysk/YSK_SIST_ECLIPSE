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
console.log("[그룹핏 등록] 유저세션 : " + userSession);
console.log("[그룹핏 등록] 유저그룹세션 : " + usrGrp);

$(document).ready(function(){
 	var xhr = new XMLHttpRequest();
	$("[name=wm_id], [name=gf_name], [name=gf_category], [name=gf_info]").on("click", function(event){
		if(event.keyCode==13){
			$("#show td").text("");
			var wm_idVal = $("[name=wm_id]").val();
			var gf_nameVal = $("[name=gf_name]").val();
			var gf_categoryVal = $("[name=gf_category]>option:selected").val();
			var gf_infoVal = $("[name=gf_info]").val();
			xhr.open("get","${path}/grpcrud.do?proc2=sch&wm_id="+wm_idVal+"&gf_name="+gf_nameVal+"&gf_category="+gf_categoryVal+"&gf_info="+gf_infoVal, true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var jTxt = xhr.responseText;
					if(jTxt!="{}"){
						var grp = JSON.parse(xhr.responseText);
						var show = "";
												
 						$("#show td").eq(0).text(grp.wm_id);
						$("#show td").eq(1).text(grp.gfname);
						$("#show td").eq(2).text(grp.gfcategory);
						$("#show td").eq(3).text(grp.gfinfo);
						
					}else{
						alert("해당 그룹핏의 정보가 존재하지 않습니다.");					
					}
				}
			};
			
		}
	});

	$("#regBtn").click(function(){
		if(confirm("그룹핏 등록을 완료하시겠습니까?")){
			$("[name=proc2]").val("ins");
			ajaxFun();
			location.href="${path}/schgrp.do";
		}
	});

 	function ajaxFun() {
		var snd = $("form").serialize();
		console.log(snd);
		xhr.open("get","${path}/grpcrud.do?"+snd,true);
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var jTxt = xhr.responseText;
				console.log(jTxt);
				var jData = JSON.parse(jTxt);
				alert(jData.result);
				var list = jData.list;
				console.log(list);
			}
		};			
	}
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
   
   <%-- 그룹핏 등록 화면 (등록 처리 프로세스 진행 후 마이페이지 '그룹핏 관리' 저장 - 실제 구현은 X) --%>
	
	<section style="margin-top:10%;">

	   		<div>
	   			<h3 style="text-align:center;">
	   				<span style="margin-right:10%;" class="side_menu2" onclick="location.href='GF006-add.jsp'"> 그룹핏 등록 </span>
	   				<span>|</span>
	   				<span style="margin-left:10%;" class="side_menu2" onclick="location.href='GF009-join.jsp'"> 그룹핏 검색 </span>
	   			</h3>
	   			<hr>
	   		</div>

	   		<h3 style="text-align:center;">
	   			<span style="margin-right:5%;" class="side_menu2"> 1. 이름 </span>
		   		<span style="margin-leftt:5%;" class="side_menu2"> 2. 유형 </span>
		   		<span style="margin-left:5%;" class="side_menu2"> 3. 소개 </span>
		   		<span style="margin-left:5%;" class="side_menu2"> 4. 등록 </span>
		   	</h3>
		   	<hr>
		   	
		   	<form method="post"><input type="hidden" name="proc2"/>
		   		
			  	<table id="show" align="center" width="1100px">
			  		<tr><td><input type="text" name="wm_id" value="${login_User}" style="margin:0px; width:280px; resize:none;" readonly/></td></tr>
			   		<tr>
				  		<td><input type="text" name="gf_name" placeholder="그룹핏 이름을 입력하세요." style="margin:0px; width:1164px; resize:none;"/></td>
				   		<td align="center">
 				   			<select name="gf_category" style="font-size:15px;">
				   				<option value="default"> 유형 선택 </option>
				   				<option value="친목"> 친목 </option>
				   				<option value="헬스"> 헬스 </option>
				   				<option value="정보공유"> 정보공유 </option>
			   				</select>
				   		</td>
			   		</tr>
			   		<tr>
						<td><input type="text" name="gf_info" placeholder="그룹핏 소개를 입력하세요." style="margin:0px; width:1164px; height:200px; resize:none;"/></td>
			   		</tr>
			   	</table>		   	

			   	<label>
		   			<input type="button" id="regBtn" value="등록" style="margin-right:10px;"/>
			   	</label>
				<label>
		   			<input type="reset" value="초기화" style="margin-right:10px;"/>				
				</label>
				
			</form>
			
	</section>
	
	<jsp:include page="/content/A_settings/main_footer.jsp"/>

</body>
</html>