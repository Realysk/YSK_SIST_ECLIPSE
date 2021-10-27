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
}

.sub-table tr:nth-child(odd){
    background-color: var(--gray-150-color);
}

.aside {
	position:absolute;
	width:13%;
	height:100%;
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
	margin:0 auto;
}

.main-container div{
	width:100%;
	margin:0 auto;
	padding:3%;
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

.main-table, .sub-table{
	width:90%;
}

.main-table td{
	padding:2%;
	margin:0px;
	border:1px solid #D8D9D7;
}

.sub-table td{
	padding:2%;
	margin:0px;
	border:1px solid #D8D9D7;
}

.tab-name {
	width:70%;
	height:20px;
	margin:0px;
	border-radius: 5px;
    padding: 0.2rem 1rem;
}

.tab-action, .tab-title{
	width:15%;
	text-align:center;
}

.tab-img {
	width:100px;
	height:100px;
	margin:0 auto;
	padding:0%;
}

.img-src {
	width:100%;
	height:110px;
	margin:0 auto;
}

#btnTag{
	width:100px;
	height:100px;
	margin:0 auto;
	padding:1%;
	border:1px dotted black;
}

#usrID, a:active, a:hover, #ckCt{
	color:#A9BF9F;	
}

</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
var userGroup = "${login_UsrGroup}";
console.log("[예약리스트] 유저세션 : " + userSession);
console.log("[예약리스트] 유저그룹세션 : " + userGroup);

	$(document).ready(function(){
	
		// 검색
		$("[name=inText]").keyup(function(){
			if(event.keyCode == 13){
				var kindVal = $("#schKind>option:selected").val();
				var inVal = $("[name=inText]").val();

				getRevList(kindVal, inVal);
			}
		});
		
		$("#btnSch").click(function(){
			var kindVal = $("#schKind>option:selected").val();
			var inVal = $("[name=inText]").val();

			getRevList(kindVal, inVal);
		});
	
		// 페이지 로딩시 바로 리스트 출력
		getRevList("wm_nick", "");
				
		var list = 0;
		function getRevList(kindVal, inVal) {
			$.ajax({
				url:"${path}/reserve.do?proc=트레이너리스트&" + kindVal + "=" + inVal,
				type:"get",
				data:$(".main-table").serialize(),
				dataType:"json",
				success:function(data){
					var showData = "";
					list = data.list;
					$.each(list, function(idx, tr){
						console.log(tr.wm_id);
						showData += "<input type='hidden' class='trIds' value='" + tr.wm_id + "'/>";
						showData += "<tr><td rowspan='2' class='tab-img'><img class='img-src' src='${path}/content/reserve/img" + tr.wm_imgSrc + "'></td>" 
								+"<td class='tab-name'>" + tr.wm_nick + "</td>";
						showData += "<td class='tab-action' rowspan='2'  style='text-align:center;'>"
							+ "<input type='button' value='조회'/>"
							+ "<input type='hidden' class='trIds' value='" + tr.wm_id + "'/></td></tr>";		
						showData += "<tr><td class='tab-content'><span class='sptKind'>" + tr.wsk_name + "</span><br>" + tr.wt_info + "</td>";
						
					});
					console.log("조회 수 : " + list.length);
					$("#tab-SchTitle").html("검색결과 (" + list.length + ")");
					$(".sub-table tbody").html(showData);
					
				},
				error:function(err){
					console.log(err);
				}
			});
		}	
	
		// 예약 선택시 해당 트레이너의 상세로 연결
		$(".sub-table").on("click", "[type=button]", function(){
			if(userGroup == "일반회원"){
				var selectTr = $(this).parent().find(".trIds").val();

				location.href = "${path}/reserve.do?wm_id=" + selectTr;
			} else {
				alert("로그인 후 가능한 서비스입니다!");
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
			<li><span>워너핏 X 파트너</span></li>
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
<!--  Section의 오른쪽 : 내용 -->
<section class="section">
<div class="main-container">
	<div>
	<table class="main-table">
		<thead><tr><td colspan="3">트레이너 검색</td></tr></thead>
		<tr>
			<td class="tab-title">분류</td>
			<td>
				<select id="schKind">
					<option value="wm_nick">트레이너명</option>
					<option value="wsk_num">운동분야명</option>
				</select>
			</td>
			<td class="tab-title" rowspan="2">
				<input type="button" id="btnSch" value="검색"/>
			</td>
		</tr>
		<tr>
			<td class="tab-title">입력</td>
			<td><input type="text" name="inText" value=""/></td>
		</tr>
	</table>
	</div>
	<div>
	<table class="sub-table">
		<thead><tr><td id="tab-SchTitle" colspan="4"></td></tr></thead>
		<tbody></tbody>
	</table>
	</div>
</div>
</section>
</body>
</html>