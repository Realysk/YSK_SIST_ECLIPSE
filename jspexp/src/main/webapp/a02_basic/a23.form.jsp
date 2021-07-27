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
		document.querySelector("h3").innerText="a24_buy로 데이터 넘기기";
	};

</script>
</head>
<body>

	<h3></h3>
	<form id="frm01" action="a24_buy.jsp">
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th></tr>
		<tr>
			<td><input type="text" name="pname" value=""/></td>
			<td><input type="text" name="priceS" value=""/></td>
			<td><input type="text" name="cntS" value=""/></td>
			<td colspan="2"><input type="submit" value="구매"/></td>
		</tr>
	</table>
	</form>
	
</body>
</html>