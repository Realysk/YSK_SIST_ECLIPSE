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
 ex) 부서정보 등록 처리하기
 	1. 기존 부서정보 리스트 출력
 	2. 등록 버튼 및 부서정보 등록 화면 출력
 	3. 부서정보 입력 시 요청 값 처리 및 VO 객체 만들기
 	4. DAO 연동 부서정보 완료 및 초기화면 이동
 	
 	부서리스트 화면
 	1) 버튼
 	2) 이벤트 함수 - location.href="부서등록화면";
 	
 	부서등록화면
 	1) 등록화면 구성
 	2) 요청값 처리
 	3) 등록을 위한 요청값을 VO 만들기
--%>
	<%
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		if(dname == null) dname = "";
		if(loc == null) loc = "";
	
		A05_PreparedDao dao = new A05_PreparedDao();
		List<Dept> dlist = dao.getDeptList(new Dept(0,dname,loc));
	%>
<body>
	<h3 align="center"></h3>
	<script type="text/javascript">
		function regDept() {
			if(confirm("등록화면이동")) {
				location.href="a32_deptInsert.jsp";
			}
		}
	</script>
 	<form method="post"> <!-- 해당 키워드로 검색 -->
		<table>
			<tr><th> 부서명 </th><td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
			<tr><th> 부서위치 </th><td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
			<tr><td colspan="2">
					<input type="submit" value="검색"/>
					<input type="button" onclick="regDept()" value="등록"/>
				</td>
		</table>
	</form>
	<table>
		<tr><th> 부서번호 </th><th> 부서명 </th><th> 부서위치 </th></tr>
		<%for(Dept d:dlist) { %>
		<tr>
			<td><%=d.getDeptno() %></td>
			<td><%=d.getDname() %></td>
			<td><%=d.getLoc() %></td>
		</tr>		
		<% } %>
	</table>
	
</body>
</html>