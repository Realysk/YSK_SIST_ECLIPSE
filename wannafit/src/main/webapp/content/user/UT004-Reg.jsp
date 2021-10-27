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
	width:100%;
	height:100%;
	margin:0 auto;
	margin-top:100px;
	margin-bottom:80px;
}

.main-container {
	background:white;
}

#reg-table {
	width:600px;
	padding:30px 30px 30px 40px;
	
}

#reg-table thead td{
	height:40px;
	border:1px solid var(--gray-500-color);
}

#reg-table tbody td{
	height:40px;
	padding:2%;
	border-bottom:1px solid var(--gray-300-color);
}

#reg-table tbody td:nth-child(odd){
	height:40px;
	border-right:1px solid var(--gray-300-color);
}

#reg-choice {
	padding-top:40px;
}

#reg-table span{
	font-size:10px;
	color:red;
}

/* modal 속성 */
.modal_wrap{
	display: none;
	width: 500px;
	height: 500px;
	position: absolute;
	top:50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background:#eee;
	z-index: 2;
}

.black_bg{
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 1000px;
	background-color:rgba(0, 0,0, 0.5);
	top:0;
	left: 0;
	z-index: 1;
}

.modal_close{
	width: 26px;
	height: 26px;
	position: absolute;
	top: 10px;
	right:10px;
}

.modal_close> a{
	display: block;
	width: 100%;
	height: 100%;
	background:url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.modal_content {
	margin:0 auto;
	text-align:center;
}

#use {
	display:none;
}

.comInfo {
	font-weight: 600;
}


</style>
</head>
<script src="${path}/content/user/cookies.js" type="text/javascript"></script> 
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

