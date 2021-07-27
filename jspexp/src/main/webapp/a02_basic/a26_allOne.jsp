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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="한 페이지에서 요청 값 처리";
	};

</script>
</head>
<body>

	<%
		String priceS = request.getParameter("price");
	%>
	<h3 align="center"></h3>
	<%
		if(priceS==null) { // 초기 화면
	%>
	<form id="frm01">
	<table>
		<tr><th> 가격 </th><td><input type="text" name="price" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="10% 할인 금액"/></td></tr>
	</table>
	</form>
	<%
	} else { // 요청 값이 있는 화면
		int price = Integer.parseInt(priceS);
	%>
	<table>
		<tr><th> 가격 </th><td><%=price %></td></tr>
		<tr><th> 할인 금액 (20%) </th><td><%=(int)(price*0.8) %></td></tr>
	</table>
	<% } %>
	
</body>
</html>