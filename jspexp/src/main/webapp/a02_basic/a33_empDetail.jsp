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
		document.querySelector("h3").innerText="사원정보 상세 화면";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	String empnoS = request.getParameter("empno");
	Emp emp = null;
	if(empnoS != null) { // 요청 값이 있을 때 처리
		A05_PreparedDao dao = new A05_PreparedDao();
		emp = dao.getEmp(Integer.parseInt(empnoS));
	}
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> 사원 번호 </th><td><input type="text" name="empno" value="<%=emp.getEmpno()%>"/></td></tr>
		<tr><th> 사원명 </th><td><input type="text" name="ename" value="<%=emp.getEname()%>"/></td></tr>
		<tr><th> 관리자 번호 </th><td><input type="text" name="mgr" value="<%=emp.getMgr()%>"/></td></tr>
		<tr><th> 입사일 </th><td><input type="text" name="hiredateS" value="<%=emp.getHiredate()%>"/></td></tr>
		<tr><th> 급여 </th><td><input type="text" name="sal" value="<%=emp.getSal()%>"/></td></tr>
		<tr><th> 보너스 </th><td><input type="text" name="comm" value="<%=emp.getComm()%>"/></td></tr>
		<tr><th> 부서 번호 </th><td><input type="text" name="deptno" value="<%=emp.getDeptno()%>"/></td></tr>
		<tr><td colspan="2">
			<input type="button" id="uptBtn" value="수정"/> <%-- 부서정보 상세 Dao 화면 처리 --%>
			<input type="button" id="delBtn" value="삭제"/>
			<input type="button" id="goMain" value="조회"/>
		</td></tr>
	</table>
	</form>
	
</body>
</html>