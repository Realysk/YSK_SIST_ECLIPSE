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
		document.querySelector("h3").innerText="사원정보 조회";
	}
</script>
</head>
<%-- 
 # 조회 화면
 	CRUD(Create, Read, Update, Delete) 처리
 		1. Create 입력
 			1) 기능 버튼 선언 (등록) : 클릭 시 등록 화면으로 이동
 			2) 등록 화면 구현 : 사원명, 직책명, 관리자번호, 입사일, 급여, 보너스, 부서명
 			3) 등록 처리 할 DAO 기능 메서드 구현
 			4) 등록 화면에서 등록 버튼 클릭 시 DAO 등록 메서드 호출 처리 - 처리 후 전체 조회 화면으로 이동/계속 등록 할지 여부(confirm) 선택적으로 처리
 			5) 

--%>
	<%
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		
		if(ename == null) ename = "";
		if(job == null) job = "";
	
		A05_PreparedDao dao = new A05_PreparedDao();
		ArrayList<Emp> elist = dao.getPreparedEmpList(new Emp(ename, job));
	%>
<body>

	<script type="text/javascript">
		function regEmp() {
			alert("등록 페이지로 이동합니다.");
			location.href="a30_empInsert.jsp";
		}
		
		/*
		 # 상세화면 처리
		 	1. 행을 클릭 시 empno를 함수를 통해서 전달하고
		 	2. 해당 함수는 location.href="상세화면?empno=받은empno"로 처리한다.	 
		*/
		
		function goDetail(empno) {
			alert(empno + "번 사원의 상세 화면으로 이동합니다.");
			location.href="a33_empDetail.jsp?empno="+empno;
		}
		
	</script>

	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> 사원명 </th><td><input type="text" name="ename" value="<%=ename%>"/></td></tr>
		<tr><th> 직책 </th><td><input type="text" name="job" value="<%=job%>"/></td></tr>
		<tr><td colspan="2">
				<input type="submit" value="검색"/>
				<input type="button" onclick="regEmp()" value="등록"/>
			</td>
		</tr>
	</table>	
	</form>

	<table>
		<tr>
			<th>사원번호</th><th>사원명</th><th>직책</th>
			<th>관리자번호</th><th>입사일</th><th>급여</th>
			<th>보너스</th><th>부서번호</th>
		</tr>
		<%for(Emp e:elist) { %>
		<tr ondblclick="goDetail(<%=e.getEmpno()%>)">
			<td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getJob() %></td>
			<td><%=e.getMgr() %></td>
			<td><%=e.getHiredate() %></td>
			<td><%=e.getSal() %></td>
			<td><%=e.getComm() %></td>
			<td><%=e.getDeptno() %></td>
		</tr>
		<% } %>
	</table>	
	
</body>
</html>