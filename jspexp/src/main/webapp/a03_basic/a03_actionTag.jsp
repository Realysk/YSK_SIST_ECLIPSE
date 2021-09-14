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

// a01_com.css 사용 시, table 태그에 class=listTable 사용

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="포함 하는 페이지";
	}
</script>
</head>
<%-- 
# 액션 태그
	1. 외부 페이지를 JSP 단위로 포함시키거나 페이지를 조건에 따라서 이동처리할 때 사용되는 것이 action 태그이다.
	2. include 액션 태그
		외부에 공통 페이지를 jsp 단위로 가지고 와서 사용할 때 활용 된다.
	3. 각 액션 태그로 포함 된 페이지는 따로 JAVA가 만들어져서 사용되는 것이다.

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<jsp:include page="a04_include.jsp"></jsp:include>
	
</body>
</html>