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
		$("h2").text("08.05 정리 문제");
	});

</script>
</head>

	 <jsp:useBean id="pers" class="jspexp.z02_vo.Person" scope="page"></jsp:useBean>
	 <jsp:setProperty property="name" name="pers" value="홍길동"/>
	 <jsp:setProperty property="age" name="pers" value="25"/>
	 <jsp:setProperty property="loc" name="pers" value="서울"/>
	 
<%
	request.setAttribute("mem", new Member("홍길동", "himan", "7777", "회원", 5000));
%>
	 
<body>
<%--
 # 정리 문제
	 1. usebean에서 사용되는 property란 무엇을 의미하는지 VO객체를 예로 기술하세요.
	 
	 	--%>

			<table align="center" class="listTable">
				<tr><th> 이름 </th><td><jsp:getProperty property="name" name="pers"/></td></tr>
				<tr><th> 나이 </th><td><jsp:getProperty property="age" name="pers"/></td></tr>
				<tr><th> 거주지 </th><td><jsp:getProperty property="loc" name="pers"/></td></tr>
			</table><br>
	 	<%--
	 
	 2. Person과 usebean을 활용하여 이름, 나이, 거주지를 property로 저장 후 호출하세요.
	 
	 	--%>
			<table align="center" class="listTable">
				<tr><th> 이름 </th><td><jsp:getProperty property="name" name="pers"/></td></tr>
				<tr><th> 나이 </th><td><jsp:getProperty property="age" name="pers"/></td></tr>
				<tr><th> 거주지 </th><td><jsp:getProperty property="loc" name="pers"/></td></tr>
			</table><br>	 		
	 	<%--	 
	 
	 3. Model1, Model2의 차이를 기술하세요.
	 
	 	Model1 : JSP 하나로만 호출하여 설계하는 방식. 주로 간단하거나 소규모 프로젝트에서 많이 사용된다.
	 	Model2 : Servlet을 사용하여 설계하는 방식. 일반적으로 쓰이는 경우이며 유지보수가 용이하다.
	 
	 	--%>
	 		
	 	<%--	 
	 
	 4. MVC란 무엇인지 servlet 클래스인 A03_MVC.java를 통해서 각각의 구성요소를 나타내고 설명하세요.
	 
	 	1) 요청 값 처리
	 	2) Model 데이터 처리
	 	3) JSP 호출 (View단 호출) 
	 
	 	--%>
	 		<h3 align="center"> MVC 패턴의 View 단 </h3>
			<h3 align="center"> ${result} </h3>	
	 	<%--	 
	 
	 5. el 태그로 Member VO 객체의 정보를 출력하세요.
	 
	 	--%>
			<table align="center" class="listTable">
				<tr><th> NAME </th><td> ${mem.name} </td></tr>
				<tr><th> ID </th><td> ${mem.id} </td></tr>
				<tr><th> PASS </th><td> ${mem.pass} </td></tr>
				<tr><th> AUTH </th><td> ${mem.auth} </td></tr>
				<tr><th> POINT </th><td> ${mem.point} </td></tr>
			</table><br>	 		
	 	<%--
	 
--%>	
	
</body>
</html>