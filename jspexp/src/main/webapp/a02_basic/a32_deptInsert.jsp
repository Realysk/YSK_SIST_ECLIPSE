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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	String deptnoS = request.getParameter("detpno");
	String dname = request.getParameter("dname"); if(dname == null) dname="";
	String loc = request.getParameter("loc"); if(loc == null) loc="";
	boolean isInsert = false;
	if(deptnoS!=null) {
		Dept ins = new Dept(Integer.parseInt(deptnoS), dname, loc);
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.insertDept(new Dept(Integer.parseInt(deptnoS),dname, loc));
		System.out.println("입력 할 부서 객체 : " + ins);
		isInsert = true;		
	}
	
	
%>
<body>
	<script type="text/javascript">
		var isInsert = <%=isInsert%>;
		if(isInsert) {
			if(confirm("등록 성공\n 메인화면 이동?")) {
				location.href="a31_deptList.jsp";
			}
		}
	</script>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> 부서번호 </th><td><input type="text" name="deptno" value=""/></td></tr>
		<tr><th> 부서명 </th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th> 부서위치 </th><td><input type="text" name="loc" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>	
	
</body>
</html>