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

.aside {
	position:absolute;
	width:15%;
	height:1000px;
	margin-top:5%;
	margin-left:0;
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

.sub1-menu {
	width:80%;
}

.sub1-menu ul{
	list-style:none;
	margin:0 auto;
}

.sub1-menu li{
	width:120px;
	height:20px;
	padding:5%;
	font-size:11pt;
	border-bottom:1px solid var(--gray-150-color);
}

.sub1-menu li:hover{
	border-bottom:1px solid #A9BF9F;
	color:#A9BF9F;
}

span {
	font-size:10pt;
}

a {color:black;}

.list-table {
	width:80%;
    background-color: white;
    border-collapse: collapse;
    box-shadow: 0px 5px 10px var(--gray-300-color);
    overflow: hidden;
}

.list-table thead {
    box-shadow: 0px 5px 10px var(--gray-300-color);
    background-color: var(--gray-150-color);
}

.list-table thead th, thead td {
    padding: 1rem 2rem;
    letter-spacing: 0.1rem;
    font-size: 0.9rem;
    font-weight: 900;
}

.list-table tbody td {
    padding: 1rem 2rem;
    font-size: 0.8rem;
    border-top:1px solid var(--gray-300-color);
}

.list-table th:nth-child(odd){
    background-color: var(--gray-150-color);
    border-top:1px solid var(--gray-300-color);
}

.rev-table {
	width:80%;
	padding:30px 30px 30px 40px;
	border-collapse: collapse;
}

.rev-table thead th{
	height:40px;
	border:1px solid var(--gray-500-color);
	padding:2%;
}

.rev-table thead td{
	height:30px;
	padding:2%;
}

.rev-table tbody td{
	height:30px;
	padding:1%;
	text-align:center;
	border-bottom:1px solid var(--gray-300-color);
}

.rev-table tbody td:nth-child(odd){
	height:40px;
	border-right:1px solid var(--gray-300-color);
}

.modal_wrap, .modal_upt{
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
	margin-top:30pt;
	margin-left:50pt;
}

#use {
	display:none;
}

#usrID, a:active, a:hover, #ckCt {
	color:#A9BF9F;	
}


</style>
</head>
<script src="${path}/content/user/cookies.js" type="text/javascript"></script> 
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

//로그인한 경우 세션이 등록되서 로그인했는지 판별
var userSession = "${login_User}";
var usrGrp = "${login_UsrGroup}";
console.log("[예약일정] 유저세션 : " + userSession);
console.log("[예약일정] 유저그룹세션 : " + usrGrp);

var ckTds = new Array(); // 체크박스로 제어를 위한 선언
$(document).on("click", ".tdNums", function(){
	//alert($(this).val());
	
	console.log($(this).is(":checked"));
	if($(this).is(":checked")){
		ckTds.push($(this).val());
	} else {
		ckTds.pop($(this).val());
	}
	
	console.log($(this).val());
	console.log(ckTds);
});

