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
		document.querySelector("h3").innerText="a24_buy에서 받아온 데이터";
	};

</script>
</head>
<body>

	<h3></h3>	
<%
	String pname = request.getParameter("pname");
	if(pname==null) pname=""; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	String priceS = request.getParameter("priceS");
	if(priceS==null) priceS="0"; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	String cntS = request.getParameter("cntS");
	if(cntS==null) cntS="0"; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(cntS);
	int tot = price * cnt;

%>
	
	<form id="frm01">
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th><th> 총계 </th></tr>
		<tr>
			<td><%=pname%></td>
			<td><%=price%></td>
			<td><%=cnt%></td>
			<td><%=tot%></td>
		</tr>
	</table>
	</form>
	
</body>
</html>