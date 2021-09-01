<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
</head>
<%-- 
# AJAX로 DB 처리
	1. 사원번호로 AJAX 검색 및 JSON 데이터 처리 (MVC 패턴)
	2. 파일 정보
		controller : A26_AjaxController.java
		view : a14_mvc\a06_mvc_DB.jsp
	3. 처리순서
		1) 초기화면 로딩
		2) 사원번호 입력 후 enter키 입력 시 AJAX 처리
		3) 요청값 처리 및 AJAX 처리 결과 JSON 데이터 만들기
			- service, dao 호출
		4) service단
			- Emp 객체 => JSON 데이터 변환 전송
		5) 컨트롤단
			- 출력 out.print(결과값 처리);
		6) view단 받은 json 문자열 => json객체로 변환
			해당 화면에 출력하기
	4. JSON lib를 활용한 객체를 JSON 문자열 변환 처리
		webapp\WEB-INF\lib\gson-2.8.2.jar 객체를 JSON 문자열 데이터로 JSON 문자열 데이터를 객체로 변환시킨다.

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		var xhr = new XMLHttpRequest();
		$("[name=empno]").keyup(function(event) {
			if(event.keyCode==13) {
				var empnoVal = $("[name=empno]").val();
				console.log($("[name=empno]").val());
				xhr.open("get","${path}/schEmp.do?empno="+empnoVal,true);
				xhr.send();
				xhr.onreadystatechange=function() {
					if(xhr.readyState==4&&xhr.status==200) {
						var jTxt = xhr.responseText;
						$("#show td").text("");
						if(jTxt!="{}") {
							var emp = JSON.parse(xhr.responseText);
							console.log(emp);
							$("#show td").eq(0).text(emp.empno);
							$("#show td").eq(1).text(emp.ename);
							$("#show td").eq(2).text(emp.job);
							$("#show td").eq(3).text(emp.mgr);
							$("#show td").eq(4).text(emp.hiredate);
							$("#show td").eq(5).text(emp.deptno);
							$("#show td").eq(6).text(emp.sal);
							$("#show td").eq(7).text(emp.comm);
						} else {
							alert("해당 사원번호는 존재하지 않습니다.");
						}
					}
				};
			}
		});
	});

</script>
<style> td {text-align:center} </style>
<body>
	
	<h2 align="center">사원정보 MVC (AJAX)</h2>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
	</table><br><hr><br>
	<table id="show" align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%"><col width="20%"><col width="30%">
		<tr><th>사원번호</th><td></td><th>사원명</th><td></td></tr>
		<tr><th>직책</th><td></td><th>관리자번호</th><td></td></tr>
		<tr><th>입사일</th><td></td><th>부서번호</th><td></td></tr>
		<tr><th>보너스</th><td></td><th>보너스</th><td></td></tr>
	</table>	
	
</body>
</html>