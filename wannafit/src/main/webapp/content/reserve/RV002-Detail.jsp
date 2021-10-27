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
<style type="text/css">
:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;
}

*,
*::befor,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

.blockTable {
	width:100%;
    background-color: white;
    border-collapse: collapse;
    box-shadow: 0px 5px 10px var(--gray-300-color);
    overflow: hidden;
    border:1px solid var(--gray-300-color);
    margin-bottom:50px;
}

.blockTable thead {
    box-shadow: 0px 5px 10px var(--gray-300-color);
    background-color: var(--gray-150-color);
}

.blockTable thead td {
    padding: 1rem 1rem;
    letter-spacing: 0.1rem;
    font-size: 0.8rem;
    font-weight: 900;
}

.blockTable tbody td {
    padding: 1rem 1rem;
    font-size: 0.8rem;
}

.blockTable tr:nth-child(even){
    background-color: var(--gray-150-color);
}

.aside {
	position:absolute;
	width:15%;
	height:1000px;
	margin-top:7%;
	float:left;
}

.sub1-menu {
	height:100%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
	border-bottom:1px solid var(--gray-300-color);
}

.section {
	position:relative;
	left:18%;
	width:85%;
	height:2em;
	margin:0 auto;
	margin-top:4%;
	margin-bottom:10%;
	float:left;
}

.main-container {
	position:relative;
	width:80%;
	height:820px;
	margin:0 auto;
	padding:2%;
}

.tdTitles{
	width:100px;
}

#tdImgs {
	width:300px;
	height:300px;
	margin:0 auto;
	padding:0;
	text-align:center;
}

#tab-reserve {
	margin-top:50px;
	margin:0 auto;
	text-align:center;
}

/* 문의 */
#qus {
	text-decoration:underline;
	font-weight: 500;
}

#qus:hover {
	background:#d9ffd8;
}


/* modal창 속성 */ 
.modal_wrap, .modal_pay{
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
	text-align:center;
}

/* modal안 예약내용 테이블 */ 
#tab-Ckmodal, #tab-Paymodal {
	width:450px;
	margin:0 auto;
	padding:5%;
	border:1px solid black;
	border-collapse: collapse;
	background:white;
}

#tab-Ckmodal td, #tab-Paymodal td {
	border:1px solid var(--gray-300-color);
	padding:1%;
}

#tab-Paymodal td:nth-child(even) {
	text-align:left;
}


#usrID, a:active, a:hover, #ckCt{
	color:#A9BF9F;	
}


</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
console.log("[예약상세] 유저세션 : " + userSession);

