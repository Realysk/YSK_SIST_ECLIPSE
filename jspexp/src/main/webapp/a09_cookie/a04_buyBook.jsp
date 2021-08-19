<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
	import="java.net.*"	
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
ex) a04_buyBook.jsp (구매할 도서 - 구매처리 - 쿠키에 담기) 도서명, 가격
	a05_CartBook.jsp (현재 카트에 담기 도서)

--%>
<%
	String bkName = request.getParameter("bkName");
	String price = request.getParameter("price");
	if(bkName != null) {
		response.addCookie(new Cookie(bkName, price));
		response.sendRedirect("a05_CartBook.jsp");
	}
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("도서 구매");
	});

</script>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>도서명</th><td><input type="text" name="bkName" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="장바구니"/></td></tr>
	</table>	
	</form>
	
</body>
</html>