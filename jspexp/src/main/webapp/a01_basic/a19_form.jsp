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
		document.querySelector("h3").innerText="form 태그 전송";
	};

</script>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01" action="a20_rev.jsp">
	<table>
		<tr><th> 도서명 </th><th> 저자 </th></tr>
		<tr>
			<td><input type="text" name="booktitle" value=""/></td>
			<td><input type="text" name="writer" value=""/></td>
			<td colspan="3"><input type="submit" value="검색"/></td>
		</tr>
		<%--
			ex) a19_form.jsp
				도서명 : [   ]
				저자 : [   ]
				[확인]
				=> a20.rev.jsp 도서명 : @@@, 저자 : @@@
					입력이 안 된 경우 "입력 안됨"|"익명"으로 표현하여 출력하세요.
		 --%>
	</table>
	</form>
	
</body>
</html>