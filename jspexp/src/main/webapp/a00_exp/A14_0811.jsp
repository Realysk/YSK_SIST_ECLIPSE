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
# 정리문제
	1. [JSP] directive 종류를 기술하세요.
	
		language, contentType, pageEncoding, import
	
	2. [JSP] script의 종류 3가지를 기술하고, 간단한 예제로 출력까지 하세요.
	
		1) declaration : <%! %> ex) java class 바로 밑 선언 부분
		2) scriptlet : <% %> ex) java main() 있는 부분
		3) expression : <%= %> ex) java main()안에 System.out.println();		
	
	3. [JSP] request와 response객체를 서버/클라이언트 관점에서 기술하세요.
	
		http://localhost:7080/jspexp/index.jsp
			1) request.getRemoteAddr() : 웹 서버에 연결한 클라이언트의 IP 주소를 구한다.
			2) request.getMethod() : 웹 브라우저가 정보를 전송할 때 사용한 방식을 구한다.
			3) request.getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다. ex) jspexp/index.jsp
			4) request.getContextPath() : JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다. ex) jspexp
			5) request.getServerName() : 연결할 때 사용한 서버 이름을 구한다. ex) localhost
			6) request.getServerPort() : 서버가 실행 중인 포트 번호를 구한다. ex) 7080	
	
	4. 아래 내용은 어떤 filter선택자를 활용할 것인가를 기술하세요.
	    성별 :()남자()여자 [등록]
	    관리자[   ] 일반사용자[    ] [관리자활성화][일반사용자활성화]
	    취미 :[]운동[]게임[]독서[]음악 [취미등록]
	
	
	
	5. 아래와 같은 화면을 연산자를 선택시, 계산결과를 출력하는 프로그램을 만들세요.
	    [    ][select연산자][     ]
	    결과 :  @@ X @@ = @@
	
	
	
	6. 학생의 성적이 리스트되는 화면에서 검색할 행(필터객체를 확인)의 배경색상을 표기해주는 프로그램을 작성하세요.(1단계-해당데이터td,2단계-해당포함tr)
	    검색내용 [    ][검색]
	    no  이름  국어 영어 수학
	    1   @@@  @@  @@ @@@
	    2   @@@  @@  @@ @@@
	    3   @@@  @@  @@ @@@
	
	
	
	7. 전날 다운 받은 이미지와 속성을 활용해서 해당 기능을 처리하세요
	    [이미지]  [select-이미지변경][커져라][작아져라]


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