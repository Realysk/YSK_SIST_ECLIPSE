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
		$("h2").text("useBean");
	});

</script>
</head>
<%-- 
# <jsp:setProperty> 액션 태그
	1. 자바빈 객체의 프로퍼티 값 설정
	2. 구문
		<jsp:setProperty name="id" property="이름" value="값"/>
			name : 자바빈 객체의 이름
			property : 값을 설정할 프로퍼티
			value : 프로퍼티의 값
			ex) Member m01 = new Member();
				m01.setName(String name)
		<jsp:setProperty name="m01" property="name" value="홍길동"/>
						
		<jsp:setProperty name="id" property="이름" param="파라미터이름"/>
			param : 프로퍼티의 값으로 사용할 파라미터 이름
			
		<jsp:setProperty name="id" property="*"/>
			프로퍼티와 동일한 이름의 파라미터를 이용해서 값을 설정.
			폼에 입력한 값을 자바 객체에 저장할 때 유용하게 사용

--%>
<%

%>
<jsp:useBean id="stud" class="jspexp.z02_vo.Student"/>
<jsp:setProperty property="name" name="stud" value="홍길동"/>
<%-- stud.setName("홍길동"); --%>
<jsp:setProperty property="kor" name="stud" value="70"/>
<jsp:setProperty property="eng" name="stud" value="80"/>
<jsp:setProperty property="math" name="stud" value="90"/>

<%-- ex) Emp 객체를 이용하여 bean을 선언하고 property로 저장하고 호출하여 출력하세요. (사원번호, 사원명, 직책, 급여) --%>
<jsp:useBean id="emp" class="jspexp.z02_vo.Emp"/>
<jsp:setProperty property="empno" name="emp" value="9999"/>
<jsp:setProperty property="ename" name="emp" value="유성근"/>
<jsp:setProperty property="job" name="emp" value="KING"/>
<jsp:setProperty property="sal" name="emp" value="5000"/>

<body>

	<h2 align="center"></h2>
	<table align="center" class="listTable">
		<tr><th> 이름 </th><td><jsp:getProperty property="name" name="stud"/></td></tr>
		<tr><th> 국어 </th><td><jsp:getProperty property="kor" name="stud"/></td></tr>
		<tr><th> 영어 </th><td><jsp:getProperty property="eng" name="stud"/></td></tr>
		<tr><th> 수학 </th><td><jsp:getProperty property="math" name="stud"/></td></tr>
	</table><br>
	<table align="center" class="listTable">
		<tr><th> 사원번호 </th><td><jsp:getProperty property="empno" name="emp"/></td></tr>
		<tr><th> 사원명 </th><td><jsp:getProperty property="ename" name="emp"/></td></tr>
		<tr><th> 직책 </th><td><jsp:getProperty property="job" name="emp"/></td></tr>
		<tr><th> 급여 </th><td><jsp:getProperty property="sal" name="emp"/></td></tr>
	</table><br>
	
</body>
</html>