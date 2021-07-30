<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
%>
<%
//[jspexp] 프로젝트에 사용
//	import="jspexp.z02_vo.*" : VO import
//	import="jspexp.z01_database.*" : DAO import 

//[YSK_SIST] 프로젝트에 사용
//	import="Project_SIST.Java.*" : VO, DAO import

//공통 사용
//	import="java.util.*" : 내장 객체 import
//	import="java.sql.*" : DB 연동 객체 import

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
		document.querySelector("h3").innerText="07.30 정리 문제";
	}
</script>
</head>
	<h3 align="center"></h3>
<%--
	1. 리스트 된 화면의 특정 키를 통해 상세화면에 전송처리하는 JS를 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> [1] 리스트 된 화면의 특정 KEY를 통해 상세 화면에 전송하는 JS 기술 </th></tr>
			<tr><th> JS </th><td> location.href="요청KEY 페이지.jsp?변수명=<%="변수명"%>"; </td></tr>
		</table><br><hr>
		</form>		
	<%--
	
	2. 상세 화면에서 받은 KEY를 요청값을 이용해서, 요청값을 받았을 때, 처리할 프로세스를 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> [2] 상세 화면에서 받은 KEY를 요청 값을 이용하여 받았을 때 처리할 프로세스 </th></tr>
			<tr><th> 프로세스 </th><td>  </td></tr>
		</table><br><hr>
		</form>			
	<%--	
	
	3. 요청값을 기준으로 DAO에 단일 데이터를 처리하여 form하위 input에 할당하는 프로세스를 순서로 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> [3] 요청 값 기준 DAO에 단일 데이터를 처리하여 form 하위 input에 할당하는 프로세스 </th></tr>
			<tr><th> 프로세스 </th><td>  </td></tr>
		</table><br><hr>
		</form>			
	<%--	
	
	4. 상세화면을 특정한 내용을 변경 후, 처리하는 프로세스를 파일명 기준으로 하여 핵심 코드를 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> [4] 상세 화면을 특정 내용으로 변경 후 처리하는 프로세스 (파일명 기준) </th></tr>
			<tr><th> 프로세스 </th><td>  </td></tr>
		</table><br><hr>
		</form>			
	<%--	
	
	5. 회원리스트 화면에서 상세화면 처리 및 수정 처리 하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> [5] 회원리스트 화면에서 상세 화면 처리 및 수정 </th></tr>
			<tr><th> 프로세스 </th><td>  </td></tr>
		</table><br><hr>
		</form>			
	<%--	
	
--%>

<%

%>
<body>

</body>
</html>