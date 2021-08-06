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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("08.06 정리 문제");
	});

</script>
</head>
<%-- 
# 정리문제
	1. servlet을 생성하고, 도서명 가격을 요청값을 받아서 출력하는 처리를 하세요. (out.print())
	
	
	
	2. A13_MVC.java를 만들고, view단 호출 (a04_basic/a10_gugu.jsp)
	   초기페이지에 임의의 구구단 [   ] X [   ] 정답 :[   ] [확인]
	   정답을 맞추면 정답입니다. 페이지이동, 틀리면, 다시 구구단 문제 페이지로 이동 처리하게 하세요.
	
	
	
	3. Date 하위 기능 메서드를 정리하세요.
	
		var d01 = new Date(); // 오늘 날짜
		d01.setXXX(저장데이터);
		d01.getXXX();
		# XXX 부분 기능 메서드
		FullYear, Month(0~11), Date, Day(요일 0~6), Hours, Minutes, Seconds
	
	4. 기념일 확인하기, 오늘로부터 [    ]일 [이전] [이후] 클릭시, 해당 날짜를 계산하여 출력하세요.
	   Date객체 활용 d.setDate(d.getDate()+@@@)
	
	
	
	5. 배열 관련 기능 메서드를 정리하세요.
	
		# 초기 데이터 할당 및 생성자
		var array01 = new Array();
		var array02 = new Array(크기);
		var array03 = new Array(데이터1, 데이터2, 데이터3, ....);
		var array04 = new Array[데이터1, 데이터2, 데이터3];
		
		# 기능 메서드
		array04.slice(시작, 마지막); 해당 부분만 절삭해서 가져온다. (구조 변경 X)
		array04.splice(시작, 마지막); 해당 부분 절삭 (구조 변경 O)
		array04.push(마지막에 추가 될 데이터);
		array04.pop(); // 마지막 데이터를 리턴하며 구조가 삭제되어 처리된다.
		array04.reverse(); // 거꾸로 출력 처리 (구조 변경 O)
		array04.sort(); // 정렬 처리 (구조 변경 O)
		array04.sort(function(left, right) {return left-right;}); // 순차 정렬 (오름차순)
		array04.sort(function(left, right) {return right-left;}); // 정렬 (내림차순)
		array04.concat([데이터1, 데이터2, ....]); // 배열 병합
	
	6. 등록점수 : [   ] [등록] [내림차순정렬] [오름차순정렬]
	   no  점수
	   
	   

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
	
</body>
</html>