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
		document.querySelector("h3").innerText="부서정보 수정";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	boolean isUpdate = false;
	String deptnoS = request.getParameter("deptno");
	if(deptnoS != null) {
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.updateDept(new Dept(Integer.parseInt(deptnoS), dname, loc));
		isUpdate = true;
	}
%>
<body>

	<script type="text/javascript">
		var isUpdate = <%=isUpdate%>;
		alert("수정이 완료되었습니다.");
		location.href="a36_deptDetail.jsp?deptno=<%=deptnoS%>";
	</script>

	<h3 align="center"></h3>
	<h2> 수정 KEY : <%=deptnoS %></h2>
	
</body>
</html>