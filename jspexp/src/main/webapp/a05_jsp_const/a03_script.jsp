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
		$("h2").text("");
	});

</script>
</head>
<%-- 
# 스크립트
	1. 요청을 처리하는 데 필요한 코드를 실행
	2. 동적으로 응답 결과를 생성하기 위해 사용
	3. 스크립트의 요소 3가지
		1) declaration : <%! %> ex) java class 바로 밑 선언 부분
		2) scriptlet : <% %> ex) java main() 있는 부분
		3) expression : <%= %> ex) java main()안에 System.out.println();
--%>
<%!
	String pname;
	int getTot(int price, int cnt) {
		return price*cnt;
	}
	String id;
	String pass;
	String login(String id, String pass) {
		
		return id.equals("himan") && pass.equals("7777")?"로그인성공":"로그인실패";
	}
%>
<%
	pname = "바나나"; // 상단에 선언된 변수를 변경
	int sum = getTot(3000, 2); // 선언된 메서드 활용
	id="himan";
	pass="7777";
	String result=login(id,pass);
%>
<body>

	<h2 align="center">물건명 : <%=pname %>, 총계:<%=sum %></h2>
	<h2 align="center">ID : <%=id %>, PASS : <%=pass %>, RESULT : <%=login(id, pass) %></h2>
	
	<%-- 
		ex) id, pass, login(id, pass) 인증여부 리턴, - declare 선언 
			위 변수 선언 및 할당 - scriptlet
			위 결과 내용 출력 - expression
	--%>
		
</body>
</html>