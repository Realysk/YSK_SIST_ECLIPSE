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
		document.querySelector("h3").innerText="A03_0727에서 받아온 데이터";
	};

</script>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		A05_PreparedDao dao = new A05_PreparedDao();
		boolean isSucc = dao.login(id,pw);
	%>

	<h4> [A03_0727] JS를 통해 받아온 회원 정보 [EX] </h4>
	<table>
		<tr><th> ID </th><th> PW </th></tr>
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
		</tr>
		<tr><th colspan="2"> 인증 여부 </th>
		<tr><td colspan="2"> <%=isSucc?"로그인 성공":"로그인 실패"%> </td></tr>
	</table>
	<script type="text/javascript">
		<%--
		// JSP의 변수를 JS로 할당
		// 1. JSP가 먼저 처리되어야 하고
		// 2. JS는 최종 결과물을 화면에서 받아서 처리한다는 개념을 반드시 생각해야 한다.
		// 3. 데이터 처리 시 주의 사항
		//		1) boolean, 숫자형은 그대로 할당 가능
		//		2) 문자열형은 "<%=jsp변수%>", '<%=jsp변수%>'에 할당되어야 한다.
		// boolean값을 할당
		--%>
		var isSucc = <%=isSucc%>;
		if(isSucc) {
			alert("로그인 성공\n 메인페이지 이동");
			 //이동할 메인 페이지 지정
			 //location.href="메인페이지.jsp";
		} else {
			alert("로그인 실패\n 로그인 정보를 입력하세요.");
			 //로그인 페이지 이동
			location.href="A03_0727.jsp";
		}
	</script>
	
</body>
</html>