function revOk() {
	var isRevResult = "${isRevResult}";
	if(isRevResult) {
		alert("예약이 완료되었습니다!");
	} else {
		alert("예약이 실패했습니다");
	}
}

	$(document).ready(function(){
		var tr = "${trainer}";
		var tr_id = "${trainer.wm_id}";

		console.log("[예약상세] 트레이너객체 할당확인 : " + tr);
		console.log("[예약상세] 트레이너아이디 할당확인 : " + tr_id)
		
		// 트레이너 정보 할당
		$("[name=wm_imgSrc]").attr("src", "${path}/content/reserve/img" 
				+ "${trainer.wm_imgSrc}").attr("width", "240px").attr("height", "290px");
		$("#wm_nick").text("${trainer.wm_nick}");
		$("#wm_info").text("${trainer.wt_info}");
		$("#wsk_name").text("${trainer.wsk_name}");
		$("#wt_gender").text("${trainer.wt_gender}");
		$("#wt_age").text("${trainer.wt_age}");
		$("#wm_tel").text("${trainer.wm_tel}");

		// 열자마자 로딩
		detailView();
		
		$("#sch").change(function(){
			var selVal = $("#sch>option:selected").text();
			detailView(selVal);
		});
		
		function detailView(selVal) {
			$.ajax({
				url:"${path}/reserve.do",
				type:"post",
				data:"proc=예약일정&wm_id=" + tr_id,
				dataType:"json",
				success:function(data){
					var schedual = data.list;
					console.log(schedual);
					var show = "";

					// 예약일정들
					$.each(schedual, function(idx, sd){

						if(selVal == null || selVal == "예약종류 선택") {
							show += "<tr><input type='hidden' class='trIds' value='" + sd.wm_id + "'/>";
							show += "<input type='hidden' class='trSds' value='" + sd.wrs_num + "'/>";
							show += "<td>"+ sd.wrs_title +"</td><td>"+ sd.wrs_day +"</td><td>" + sd.wrs_time;	
							show += "</td><td>" + sd.wrs_price + "</td><td>" + sd.wrs_step +"</td>"
							show += "<td><input type='button' value='예약' class='btnRevs'/></td></tr>";
						} else {
							
							if(selVal == sd.wrs_title){
								show += "<tr><input type='hidden' class='trIds' value='" + sd.wm_id + "'/>";
								show += "<input type='hidden' class='trSds' value='" + sd.wrs_num + "'/>";
								show += "<td>"+ sd.wrs_title +"</td><td>"+ sd.wrs_day +"</td><td>" + sd.wrs_time;	
								show += "</td><td>" + sd.wrs_price + "</td><td>" + sd.wrs_step +"</td>"
								show += "<td><input type='button' value='예약'/></td></tr>";
							}
						}
					});
					$("#tab-reserve tbody").html(show);
				},
				error:function(err){
					console.log(err);
				},
			});
		}
			
		var trNickVal, revTitleVal, revDateVal, revTimeVal, revPriceVal;
			
		$("#tab-reserve").on("click", ".btnRevs", function(){
			var revStepVal = $(this).parent().parent().find("td").eq(4).text();
	
			if(revStepVal == "예약대기") {
				trNickVal = $("#wm_nick").text();
				scScVal = $(this).parent().parent().find(".trSds").val();
				revTitleVal = $(this).parent().parent().find("td").eq(0).text();
				revDateVal = $(this).parent().parent().find("td").eq(1).text();
				revTimeVal = $(this).parent().parent().find("td").eq(2).text();
				revPriceVal = parseInt($(this).parent().parent().find("td").eq(3).text());
					
				$("#tab-Ckmodal td").eq(1).text(trNickVal);
				$("#tab-Ckmodal td").eq(3).text(revTitleVal);
				$("#tab-Ckmodal td").eq(5).text(revDateVal);
				$("#tab-Ckmodal td").eq(7).text(revTimeVal);
				$("#tab-Ckmodal td").eq(9).text(revPriceVal);
				$("#tab-Ckmodal td").eq(11).text(revStepVal);
					
				// 결제금액이 0일 경우 바로 예약
				if(revPriceVal == "0"){
					$("#btnRev").val("예약");
				} else {
					$("#btnRev").val("결제");
				}
				
				$(".modal_wrap").css("display", "block");
				$(".black_bg").css("display", "block");
			} else {
				alert("예약이 불가능합니다!");
			}
		});
			
		$("#btnRev").on("click", function(){
			var btnVal = $("#btnRev").val();

			// 예약:결제금액이 0일 경우, 결제:결제금액이 0이상일 경우
			if(btnVal == "예약") {
				console.log("예약입니다");
				// 바로 컨트롤러 연결 
				location.href = "${path}/reserve.do?proc=예약완료&wrs_num="+scScVal+"&wm_id=${login_User}";
				
			} else {
				console.log("결제입니다");
				
				$("#frm02").find("[name=wrs_title]").val(revTitleVal);
				$("#frm02").find("[name=wr_price]").val(revPriceVal);
				
				// 결제 모달 연결 
				$(".modal_pay").css("display", "block");	
			}
		});
		
		//$("#btnSuccess").on("click", function(){
		//	console.log("결제완료");
		//	location.href = "${path}/reserve.do?proc=예약완료&" + $("#frm02").serialize();
		//});
		
		// modal 숨김
		$(".bntmodalClose").click(function(){
			$(".modal_wrap").css("display", "none");
			$(".modal_pay").css("display", "none");
			$(".black_bg").css("display", "none");
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
			<li><span id="usrGroup">${login_UsrGroup}</span></li>
			<li><span id="usrID">${login_User}님</span></li>
			<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
			<li><a href="#">마이페이지</a></li>
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
		<li><a href="#"><b>마인핏</b></a></li>
	</ul>
</nav>
<!--  Section의 왼쪽 : 예약 카테고리 -->
<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu"><h3>예약하기</h3>
		<li><a id="ckCt">트레이너 예약</a></li>
		<li><a>헬스장 예약</a></li>
		<li><a>예약 문의</a></li>
	</ul>
</div>
</aside>
<!--  Section의 오른쪽 내용 -->
<section class="section">
<div class="main-container">
	<form>
	<table id="tab-trainer" class="blockTable">
		<thead>
			<tr>
				<td colspan="2">트레이너 정보</td>
				<td style='text-align:right;'><span id="qus">문의</span></td>
			</tr>
		</thead>
		<tbody>
			<tr><td rowspan="6" id="tdImgs"><img name="wm_imgSrc"></td><td class="tdTitles">이름</td><td id="wm_nick"></td></tr>
			<tr><td class="tdTitles">소개</td><td id="wm_info"></td></tr>
			<tr><td class="tdTitles">연락처</td><td id="wm_tel"></td></tr>
			<tr><td class="tdTitles">주운동분야</td><td id="wsk_name"></td></tr>
			<tr><td class="tdTitles">성별</td><td id="wt_gender"></td></tr>
			<tr><td class="tdTitles">연령</td><td id="wt_age"></td></tr>
		</tbody>
	</table>

	<table id="tab-reserve" class="blockTable">
		<thead>
			<tr><td colspan="6" style='text-align:right;'>
				<select id="sch">
					<option>예약종류 선택</option>
					<option>PT체험권</option>
					<option>PT상담</option>
					<option>회원권상담</option>
				</select>
			</td></tr>
			<tr><td>예약종류</td><td>날짜</td><td>시간</td><td>예약금액</td><td>예약상태</td><td>신청</td></tr>
		</thead>
		<tbody></tbody>
	</table>
	</form>	
</div>
</section>
<!-- The Modal -->
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a class="bntmodalClose">close</a></div>
    <div class="modal_content">
    	<h2>예약내용</h2>
        <table id="tab-Ckmodal">
        	<tr><td>트레이너</td><td></td></tr>
        	<tr><td>예약명</td><td></td></tr>
        	<tr><td>날짜</td><td></td></tr>
        	<tr><td>시간</td><td></td></tr>
        	<tr><td>예약금액</td><td></td></tr>
        	<tr><td>예약상태</td><td></td></tr>
        	<tr>
        		<td colspan="2">
        			<input type="button" value="취소" class="bntmodalClose"/>
        			<input type="button" value="결제" id="btnRev"/>
        		</td>
        	</tr>
        </table>
    </div>
</div>
<div class="modal_pay">
    <div class="modal_close"><a class="bntmodalClose">close</a></div>
    <div class="modal_content">
    	<h2>결제</h2>
    	<form id="frm02" method="post" action="${path}/reserve.do?proc=예약완료&">
    		<input type="hidden" name="proc"/>
	        <input type="hidden" name="wrs_num"/>
	        <table id="tab-Paymodal">
	        	<tr><td>예약명</td><td><input type="text" name="wrs_title" readonly/></td></tr>
	        	<tr><td>예약상세내용</td>
		        	<td><textarea name="wr_content" cols="40" rows="3" placeholder="예약시 트레이너가 참고할 내용 작성"></textarea>
		        	</td>
	        	</tr>
	        	<tr>
	        	<tr><td>결제방법</td>
	        		<td>
		        		<input type="radio" name="wr_kind" value="카드" checked/>카드
		        		<input type="radio" name="wr_kind" value="무통장"/>무통장
	        		</td>
	        	</tr>
	        	<tr><td>결제금액</td>
	        		<td><input type="text" name="wr_price" readonly/></td>
	        	</tr>
	        	<tr><td>결제은행</td>
	        		<td><input type="text" name="wr_bank" required/></td>
	        	</tr>
	        	<tr><td>결제번호</td>
	        		<td><input type="text" name="wr_code" placeholder="숫자 16자리" required/></td>
	        	</tr>
	        	<tr><td>유효기간</td>
	        		<td><input type="text" name="wr_expDate" placeholder="00/00 형식" required/></td>
	        	</tr>
	        	<tr><td>생년월일</td>
	        		<td><input type="text" name="wr_birth" placeholder="6자리" required/></td>
	        	</tr>
	        	<tr><td>할부기간</td>
	        		<td><input type="text" name="wr_month" required/></td>
	        	</tr>
	        	<tr>
	        		<td colspan="2">
	        			<input type="button" value="취소" class="bntmodalClose"/>
	        			<input type="submit" value="확인" id="btnSuccess"/>
	        		</td>
	        	</tr>
	        </table>
        </form>
    </div>
</div>
</body>
</html>