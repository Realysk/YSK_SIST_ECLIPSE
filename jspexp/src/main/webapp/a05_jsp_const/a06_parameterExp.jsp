<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<%--
		ex) 다음 화면 요청결과값까지 출력하세요.
			이름 : [   ]
			성별 : ()남 ()여
			좋아하는 동물 : []강아지 []고양이 []돼지 []기타
				[전송]
	--%>
	<form id="frm01" method="post">
	<table align="center" style="text-align:center" class="listTable">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value=""/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="genders" value="남"/>남
				<input type="radio" name="genders" value="여"/>여
			</td>
		</tr>
		<tr>
			<th>좋아하는동물</th>
			<td>
				<input type="checkbox" name="likeAnimals" value="강아지"/>강아지
				<input type="checkbox" name="likeAnimals" value="고양이"/>고양이
				<input type="checkbox" name="likeAnimals" value="돼지"/>돼지
				<input type="checkbox" name="likeAnimals" value="기타"/>기타
			</td>
		</tr>
		<tr><td colspan="3"><input type="submit" value="전송"/></td></tr>
	</table>	
	</form>
	<%
		String name = request.getParameter("name");
		String genders[] = request.getParameterValues("genders");
		String likeAnimals[] = request.getParameterValues("likeAnimals");
	%>
	<% if(name!=null) { %>
	<table align="center" class="listTable">
		<tr><th>이름</th><td><%=name %></td></tr>
		<% for(int idx=0; idx<genders.length; idx++) { %>
		<tr><th>성별</th><td><%=genders[idx] %></td></tr>
		<% } %>
		<% for(int idx=0; idx<likeAnimals.length; idx++) { %>
		<tr><th>좋아하는동물 <%=idx+1 %></th><td><%=likeAnimals[idx] %></td></tr>
		<% } %>
	</table>
	<% } %>	
	
</body>
</html>