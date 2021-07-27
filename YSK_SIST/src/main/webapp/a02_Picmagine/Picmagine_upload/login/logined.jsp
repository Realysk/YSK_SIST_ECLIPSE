<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDAO"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDTO"
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PICMAGINE 로그인 : 회원 정보 확인 </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="로그인 정보";
	};

</script>
</head>
<body>

	<%
		String memid = request.getParameter("memid");
		String mempw = request.getParameter("mempw");
		JOINDAO dao = new JOINDAO();
		boolean isSucc = dao.Logined(memid,mempw);
	%>

	<h3 align="center"></h3>
	<h4> * 로그인 조회 * </h4>
	<table>
		<tr><th> ID </th><th> PW </th></tr>
		<tr>
			<td><%=memid %></td>
			<td><%=mempw %></td>
		</tr>
		<tr><th colspan="2"> 인증 여부 </th>
		<tr><td colspan="2"> <%=isSucc?"로그인 성공":"로그인 실패"%> </td></tr>
	</table>
	<script type="text/javascript">
		var isSucc = <%=isSucc%>;
		if(isSucc == true) {
			alert(memid + "님 로그인 되었습니다!");
			 //이동할 메인 페이지 지정
			 location.href="../logout_main.html";
		} else {
			alert("로그인 정보가 일치하지 않습니다. 다시 입력하세요.");
			location.href="login.jsp";
		}
	</script>

</body>
</html>