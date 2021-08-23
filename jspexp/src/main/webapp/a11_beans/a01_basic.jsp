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

</head>
<%-- 
# 자바빈
	1. 웹 프로그래밍에서 데이터의 표현을 목적으로 사용한다.
	2. 일반적인 빈 구성
		값을 지정 하기 위한 필드
		값을 수정 하기 위한 setter
		값을 읽기 위한 getter
	3. 자바빈 프로퍼티 **
		1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현한다.
		2) 메서드 이름을 사용해서 프로퍼티의 이름을 결정한다.
		3) 규칙 : 프로퍼티 이름에 propName일 경우
			- setter : public void setPropName(Type value)
			- getter : public Type getPropName()
			- boolean : isPropName()
			- 배열 지정 가능 : public void setName(String[])
			ex) 프로퍼티명이 age인 경우
				setter : public void setAge(int age) {}
				getter : public int getAge();
				boolean : public boolean isAge();..
			
			ex1) public void setLoc(String loc) {} => property 이름 : loc		
	4. 활용
		1) useBean : <jsp:setProperty name="p01" property="loc" value="서울"/>
		2) el / jstl ${p01.name} => p01.getName() 호출 
	5. <jsp:useBean> 태그
		1) jsp에서 자바빈 객체를 생성할 때 사용
			<jsp:useBean id="빈이름" class="패키지명.자바클래스" scope="session범위"/>
			
		ex)	<jsp:useBean id="p01" class="jspexp.z02_vo.Person" scope="request"/>
				=> request.setAttribute("p01", new Person());
				
			<jsp:setProperty name="p01" property="name" value="홍길동"/>
				=> Person p01 = new Person();
				   p01.setName("홍길동");
				   request.setAttribute("p01",p01);

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
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