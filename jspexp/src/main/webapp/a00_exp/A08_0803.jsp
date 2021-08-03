<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="08.03 정리 문제";
	}
</script>
</head>
	<h3 align="center"></h3>
<%-- 
	1. 액션태그 중, include, forward의 차이를 기술하세요!
	
		<jsp:include page="포함될페이지"/> : 한 화면에서 포함 될 페이지를 처리
		<jsp:forward page="요청값을전달하고이동할페이지"/> : 요청 값 (key=value)을 함께 해당 페이지에 전달하면서 이동처리
	
	2. 예외페이지 기본처리 형식을 파일로 기술하세요.
	
		예외가 발생 할 가망성이 있는 페이지 : errorPage = "에러발생시처리페이지"
		에러가 발생 시 처리 페이지 : isErrorPage = "true"
		=> web.xml에서 전체 에러 페이지 지정으로 처리 가능.
	
	3. 서버, 클라이언트의 관계에서 임시 저장 객체 두가지를 기술하고, 그 중 client에 저장될 때, 핵심코드를 기술하세요.
	
		클라이언트(브라우저) ==(request)=> 서버
		클라이언트(브라우저) <==(response)= 서버
		이러한 데이터 전송에 있어서 서버와 클라이언트 간에 연결 된 상태(전제 조건)
		서버에 임시 데이터 저장 : session
		브라우저에 임시 데이터 저장 : cookie
	
	4. ID:[   ][로그인] 요청값을 받아 조건문과 forward 액션태그를 이용해서, himan이면 main.jsp 아니면 login.jsp페이지로 이동하게하세요
	
		--%>
		<%
			String id = request.getParameter("id");
			if(id!=null) {
				
			}
		%>
			<jsp:forward page="A08_0803_login.jsp"></jsp:forward>
			<form id="frm01" method="post">
			<table class="listTable">
				<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
				<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
			</table>	
			</form>
		<%--	
	
	5. 생성자 객체를 아이디, 패스워드, 이름, 기능메서드로 화면에 있는 테이블에 출력하게 선언하고, 아이디[   ] 패스워드[    ] 이름[    ][등록] ==> 클릭시 하단 테이블에 생성자 객체의 메소드 show() 테이블 출력



--%>

<body>

	<table class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>