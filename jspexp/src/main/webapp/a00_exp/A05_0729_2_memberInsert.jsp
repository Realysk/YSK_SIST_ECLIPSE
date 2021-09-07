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
		document.querySelector("h3").innerText="A05_0729_memberlist에서 받아 온 회원 등록 페이지";
	}
</script>
</head>
<%-- 
# 화면등록 처리 프로세스
	1. 초기등록 화면 구성 : form 요소 객체와 함께. name="요청key" value="입력시요청값"
	2. 등록 버튼 클릭 시 화면 구성
	3. 요청 값을 기준으로 분리 처리
		1) DAO 등록 메서드 구현
		2) DAO 등록 메서드 호출
	4. JS 등록 완료 처리

--%>
<%
	boolean isInsert = false;
	String id = request.getParameter("id");
	if(id != null) { // 초기화면과 프로세스 분리
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String auth = request.getParameter("auth");
		String pointS = request.getParameter("point");
		
		Member ins = new Member(id,pass,name,auth,Integer.parseInt(pointS));
		
		System.out.println("등록 처리 : " + ins.getId());
		
		// DAO 기능 메서드 처리
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.insertMember(ins); 
		isInsert = true;
	}
%>
<body>
	<script type="text/javascript">
		var isInsert = <%=isInsert%>;
		if(isInsert) {
			if(confirm("등록이 완료되었습니다!\n 조회 페이지로 이동하시겠습니까?")) {
				location.href="A05_0729_1_memberList.jsp";
			}
		}
	</script>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th> PASS </th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><th> PASS Confirm </th><td><input type="password" id="passFrm" value=""/></td></tr>
		<tr><th> NAME </th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th> AUTH </th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th> POINT </th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>	
	
</body>
</html>