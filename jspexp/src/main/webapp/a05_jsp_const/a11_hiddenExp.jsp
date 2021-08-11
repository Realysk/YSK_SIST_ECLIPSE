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

</head>
<%-- 
# 

--%>
<%

%>
<body>

	<%--
		ex) [ @@ ] [ @@ ]
			[+][-][*][/] 클릭 시, hidden으로 정해진 연산자로 아래에요청 결과 값으로 출력하세요.
	--%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("연산자 처리");
		$("[type=button]").click(function() {
			if($(this).val()=="+") $("[name=cal]").val(0);
			if($(this).val()=="-") $("[name=cal]").val(1);
			if($(this).val()=="*") $("[name=cal]").val(2);
			if($(this).val()=="/") $("[name=cal]").val(3);
			$("form").submit();
		});
	});

</script>
	<form id="frm01" method="post">
		<input type="hidden" name="cal"/>
	<table align="center" style="text-align:center" class="listTable">
		<tr>
			<td>
				<input type="text" name="num01" value="0" size="2"/>
				<input type="text" name="num02" value="0" size="2"/>
			</td>
		</tr>
		<tr><td colspan="2">
				<input type="button" value="+"/>
				<input type="button" value="-"/>
				<input type="button" value="*"/>
				<input type="button" value="/"/>
			</td>
		</tr>
	</table>
	</form>
	<%
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num02");
		String calIdxS = request.getParameter("cal");
		
		if(num01S != null) {
			int num01 = Integer.parseInt(num01S);
			int num02 = Integer.parseInt(num02S);
			int calIdx = Integer.parseInt(calIdxS);
			String cal[] = {"+", "-", "*", "/"};
			int res[] = {num01+num02, num01-num02, num01*num02, num01/num02};
	%>
	<h3 align="center"><%=num01%> <%=cal[calIdx] %> <%=num02 %> = <%=res[calIdx] %></h3>
	<% } %>
	
</body>
</html>