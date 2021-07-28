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
		document.querySelector("h3").innerText="A04_0728에서 받아온 데이터 [EX - 온라인 영화 예약시스템]";
	};

</script>
</head>
<body>

	<h3></h3>	
<%
	String movie = request.getParameter("movie");
	if(movie==null) movie="";
	String movNumS = request.getParameter("movNumS");
	if(movNumS==null) movNumS="0";
	String mPriceS = request.getParameter("mPriceS");
	if(mPriceS==null) mPriceS="0";
	String mClockS = request.getParameter("mClockS");
	if(mClockS==null) mClockS="0";
	int movNum = Integer.parseInt(movNumS);
	int mPrice = Integer.parseInt(mPriceS);
	// int mClock = Integer.parseInt(mClockS);
%>
	
	<form id="frm01">
	<table>
		<tr><th> 영화 제목 </th><th> 입장 인원 </th><th> 입장료 </th><th> 상영 시간 </th><th> 총계 </th></tr>
		<tr>
			<td><%=movie %></td>
			<td><%=movNum %></td>
			<td><%=mPrice %></td>
			<td><%=mClockS %></td>
			<td><%=movNum * mPrice %></td>
		</tr>
	</table>
	</form>
	
</body>
</html>