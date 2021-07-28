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
		document.querySelector("h3").innerText="<form method=post>";
	};

</script>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> 사원명 </th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<%
		String ename = request.getParameter("ename");
		if(ename!=null) {
	%>
	<h2> post 방식으로 받은 데이터</h2>
	<table>
		<tr><th> 사원명 </th><td><%=ename %></td></tr>
	</table><br>
	<% } %>
	
	<%-- ex) 구매할 도서명 가격 수량을 입력하여 출력하세요. (POST 방식) --%>
	<form method="post">
	<table>
		<tr><th> 도서명 </th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th> 가격 </th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th> 수량 </th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>
	</form>
	<%
		String bname = request.getParameter("bname");
		if(bname!=null) {
			int price = Integer.parseInt(request.getParameter("price"));
			int cnt = Integer.parseInt(request.getParameter("cnt"));
	%>
	<form>
	<h2> 구매 내역 </h2>
	<table>
		<tr><th> 도서명 </th><td><%=bname %></td></tr>
		<tr><th> 가격 </th><td><%=price %></td></tr>
		<tr><th> 수량 </th><td><%=cnt %></td></tr>
		<tr><th> 총계 </th><td><%=price*cnt %></td></tr>
	</table><br>
	<% } %>
	</form>
	
</body>
</html>