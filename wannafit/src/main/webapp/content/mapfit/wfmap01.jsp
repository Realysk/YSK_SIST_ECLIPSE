<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"
	import="wannafit.content.vo.*"
	import="wannafit.content.DB.*"
	import="java.sql.*"
	import="wannafit.sql.*"
	import="java.sql.DriverManager"
	import="java.sql.Connection"
	import="java.sql.Statement"
	import="java.sql.ResultSet"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wanna-Fit, 나만의 핏을 찾아서</title>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<style type="text/css">

#usrID, a:active, a:hover{
	color:#A9BF9F;	
}
</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js"
	type="text/javascript"></script>
<script type="text/javascript">
	
</script>
</head>
<%-- 
# 맵핏 카카오 지도 api 연결 페이지
//dapi.kakao.com/v2/maps/sdk.js?appkey 뒤에는 부여받은 api키를 입력하는데, 현재 도메인은 7080 포트로 연결해둠.
--%>
<%

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
		<li><a href="#"><b>마인핏</b></a></li>
	</ul>
</nav>
	<h2 align="center"></h2>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5338b8f6e25e9db46369fdc914ce7022">
		
	</script>

	<div id="map1" style="width: 100%; height: 350px;" magin="50px"></div>
	<script>
		var mapContainer = document.getElementById('map1'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.49941265729292,
					127.03320079855204), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map1 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map1.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map1.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 마커가 표시될 위치입니다
		var position = [
				new kakao.maps.LatLng(37.49941265729292, 127.03320079855204),
				new kakao.maps.LatLng(37.500060, 127.032879),
				new kakao.maps.LatLng(37.500315, 127.034081),
				new kakao.maps.LatLng(37.499702, 127.032042) ];

		for (var i = 0; i < position.length; i++) {
			var marker = new kakao.maps.Marker({
				map : map1,
				position : position[i]
			});
		}
	</script>
<body>

	<table border="1">
		<tr>
			<td>헬스장 이름</td>
			<td>헬스장 위치</td>
			<td>헬스장 소개</td>
			<td>트레이너</td>
		</tr>
			<jsp:useBean id="dao" class="wannafit.content.mapfit.mapDAO"/>
			<c:set var="mList" value="${dao.getGymList()}" />
			<c:forEach var="map" items="${mList}">
			<tr><td>${map.fc_mapName}</td>
				<td>${map.fc_mapLoc}</td>
				<td>${map.fc_mapIntroduction}</td>
				<td>${map.fc_mapTrainer}</td></tr>
			</c:forEach>
	</table>

	<div id="footer">
		<span>카피라이트|문의하기|주소|고객센터</span><br> <span>© 건강을 위한 선택
			WANNA-FIT</span>
	</div>
</body>
</html>