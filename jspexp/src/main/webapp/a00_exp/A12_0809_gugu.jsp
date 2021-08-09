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
		$("h2").text("구구단");
	});
	
	var msg = "${msg}";
	if(msg != "") {
		alert(msg);
	}

</script>
</head>
<%-- 
# 구구단 [   ] X [   ] 정답 :[   ] [확인]

--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" width="50%" class="listTable">
		<tr><th><input type="text" name="grade" size="1" value="${grade}"/> 
				X 
				<input type="text" name="cnt" size="1" value="${cnt}"/>
			</th> <%-- controller에서 넘겨 준 데이터 --%>
			<td style="text-align:center"><input type="text" name="inReply" size="2" value="0"/></td>
		</tr>
		<tr><td colspan="2" style="text-align:center"><input type="submit" value="확인"/></td></tr>
	</table>	
	</form>
	
</body>
</html>