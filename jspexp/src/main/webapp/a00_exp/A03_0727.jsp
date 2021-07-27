<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="07.27 정리 문제";
	};

</script>
</head>
<body>

		<h3></h3>
	<%--
		1. 요청값을 전달하는 url형식과 요청값을 받는 jsp 기능 메서드를 기술하세요.
		
		--%>
			<h4> [1] : 요청 값 전달 관련 문제 </h4>
			<table>
				<tr><th> URL 형식 </th><td> 요청페이지명.jsp?요청key=요청value&요청key2=요청value2... (query string) </td></tr>
				<tr><th> JSP 기능 메서드 </th><td> String 요청값할당변수 = request.getParameter("요청key"); </td></tr>
			</table><br>			
		<%--
		
		2. 아래의 요청값 전달 처리의 방식 기본예제를 코드하세요
		    0) 현재페이지 요청값 처리
		    1) a href 요청값 처리하기
		    2) 함수호출하여 location.href 객체활용하기
		
		--%>
			<h4> [2] : 요청 값 전달 처리 방식 </h4>
			<table>
				<tr><th> 현재 페이지 </th><td> 요청페이지명.jsp 로 이동 후 브라우저 URL에서 바로 '?요청key=요청value' 할당 </td></tr>
				<tr><th> a href </th><td> a href="요청페이지명.jsp?요청key=요청값" => 요청key=요청값 원하는 만큼 추가 할당 </td></tr>
				<tr><th> function 함수명(매개변수) {location.href=""} </th><td> input 태그 생성 => function 함수명(매개변수) {} 생성 => location.href = "요청페이지명.jsp?요청key=" 요청key + "&요청key2" + 요청key2... 할당 </td></tr>
			</table><br>			
		<%--		
		
		3. 아래와 같은 처리를 함수와 location.href를 통해서 요청 처리하세요.
		   id:[    ]
		   pass:[    ]
		   [로그인] ==> 로그인  
		   1단계) 로그인한 id:@@@ 패스워드 @@@  
		   2단계) 인증여부 성공/실패 (himan/7777)
		   3단계) 다음 페이지 js에서 alert으로 성공여부에 때라 main페이지 이동/login 페이지이동
		   hint) 다음페이지에서 location.href 활용
		   4단계) 다음 페이지에서 select * from member where id = ? and pass=? 를 통한 dao를 만든 후, dao 연동하여 인증여부처리 및 3단계의 페이지 이동 로직 처리.
		   
		--%>
			<h4> [3] : location.href 로그인 처리 [1~4단계] </h4>
			<h5> (1단계) '로그인' 버튼으로 요청 값 넘기기 </h5>
			<h5> (2단계) 'himan/7777'로 인증 여부 (성공/실패) </h5>
			<h5> (3단계) DAO 연동 후 인증 여부 및 3단계 페이지 이동 로직 </h5>
			<h5> (4단계) 다음 페이지 js에서 alert로 성공 여부에 따른 main/login페이지 이동 </h5>
			<table>
				<tr><th> ID </th><td><input type="text" name="id"/></td></tr>
				<tr><th> PW </th><td><input type="password" name="pw"/></td></tr>
				<tr><td colspan="2"><input type="button" value="로그인" onclick="login()"/></td></tr>
			</table><br>
			<script type="text/javascript">
					// 1단계
				function login() {
					var id = document.querySelector("[name=id]").value;
					var pw = document.querySelector("[name=pw]").value;
					
					location.href="A03_0727_receive.jsp?id="+id+"&pw="+pw;
				}
			</script>
		<%--
		 
	 --%>
	
</body>
</html>