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
		document.querySelector("h3").innerText="a24_buy에서 받아온 데이터";
	};

</script>
</head>
<body>

	<h3></h3>	
<%
	String pname = request.getParameter("pname");
	if(pname==null) pname="";
	String priceS = request.getParameter("priceS");
	if(priceS==null) priceS="0";
	String cntS = request.getParameter("cntS");
	if(cntS==null) cntS="0";
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(cntS);
	
	// VO 객체에 할당 처리하기
	Product prod = new Product(pname, price, cnt);
	// DAO 연계하여 매개변수로 전달

%>
	
	<form id="frm01">
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th><th> 총계 </th></tr>
		<tr>
			<td><%=prod.getName()%></td>
			<td><%=prod.getPrice()%></td>
			<td><%=prod.getCnt()%></td>
			<td><%=prod.getPrice() * prod.getCnt()%></td>
		</tr>
	</table>
	</form>
	
</body>
</html>