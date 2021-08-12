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
# ex) request 범위로 데이터(물건명,가격,수량)를 설정해서 a04_requestPage.jsp에서 데이터를 확인할 수 있게 처리하세요.

--%>
<%
	request.setAttribute("prod", new Product("사과",3000,2));

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("request 예제");
	});

</script>
<body>

	<jsp:forward page="a04_requestPage.jsp"/>
	<%
		/*
		선택적으로
	 	RequestDispatcher rd = request.getRequestDispatcher("a04_requestPage.jsp");
		rd.forward(request, response);
		*/
	%>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><%=request.getAttribute("pname") %></td></tr>
		<tr><th>가격</th><td><%=request.getAttribute("price") %></td></tr>
		<tr><th>수량</th><td><%=request.getAttribute("cnt") %></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
</body>
</html>