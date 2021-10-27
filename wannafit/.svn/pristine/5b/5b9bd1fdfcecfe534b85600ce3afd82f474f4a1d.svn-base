<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
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

<!-- 섹션 위치 잡는 거 참고용!! -->
<style type="text/css">

.section {
	position:relative;
	top:60px;
	width:100%;
	height:80%;
	margin:0 auto;
}

.main-container {
	width:620px;
	height:500px;
	margin:0 auto;
}

.section div {
	padding:30px;
}

.member-stipulation div {
	border:1px solid #D8D9D7;
	padding:20px;
	margin:0 auto;
	text-align:center;
}

.member-stipulation form {
	padding:20px 5px 40px 5px;
}



</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script src="${path}/content/user/cookies.js" type="text/javascript"></script> 
<script type="text/javascript">

var userSession = "${login_User}";
var usrGrp = "${login_UsrGroup}";
console.log("[약관] 유저세션 : " + userSession);
console.log("[Main] 유저그룹세션 : " + usrGrp);

// 일반회원 회원가입이므로 세션이 비어있어야함
if(usrGrp != ""){
	alert("비회원만 가능한 서비스입니다.");
	history.back(-1);
}

var ckNum = getCookie("isCon");
console.log("초기 휴대폰 쿠키값 " + ckNum);

setCookie("isCon",0,1);
console.log("인증쿠키값 : " + getCookie("isCon"));

	
	$(document).ready(function(){
		
		var procC = $("[name=proc]").val();
		console.log("[약관] proc : " + procC);
		
		// 인증완료
		if(ckNum == 1){
			ckNum = setCookie("isCon",2,1);
			$("[name=proc]").val("인증완료");
			$("form").submit();
			consol.log("proc 변경완료");
		}
		
		
		$("#btnCofirm").click(function(){
			var isCk = $("[name=isAgree]:checked").val();
			
			
			ckNum = getCookie("isCon");
			console.log("클릭후 휴대폰 쿠키값 " + ckNum);
	
			
			// 윈도우창에서 휴대폰인증 후 쿠키값을 이용해 다음 페이지로 이동
			if(isCk == "동의" && ckNum == 0) {
				var confirm = window.open("${path}/content/user/UT003-Confirm.jsp", 
						"get", "width = 450, height = 350");
			} else if(isCk == "비동의"){
				alert("회원약관에 동의해주세요");
			} else {
				alert("이미 휴대폰인증을 했습니다");
			}
			
			console.log();
		});
	});

</script>
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
			<li><a href="${path}/login.do?proc=로그인">로그인</a></li>
			<li><a href="${path}/join.do?proc=회원가입">회원가입</a></li>
			<li><a>워너핏 X 파트너</a></li>
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
		<li><a href="${path}/content/mypage/minepit.jsp"><b>마인핏</b></a></li>
	</ul>
</nav>
<section class="section">
	<div class="main-container">
		<div class="member-stipulation">
			<h3> 회원가입 </h3>
			<div>
				<p> (주)워너핏(이하 '회사')은 회원님의 개인정보를 중요시하며, 개인정보의 보호와 관련하여 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보 보호법, 전기통신사업법, 통신비밀보호법 등 개인정보와 관련된 법령 상의 개인정보 보호 규정 및 방송통신위원회가 제정한 개인정보보호지침을 준수하고 있습니다.
회사는 개인정보취급방침을 통하여 회원님들의 개인정보가 남용되거나 유출되지 않도록 최선을 다할 것이며, 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있고, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드리고자 합니다.
단, 본 개인정보 취급방침은 정부의 법령 및 지침의 변경, 또는 보다 나은 서비스의 제공을 위하여 그 내용이 변경될 수 있으니, 회원님들께서는 사이트 방문 시 수시로 그 내용을 확인하여 주시기 바라며, 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. </p>
			</div>
			<form>
				<input type="hidden" name="proc"/>
				<input type="radio" name="isAgree" value="비동의" checked/>약관에 동의하지 않습니다
				<input type="radio" name="isAgree" value="동의"/>약관에 동의합니다
			</form>
			<div>
				<h3> 휴대폰 번호 인증</h3>
				<p> 원활한 서비스 제공을 위해 <br> 휴대폰 번호 인증이 필요합니다 </p>
				<input type="button" id="btnCofirm" value="휴대폰 인증"/>
			</div>
		</div>	
	</div>
<span id="data01"></span>		
</section>


</body>
</html>