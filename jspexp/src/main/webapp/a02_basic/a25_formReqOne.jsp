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

	<h3></h3>
	<form id="frm01">
	<table>
		<tr><th> 가격 </th><td><input type="text" name="priceS" value=""/></td></tr>
		<tr><th> 수량 </th><td><input type="text" name="cntS" value=""/></td>
		<tr><td colspan="2"><input type="submit" value="총계"/></td></tr>
		</tr>
	</table>
	</form>
	<%--
		1. 초기 화면에 나타날 내용
		2. 요청 값에서 처리할 내용
		3. 요청 값이 초기화면/요청되었을 때 데이터를 구분해서 어떤 처리가 필요한지 생각하여 코딩
	 --%>
	 <%
	 	String priceS = request.getParameter("price");
	 	String cntS = request.getParameter("cnt");
	 	System.out.println("가격 : " + priceS);
	 	System.out.println("수량 : " + cntS);
	 	
	 	if(priceS==null) { // 초기 화면
	 		priceS="0"; // 에러가 발생하지 않게 처리.
	 	}
	 	if(cntS==null) { // 초기 화면
	 		cntS="0"; // 에러가 발생하지 않게 처리.
	 	}
	 	
	 	int price = Integer.parseInt(priceS);
	 	int cnt = Integer.parseInt(cntS);
	 %>
	 
	 <%if(request.getParameter("price") != null) { %> <%-- 초기화면과 구분 --%>
	 	<h2 align="center"><%=price*cnt%></h2>
	 <% } %>
	
</body>
</html>