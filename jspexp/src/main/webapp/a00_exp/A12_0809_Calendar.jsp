<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
	thead {height:50px;}
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("h2").text("캘린더");
	});

</script>
</head>
<%-- 
# 10. js의 Date를 활용하여 오늘의 요일(getDay() - 0~6)을 구하고, setDate(getDate()-@@@)을 통해서 이번 주 일요일 날짜를 구하세요. 
		2X7 테이블을 통해서 요일 행과 날짜 행을 만들고, 이번 주 일요일 날짜와 오늘 날짜를 출력하세요.

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<table align="center" width="80%" height="200px" style="text-align:center" class="listTable">
		<thead><tr><th> 일 </th><th> 월 </th><th> 화 </th><th> 수 </th><th> 목 </th><th> 금 </th><th> 토 </th></tr></thead>
		<tr><td>  </td><td>  </td><td>  </td><td>  </td><td>  </td><td>  </td><td>  </td></tr>
	</table>
	<script type="text/javascript">
		
		var toDay = new Date();
		var tds = document.querySelectorAll("td");
		var toDayIdx = toDay.getDay(); // index로 요일을 가져오기 때문에 가능하다.
		tds[toDayIdx].style.backgroundColor = "yellow";
		tds[toDayIdx].innerText = toDay.getDate();
		$('h2').text(toDay.getMonth()+1+"월");
		// 일요일의 날짜를 처리할 수 있다. 오늘날짜 - 요일 index => 금주 일요일
		toDay.setDate(toDay.getDate()-toDayIdx);
		tds[0].innerText = toDay.getDate();
		for(var idx=0; idx<7; idx++) {
			tds[idx].innerText = toDay.getDate();
			toDay.setDate(toDay.getDate()+1);
		}
		
		/*
		# 월 달력 만들기
			1. 해당 월의 1일의 요일을 가져오고 그 주간의 일요일 날짜를 처리한다.
			2. 다음달의 1일의 전 날짜를 가져온다.
			3. 위 내용을 반복문과 조건문을 활용하여 캘린더를 만든다.
		*/
		
	</script>
	
</body>
</html>