$(document).on("click", "[name=allCk]", function(){
	if($(this).is(":checked")){
		$(".tdNums").attr("checked", true);
	} else {
		$(".tdNums").attr("checked", false);
	}
});


	$(document).ready(function(){
		
		var snd = "?proc=sch&wm_id=" + userSession;
		//$("[name=proc]").val("sch");
		reserveList(0, 0); // 초기데이터
		
		
		// modal 숨김
		$(".modalClose").click(function(){
			$(".modal_wrap").css("display", "none");
			$(".modal_upt").css("display", "none");
			$(".black_bg").css("display", "none");
		});
		
		// 추가버튼 클릭 
		$("#btnAdd").click(function(){
			$(".modal_wrap").css("display", "block");
			$(".black_bg").css("display", "block");
		});
	
		$("#btnUpt").click(function(){
			if(ckTds.length == 1) {
				$(".tdNums").each(function(idx){
					if(ckTds == $(this).val()) {
						//console.log(idx + "번째 = " + $(this).val());
						console.log(ckTds + " 랑 " + $(this).val());
						console.log($(this).parent().parent().find(".tdNums").text());
						
						$("#frm02").find("[name=wrs_num]").val($(this).parent().parent().find(".tdNums").text());
						$("#frm02").find("[name=wrs_title]").val($(this).parent().parent().find(".tdTitles").text());
						$("#frm02").find("[name=wrs_day]").val($(this).parent().parent().find(".tdDays").text());
						$("#frm02").find("[name=wrs_time]").val($(this).parent().parent().find(".tdTimes").text());
						$("#frm02").find("[name=wrs_price]").val($(this).parent().parent().find(".tdPrices").text());
						
						$(".modal_upt").css("display", "block");
						$(".black_bg").css("display", "block");
					}
				    	
				});
	
			} else {
				alert("수정할 데이터는 하나만 선택가능합니다");
			}
		});

		$("#cho_month, #cho_day").change(function(){
			var monVal = $("#cho_month").val();
			var dayVal = $("#cho_day").val();
			$("[name=proc]").val("sch");
			
			if(monVal <= 9) monVal = "0" + monVal;
			if(dayVal <= 9) dayVal = "0" + dayVal;
			
			snd = "?proc=sch&wm_id=" + userSession;
			reserveList(monVal, dayVal);
		});
		
		// 추가, 수정, 삭제
		$("#btnDel").click(function(){
			$("[name=proc]").val("del");
			
			
			$(".tdNums").each(function(idx){
				if(ckTds == $(this).val()) {
					console.log("같은거 " + idx);
					//snd = "?proc=del&wm_id=" + userSession + "&" + $("#frm01").serialize();
				}
			});
		});
	
		$("#btnAddM").click(function(){
			//$("[name=proc]").val("ins");
			snd = "?proc=ins&wm_id=" + userSession + "&" + $("#frm01").serialize();
			reserveList(0, 0);
			$(".modalClose").click();
		});
		
		$("#btnUptM").click(function(){
			//$("[name=proc]").val("upt");
			snd = "?proc=upt&wm_id="+ userSession + "&" + $("#frm02").serialize();
			reserveList(0, 0);
		});
		
		
		function reserveList(mon, day) {
			$.ajax({
				url:"${path}/mytr.do" + snd,
				type:"get",
				data:$(".rev-table").serialize(),
				dataType:"json",
				success:function(data){
					var showData = "<tr><td><input type='checkbox' name='allCk'/></td><td>날짜</td>"
						+"<td>시간</td><td>예약명</td><td>예약금액</td><td>예약단계</td></tr>";
					list = data.list;
					console.log(list);
					console.log(mon + " 월 " + day);
				
				$.each(list, function(idx, rev){
						console.log(rev);
						
						if(mon == 0 && day == 0) {
							showData += "<tr>확인<td><input type='checkbox' name='"+ idx +"' class='tdNums' value='" + rev.wrs_num + "'/></td>";
							showData += "<td class='tdDays'>" + rev.wrs_mon + "/" + rev.wrs_nday + "</td>";
							showData += "<td class='tdTimes'>" + rev.wrs_hour + ":" + rev.wrs_min + "</td>";
							showData += "<td class='tdTitles'>" + rev.wrs_title + "</td>";
							showData += "<td class='tdPrices'>" + rev.wrs_price + "</td>";
							showData += "<td class='tdSteps'>" + rev.wrs_step + "</td></tr>";
						} else {
							if(mon == rev.wrs_mon && day == rev.wrs_nday) {
								showData += "<tr>확인<td><input type='checkbox' name='"+ idx +"' class='tdNums' value='" + rev.wrs_num + "'/></td>";
								showData += "<td class='tdDays'>" + rev.wrs_mon + "/" + rev.wrs_nday + "</td>";
								showData += "<td class='tdTimes'>" + rev.wrs_hour + ":" + rev.wrs_min + "</td>";
								showData += "<td class='tdTitles'>" + rev.wrs_title + "</td>";
								showData += "<td class='tdPrices'>" + rev.wrs_price + "</td>";
								showData += "<td class='tdSteps'>" + rev.wrs_step + "</td></tr>";
							} else {
								showData = "";
							}
						}	
				});	
				$("#revSch tbody").html(showData);
				
				},
				error:function(err){
					console.log(err);
				}
			});
		}
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
			<!--  조건문으로 각 회원별 마이페이지 연결 -->
			<li><a href="${path}/mamcrud.do">마이페이지</a></li>
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
<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu">
		<h3> 마이페이지 </h3>
		<li><a href="${path}/mamcrud.do"> 개인정보 수정 </a></li>	
		<li><a href="${path}/mytr.do"> 예약 내역 </a></li>			
		<li><a id="ckCt" href="${path}/mytr.do?proc=예약일정"> 예약일정 관리 </a></li>
	</ul>
</div>		
</aside>
<section class="section">
    <div align="center">
        <form id="revfrm" method="post">
        	
        	<table id="revSch" class="list-table">
        		<thead>
        			<tr align="center"><th colspan="6"><b>예약일정 등록</b></th></tr>
        			<tr><td colspan="3" style="text-align:left;">
        				<select id="cho_month">
        					<option value="0">월 선택</option>
        					<c:forEach var="mtCnt" begin="1" end="12"> 
        						월 <option value="${mtCnt}">${mtCnt}월</option>
        					</c:forEach>
        				</select>
        				<select id="cho_day">
        					<option value="0">일 선택</option>
        					<c:forEach var="dyCnt" begin="1" end="31"> 
        						일 <option value="${dyCnt}">${dyCnt}일</option>
        					</c:forEach>
        				</select>
        			</td>
        			<td colspan="3" style="text-align:right;">
        				<input type="button" value="추가" id="btnAdd">
        				<input type="button" value="수정" id="btnUpt">
        				<input type="button" value="삭제" id="btnDel">
        			</td></tr>
        		</thead>
        		<tbody></tbody>
        	</table>
        </form>
    </div>
</section>
</body>
<!-- The Modal -->
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a class="modalClose">close</a></div>
    <div class="modal_content">
    	<div id="div-modal">
	    	<h2>예약일정 등록</h2>
	    	<form id="frm01" method="post">
	    		<input type="hidden" name="proc"/>
		        <input type="hidden" name="wrs_num"/>
		        <table id="tab-Addmodal" class="rev-table">
		        	<tr><td>예약명</td><td><input type="text" name="wrs_title" required/></td></tr>
		        	<tr><td>예약날짜</td>
		        	<td><input type="text" name="wrs_day" placeholder="yyyy-mm-dd" required/></td></tr>
		        	<tr><td>예약시간</td>
		        	<td><input type="text" name="wrs_time" placeholder="hh:mm" required/></td></tr>
		        	<tr><td>예약금액</td>
		        	<td><input type="text" name="wrs_price" placeholder="0" required/></td></tr>
		        	<tr>
		        		<td colspan="2">
		        			<input type="button" value="취소" class="modalClose"/>
		        			<input type="button" value="확인" id="btnAddM"/>
		        		</td>
		        	</tr>
		        </table>
	        </form>
    	</div>
    </div>
</div>
<div class="modal_upt">
    <div class="modal_close"><a class="modalClose">close</a></div>
    <div class="modal_content">
    	<div id="div-modal">
	    	<h2>예약일정 수정</h2>
	    	<form id="frm02" method="post">
	    		<input type="hidden" name="proc"/>
		        <input type="hidden" name="wrs_num"/>
		        <table id="tab-Addmodal" class="rev-table">
		        	<tr><td>예약명</td><td><input type="text" name="wrs_title" required/></td></tr>
		        	<tr><td>예약날짜</td>
		        	<td><input type="text" name="wrs_day" placeholder="yyyy-mm-dd" required/></td></tr>
		        	<tr><td>예약시간</td>
		        	<td><input type="text" name="wrs_time" placeholder="hh:mm" required/></td></tr>
		        	<tr><td>예약금액</td>
		        	<td><input type="text" name="wrs_price" placeholder="0" required/></td></tr>
		        	<tr>
		        		<td colspan="2">
		        			<input type="button" value="취소" class="modalClose"/>
		        			<input type="button" value="확인" id="btnUptM"/>
		        		</td>
		        	</tr>
		        </table>
	        </form>
    	</div>
    </div>
</div>
</html>