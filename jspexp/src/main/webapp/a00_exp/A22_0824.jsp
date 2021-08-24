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
# 정리문제
	1. 서버단위로 session 만료기간을 설정할려고 한다. 처리할 내용을 기술하세요.
	
	
	
	2. 자바빈의 기본형식은 bean선언, 프로퍼티 선언, el호출까지 기술하세요.
	
		ex)	<jsp:useBean id="p01" class="jspexp.z02_vo.Person" scope="request"/>
		==> request.setAttribute("p01",new Person());
		
			<jsp:setProperty name="p01" property="name" value="홍길동"/>
		==> Person p01 = new Person();
			p01.setName("홍길동");
			request.setAttribute("p01",p01);
			
			<jsp:getProperty name="p01" property="name"/>
		==>	Person p01 = (Person)request.getAttribute("p01");
			<%=p01.getName()%>
			${p01.name}
	
	3. 자바빈의 프로퍼티란 무엇인가? 
	
			<jsp:setProperty name="p01" property="name" value="홍길동"/>
		==> Person p01 = new Person();
			p01.setName("홍길동");
			request.setAttribute("p01",p01);
			
			<jsp:getProperty name="p01" property="name"/>
		==>	Person p01 = (Person)request.getAttribute("p01");
			<%=p01.getName()%>
			${p01.name}		
	
	4. jspexp.z02_vo.Student를 bean으로 설정하고, 요청값으로 ?no=1&name=홍길동&kpt=70&ept=80&mpt=90을 받아서 처리할려고 한다. 요청값을 받은 내용을 bean을 활용하여 출력하세요.
	
		
	
	5. 아래와 같은 부서정보 등록(DAO처리)을 bean을 활용하여 처리하세요.
	    부서번호:[   ]
	    부서명:[   ]
	    부서위치:[   ]
	        [등록]
	    == 부서정보리스트 == 
	    
	    

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