// 관심운동은 선택사항이므로 선택하지않아도 넘어가도록 함
function interested() {
	var sptAll = $("[name=wm_sport]").length;
	var sptCk = $("[name=wm_sport]");
	var spt_count = 0;
	
	for(var i = 0; i < sptAll; i++){
		if(sptCk[i].checked) {
			spt_count++;
		}			
	}
	console.log(spt_count);
}

	$(document).ready(function(){
		
		// modal 숨김
		$("#modalClose").click(function(){
			$(".modal_wrap").css("display", "none");
			$(".black_bg").css("display", "none");
		});
			
		// 인증완료된 휴대폰번호값을 가져옴 
		var tel = getCookie("tel");
		console.log("전화번호 : " + tel);
		$("[name=wm_tel]").val(tel);
		
		// 필수정보 입력 완료 확인
		var in_id01 = false;
		var in_pass02 = false;
		var in_nick03 = false;
		var in_email04 = false;
		var in_tel05 = false;
	

		// 아이디, 닉네임 중복체크 확인
		var isIdCkVal = false;
		var isNickCkVal = false;
		
		$("#btnIdCk").click(function(){
			var tdText = $("#reg-table td").eq(1).text();
			var inTxt = $("[name=wm_id]").val();
			var isResult = "";
			console.log(tdText); console.log(inTxt);
			
			if(inTxt == ""){	// 입력값 확인  
				$("#idCkText").html("<br>" + tdText + "를 입력하세요").css("color", "red");
			} else {
				var idrule = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성검사
	
				if(tdText == "아이디"){
					if(inTxt.charAt(0) < 'A' || inTxt.charAt(0) > 'z') {
						$("#idCkText").html("<br>첫글자는 영문자입니다").css("color", "red");
					} else if (inTxt.length < 6 || inTxt.length > 12) {
						$("#idCkText").html("<br>글자수는 6~12자입니다").css("color", "red");
					} else if (!idrule.test(inTxt)) {
						$("#idCkText").html("<br>영+숫자로 작성해주세요").css("color", "red");	
					} else {
						
						var xhr = new XMLHttpRequest();
						xhr.open("get", "${path}/infoCk.do?proc=아이디중복확인&wm_id=" + inTxt, true);
						xhr.send();
						xhr.onreadystatechange = function(){
							if(xhr.readyState == 4 && xhr.status == 200) {
								isResult = xhr.responseText;
								console.log(isResult);

								if(isResult == "true"){
									$("h3").text("중복된 아이디입니다");
									$("#use").css("display", "none");
									$("[name=wm_id]").focus();
								} else {
									$("h3").text("사용가능한 아이디입니다");
									$("#use").css("display", "block").click(function(){
										isIdCkVal = true;
										$("#modalClose").click();
									});
								}
							}
						};
						$(".modal_wrap").css("display", "block");
						$(".black_bg").css("display", "block");
					
						if(isResult == "false" && isIdCkVal) {
							in_id01 = true;
							$("#idCkText").html("");
						}
					}
				}
			}
		});
		
		$("#btnNickCk").click(function(){
			var tdText = $("#reg-table td").eq(7).text();
			var inTxt =$("[name=wm_nick]").val();
			var isResult = "";
			
			if(inTxt == ""){	// 입력값 확인  
				$("#nickCkText").html("<br>" + tdText + "을 입력하세요").css("color", "red");
			} else {
				var nickrule = /[~!@#$%^&*()_+|<>?:{}]/;
				
				if(inTxt.length < 2 || inTxt.length > 12) {
					$("#nickCkText").html("<br>닉네임의 길이는 2~12자입니다").css("color", "red");
				} else if(nickrule.test(inTxt)){
					$("#nickCkText").html("<br>닉네임에 특수문자가 있습니다").css("color", "red");
				} else {
					var xhr = new XMLHttpRequest();
					xhr.open("get", "${path}/infoCk.do?proc=닉네임중복확인&wm_nick=" + inTxt, true);
					xhr.send();
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200) {
							var isResult = xhr.responseText;
							
							if(isResult == "true"){
								$("h3").text("중복된 " + tdText +"입니다");
								$("#use").css("display", "none");
								$("[name=wm_nick]").focus();
							} else {
								$("h3").text("사용가능한 " + tdText + "입니다");
								$("#use").css("display", "block").click(function(){
									isNickCkVal = true;
									$("#modalClose").click();
								});
							}
						}
					};	
					$(".modal_wrap").css("display", "block");
					$(".black_bg").css("display", "block");
					
					if(isResult == "false" && isNickCkVal) {
						in_nick03 = true;
						$("#nickCkText").html("");
					}
				}
			}
		});

		// 필수정보 입력
		$("[name=wm_pass], [name=wm_pass_re], [name=wm_email_id]").blur(function(){
			var tdText = $(this).parent().prev("td").text();
			var ckVal = $(this).val();
			
			// 입력값 확인 
			if(ckVal == ""){	
				$(event.target).parent().find("span").html("<br>" + tdText + "을(를) 입력하세요").css("color", "red");
			} else {
				var passrule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/; // 유효성검사
				var idrule = /^[a-zA-Z0-9]{6,12}$/;
				
				if (tdText == "비밀번호") {
					if(ckVal.length < 8 || ckVal.length > 20){
						$(event.target).parent().find("span").html("<br>글자수는 8~20자입니다").css("color", "red");
					} else if(!passrule.test(ckVal)) {
						$(event.target).parent().find("span").html("<br>영+숫자+특수문자로 작성해주세요").css("color", "red");
					} else {
						$(event.target).parent().find("span").html(""); 
					}	
				} else if(tdText == "비밀번호 확인") {
					if($("[name=wm_pass]").val() != ckVal){
						$(event.target).parent().find("span").html("<br>비밀번호가 일치하지 않습니다").css("color", "red");
					} else {
						in_pass02 = true;
						$(event.target).parent().find("span").html("");
					}
				
				} else if (tdText = "이메일") {
					if(!idrule.test(ckVal)){
						$(event.target).parent().find("span").html("<br>아이디는 특수문자는 불가능합니다").css("color", "red");
					} else if(ckVal.length < 6 || ckVal.length > 12) {
						$(event.target).parent().find("span").html("<br>아이디의 길이는 6~12자입니다").css("color", "red");
					} else {
						$(event.target).parent().find("span").html("");
					}
				}
			}
		});
		
		
		// 이메일 형식 선택
		$("[name=email-select]").change(function(){	
			var emailrule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z].{2,3}$/;
			var secVar = $(this).val();
			
			// 이메일 형식 중 직접입력이 아닐 경우 선택사항의 이메일주소 적용
			if(secVar != "직접입력") {
				$("[name=wm_email_addr]").val(secVar);
			} else { 
				// 직접입력일 경우 포커스를 해당 주소입력창에 넘기고 
				$("[name=wm_email_addr]").val("");
				$("[name=wm_email_addr]").focus();
				
				// 포커스를 벗어날 때 빈칸일 경우 이메일 주소를 입력 경고
				$("[name=wm_email_addr]").blur(function(){
					var emAdrVal = $("[name=wm_email_addr]").val();
					
					if(emAdrVal == "") {
						$(event.target).parent().find("span").html("<br>이메일 주소를 입력하세요").css("color", "red");;
						//$(event.target).focus(); 
					} else {
						if(!emailrule.test(emAdrVal)) {
							$(event.target).parent().find("span").html("<br>이메일 주소형식이 맞지않습니다");
						} else {
							$(event.target).parent().find("span").html("");
						}
					}
				});
			}
		});
		
		// 이메일 형식 유효성 체크 
		$("[name=email-select]").blur(function(){		
			var tdText = $(this).parent().prev("td").text();
			var secVar = $(this).val();
			
			if(secVar == 0){
				$(event.target).parent().find("span").html("<br>" + tdText + "를 선택하세요").css("color", "red");
			} else {
				$(event.target).parent().find("span").text("");
			}
		});
		
		
		// 회원가입 눌렀을 때 
		$("#btnJoin").click(function(){
			var emailrule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var emailCk = $("[name=wm_email_id]").val() + "@" + $("[name=wm_email_addr]").val();
			
			var emailResult = emailrule.test(emailCk);
			console.log("이메일 값" + emailResult);
			
			if(emailrule.test(emailCk)) {
				$("[name=proc]").val("가입완료");
				location.href = "${path}/join.do?" + $("form").serialize() ;
			}
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
			<li><a href="${path}/login.do">워너핏 X 파트너</a></li>
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
    <div class="main-container" align="center">
        <form name="regfrm" method="post">
        	<input type="hidden" name="proc"/>
        	<table id="reg-table">
        		<thead>
	        		<tr align="center">
	        			<td colspan="2"><b>일반회원 회원가입</b></td>
	        		</tr>
        		</thead>
        		<tbody>
        		<tr>
         			<td class="comInfo" width="30%">아이디</td>
        			<td width="60%"><input type="text" name="wm_id" size="20" required placeholder="영+숫자 6-12자리" autofocus> 
        				<input type="button" class="btnCheck" id="btnIdCk" value="중복확인">
        				<span id="idCkText"> </span>
        			</td>
        		</tr>
        		<tr>
        			<td class="comInfo">비밀번호</td>
	        		<td><input type="password" name="wm_pass" size="20" placeholder="영+숫자+특문 8-20자리" required>
	        		<span></span>
	        	</td>
        		</tr>
        		<tr>
        			<td class="comInfo">비밀번호 확인</td>
        			<td><input type="password" name="wm_pass_re" size="20" placeholder="비밀번호 재입력" required>
        			<span></span>
        		</td>
        		</tr>
        		<tr>
        			<td class="comInfo">닉네임</td>
        			<td><input type="text" name="wm_nick" size="20" placeholder="특문제외 6-12자리" required>
        			<input type="button" class="btnCheck" id="btnNickCk" value="중복확인">
        			<span id="nickCkText"> </span>
        			</td>
        		</tr>
        		<tr>
        			<td class="comInfo">휴대폰번호</td>
        			<td><input type="text" name="wm_tel" size="20" value="" readonly required/></td>
        		</tr>
        		<tr>
        			<td class="comInfo">이메일</td>
        			<td><input type="text" name="wm_email_id" size="10" required> @ <input type="text" name="wm_email_addr" size="10" required>
        				<select name="email-select">
	        				<option value="0">이메일 선택</option>
	        				<option value="naver.com">naver.com</option>
	        				<option value="hanmail.net">hanmail.net</option>
	        				<option value="google.com">google.com</option>
	        				<option value="직접입력">직접입력</option>
	        			</select>
						<span></span>
        			</td>
        		</tr>
        		<tr>
					<td>성별</td>
        			<td>남 <input type="radio" name="wm_gender" value="M" checked> 
	        			여 <input type="radio" name="wm_gender" value="W">
	        		</td>
        		</tr>
        		<tr>
        			<td>연령대</td>
        			<td><select name="wm_age">
	        				<option value="0">연령대 선택</option>
	        				<option value="10">10대</option>
	        				<option value="20">20대</option>
	        				<option value="30">30대</option>
	        				<option value="40">40대</option>
	        				<option value="50">50대 이상</option>
        				</select>
        				<span></span>
        			</td>
        		</tr>	
        		<tr>
	        		<td>관심운동</td>
        			<td>헬스 <input type="radio" name="wm_sports" value="1" checked>
        				런데이 <input type="radio" name="wm_sports" value="2"> 
        				홈트레이닝 <input type="radio" name="wm_sports" value="3">
        				<span></span>
        			</td>
        		</tr>
        		<tr>
        			<td>가입이유</td>
        			<td>
	        			<select name="wm_result">
	        				<option value="0">가입이유 선택</option>
	        				<option value="다이어트">다이어트</option>
	        				<option value="근력향상">근력향상</option>
	        				<option value="자세교정">자세교정</option>
	        				<option value="성장기어린이">성장기어린이</option>
	        				<option value="기타">기타</option>
	        			</select>
	        			<span></span>
        			</td>
        		</tr>
        		<tr><th id="reg-choice" colspan="2" align="center">
        			<input type="reset" value="다시쓰기"> &nbsp; &nbsp;
        			<input type="button" value="회원가입" id="btnJoin">
        			</th>
        		</tr>
        		</tbody>
        	</table>
        </form>
    </div>

<!-- The Modal -->
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a id="modalClose">close</a></div>
    <div class="modal_content">
    	<br><br>
        <h3></h3>
        <span id="use">사용하기</span>
    </div>
</div>
</section>
</body>
</html>