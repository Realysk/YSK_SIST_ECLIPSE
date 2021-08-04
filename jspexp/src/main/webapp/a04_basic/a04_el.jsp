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
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# 표현 언어
	1. Expression Language
	2. JSP에서 사용 가능한 새로운 스크립트 언어
	3. EL의 주요 기능
		1) JSP의 4가지 기본 객체가 제공하는 영역의 속성 사용
		2) 집합 객체에 대한 접근 방법 제공
		3) 수치 연산, 관계 연산, 논리 연산 제공
		4) 자바 클래스 메서드 호출 기능 제공
		5) 표현 언어만의 기본 객체 제공
	4. 간단한 구문 때문에 표현식 대신 사용

--%>
<%
	request.setAttribute("num01", 25); // request 범위로 num01 변수에 25를 할당
	request.setAttribute("num02", 30); // request 범위로 num02 변수에 30을 할당
	request.setAttribute("name", "홍길동"); // request 범위로 name 변수에 '홍길동'을 할당
	
	// ex) 물건명 가격 수량을 request로 선언하고 el로 물건명 가격 수량 총계를 출력하세요.
	request.setAttribute("pname", "사과");
	request.setAttribute("price", 3000);
	request.setAttribute("cnt", 5);
	request.setAttribute("prod", new Product("오렌지",2000,10));
	// EL 태그는 property 개념으로 접근이 가능하다. (getXXXX, 주의! 접근제어자가 있는 field를 접근하는 것이 아니고 public으로 된 getProperty를 접근해서 호출하는 것이다.)
%>
<body>

	<h2 align="center"></h2>
	<h3 align="center">${'EL 태그로 출력'}</h3>
	<table align="center" class="listTable">
		<tr><th>이름 : ${name}</th></tr>
		<tr><td>${num01} + ${num02} = ${num01+num02}</td></tr>
		<tr><td>${num01} - ${num02} = ${num01-num02}</td></tr>
		<tr><td>${num01} * ${num02} = ${num01*num02}</td></tr>
		<tr><td>${num01} / ${num02} = ${num01/num02}</td></tr>
	</table><br>
	<table align="center" class="listTable">
		<tr><th colspan="4"> 물건 리스트 </th></tr>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th><th> 총계 </th></tr>
		<tr>
			<td>${prod.name}</td> <%-- prod.getName()를 호출하여 처리하는 것이다. --%>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td>${price*cnt}</td>
		</tr>
	</table><br>	
	
</body>
</html>