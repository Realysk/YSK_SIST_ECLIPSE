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
		document.querySelector("h3").innerText="a19_form에서 받은 데이터";
	};

</script>
<%
	String booktitle = request.getParameter("booktitle");
	if(booktitle==null) booktitle="입력 안됨";
	String writer = request.getParameter("writer");
	if(writer==null) writer="익명";
%>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th> 도서명 </th><th> 저자 </th></tr>
		<tr>
			<td><%=booktitle%></td>
			<td><%=writer%></td>
		</tr>
	</table>
	</form>
	
</body>
</html>