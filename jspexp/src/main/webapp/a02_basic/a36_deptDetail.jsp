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
		document.querySelector("h3").innerText="부서정보 상세 화면";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	String deptnoS = request.getParameter("deptno");
	Dept dept = null;
	if(deptnoS != null) { // 요청 값이 있을 때 처리
		A05_PreparedDao dao = new A05_PreparedDao();
		dept = dao.getDept(Integer.parseInt(deptnoS));
	}
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> 부서 번호 </th><td><input type="text" name="deptno" value="<%=dept.getDeptno()%>"/></td></tr>
		<tr><th> 부서명 </th><td><input type="text" name="dname" value="<%=dept.getDname()%>"/></td></tr>
		<tr><th> 부서 위치 </th><td><input type="text" name="loc" value="<%=dept.getLoc()%>"/></td></tr>
		<tr><td colspan="2">
			<input type="button" id="uptBtn" value="수정"/>
			<input type="button" id="delBtn" value="삭제"/>
			<input type="button" id="goMain" value="메인"/>
		</td></tr>
	</table>
	</form>
	<script type="text/javascript">
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick=function() {
			if(confirm("해당 내용으로 수정하시겠습니까?")) {
				var formObj = document.querySelector("form");
				formObj.action="a37_deptUptProc.jsp";
				formObj.submit();
			}
		}
		
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick=function() {
			if(confirm("해당 내용을 삭제하시겠습니까?ㄴ")) {
				var deptno = document.querySelector("[name=deptno]").value;
				location.href="a38_deptDelProc.jsp?deptno="+deptno;
			}
		}		
		
	</script>
</body>
</html>