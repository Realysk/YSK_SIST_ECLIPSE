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
	Product prod = (Product) request.getAttribute("prod");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("요청객체범위(request)");
	});

</script>
<body>

	<h2 align="center"></h2>
	<%
	if(prod!=null) {
	%>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><%=prod.getName() %></td></tr>
		<tr><th>가격</th><td><%=prod.getPrice() %></td></tr>
		<tr><th>수량</th><td><%=prod.getCnt() %></td></tr>
	</table>
	<% } %>
	<%-- el을 활용해서 이전 페이지에서 선언한 request.setAttribute("prod"...) 이름으로 property로 사용 가능하다. --%>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.name}</td></tr>
		<tr><th>가격</th><td>${prod.price}</td></tr>
		<tr><th>수량</th><td>${prod.cnt}</td></tr>
	</table>

		
</body>
</html>