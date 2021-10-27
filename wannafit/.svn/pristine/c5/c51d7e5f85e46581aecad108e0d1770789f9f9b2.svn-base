<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import = "wannafit.content.funding.*"
	import = "wannafit.content.vo.*"
	 import="java.util.*"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">


<meta charset="UTF-8">
<title>Wanna-Fit, 나만의 핏을 찾아서</title>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js"
	type="text/javascript"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

.side_menu2:hover {
	color: #A9BF9F;
}

.sec01 {
	width: 30%;
	text-align: left;
	margin-top: 5px;
	padding: 0;
	float: left;
}

.sec02 {
	width: 70%;
	align: right;
	margin: 0 auto;
	float: right;
	margin-top: 5px;
}

#title {
	align: left;
	font-size: 30px;
	font-weight: bold;
}

.tab2 {
	text-align: left;
	float: right;
	border-radius: 3px;
	border: 1px solid #dedede;
	margin: 10px 10px 10px 10px;
	width: 60%;
	background: #ffff;
	box-shadow: 1px 1px 1px #ccc;
	border-radius: 6px;
	border: 1px solid #dedede;
}

.tab {
	text-align: center;
	float: center;
	margin: 10px 10px 10px 10px;
	border: 1px solid #dedede;
	width: 100%;
	height: 100%;
}

.tbody  td {
	font-size: 11.5px;
	font-weight: light;
}
.aside {
	position:absolute;
	width:15%;
	height:1000px;
	border-right:1px solid black;
	margin-top:5%;
	float:left;
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


</style>
<%
/*   <div class="card" onclick = "function()">
<table>
<tr><td class="title_c"><img id="img" src="img\img01.JPG"/></td>
<td class="text_c">
<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
<p><strong>결제 예정일</strong> 2021. 10. 01</p>
<p>선물은 선택하지 않고, 밀어만 줍니다</p>
</td></tr>
</table>
<hr>
  	<table>
<tr><td class="title_c"><img src="img\img01.JPG"/></td>
<td class="text_c">
<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
<p><strong>결제 예정일</strong> 2021. 10. 01</p>
<p>선물은 선택하지 않고, 밀어만 줍니다</p>
</td></tr>
</table>
<hr>
  	<table>
<tr><td class="title_c"><img src="img\img01.JPG"/></td>
<td class="text_c">
<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
<p><strong>결제 예정일</strong> 2021. 10. 01</p>
<p>선물은 선택하지 않고, 밀어만 줍니다</p>
</td></tr>
</table>

"
+ "data-toggle='modal' data-target='#exampleModalCenter' onclick='detail2("+fundinglist.id+")'
 onclick ='detail2("+fundinglist.id+")'
</div>*/
FUN_dao dao2 = new FUN_dao();
ArrayList<FunPro_VO> fundinglist = dao2.getfundinglistAll();
%>

<script type="text/javascript">
$(document).ready(function() {
	
	
	$("#schBtn").click(function() {
		schFun();
});
});
//3. 펀딩함수 				
function schFun() {
		var xhr = new XMLHttpRequest();
		var categoryV = $("[name=category]").val();
		var stateV = $("[name=state]").val();
		
		var qstr = "proc=sch&cfp_atecory=" + categoryV + "&fp_state=" + stateV;
		xhr.open("get", "${path}/fundingsup.do?" + qstr, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var flist = JSON.parse(xhr.responseText);
				console.log(flist);
				var show = "";
				$(flist).each(
						function(idx, fundinglist) {
							show += "<tr class='detail2' onclick='detail("+fundinglist.id+")'><td>"
									+ fundinglist.id + "</td>";
							show += "<td>" + fundinglist.fp_category + "</td>";
							show += "<td>" + fundinglist.fp_title + "</td>";
							show += "<td>" + fundinglist.fp_state + "</td>";
							show += "<td>" + fundinglist.fp_enddate
									+ "</td></tr>";

						});
				
				$(".tbody").html(show);
			}
		};
		xhr.send();
	}
</script>
<body>

	<nav class="navbar">
		<div class="nav-wrapper">
			<ul class="logo">
				<li><a href="${path}/WANNAFIT/A_settings/Main.jsp">WANNAFIT</a></li>
			</ul>
		</div>

		<div class="menu-wrapper">
			<ul class="menu">
				<li><a href="${path}/WANNAFIT/user/UT001-Logout.jsp">로그아웃</a></li>
				<li><a href="${path}/WANNAFIT/mypage/mypage_main.jsp">마이페이지</a></li>
			</ul>
		</div>
	</nav>

	<nav class="navar1-1">
		<div>
			<b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b>
		</div>
	</nav>

	<nav class="navbar2">
		<ul class="side_menu1">
			<li><a href="#"><b>맵핏</b></a></li>
			<li><a href="#"><b>예약</b></a></li>
			<li><a href="${path}/WANNAFIT/groupfit/GF001-board.jsp"><b>그룹핏</b></a></li>
			<li><a href="#"><b>펀인핏</b></a></li>
			<li><a href="#"><b>마인핏</b></a></li>
		</ul>
	</nav>

	<section style="margin-top: 5%;">
		<aside class="aside">
<div class="sub1-menu">
	<ul id="side-menu">
		<h3> 펀딩 관리 </h3>
		<li><a href="${path}/content/mypage/schedule/cal.jsp"> 캘린더 </a></li>
		<li><a href="#"> 상품 조회 </a></li>
		<li><a href="#"> 펀딩 내역 </a></li>
		<li><a href="#"> 상품 신규 등록 </a></li>
	</ul>
	<ul id="side-menu">
		<h3> 기업 관리 </h3>
		<li><a href="${path}/mamcrud.do"> 개인정보 수정 </a></li>
		<li><a href="#"> 문의 내역 </a></li>			
		<li><a href="#"> 신고 내역 </a></li>			
	</ul>
</div>		
</aside>
	</section>

	<div class="sec02">
		<div>
			<p id="title">펀딩현황</p>
		</div>
		<hr>

		<form id="frm01" method="get">
			<input type="hidden" value="" name="proc" /> <span> <input
				type="text" name="category" placeholder="카테고리명" /> <input
				type="text" name="state" placeholder="상태명" />
				<button class="btn btn-info" type="button" id="schBtn">검색</button>
			</span> <span>
				<button class="btn btn-success" type="button">신규프로젝트등록</button>
			</span>
		</form>
		<hr>

		<table class="tab">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<thead>
				<tr class="table-success text-center">
					<th>상품번호</th>
					<th>카테고리명</th>
					<th>상품명</th>
					<th>상태</th>
					<th>만료기간</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

	







				</div>
	
<jsp:include page="/content/A_settings/main_footer.jsp"/>

</body>
</html>