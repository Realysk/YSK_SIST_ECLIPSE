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
		$("[name=price], [name=cnt]").change(function() {
			var pname = $("[name=pname]").val();
			var price = $("[name=price] > option:selected").text();
			var cnt = $("[name=cnt]").val(); // form 하위의 요소객체이기 때문에 선택된 것을 값을 가져올 수 있다.
			$("#show").text("구매 정보 : " + pname + ", 총계 : " + (price*cnt));
		});
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
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th>
			<td>
				<select name="price">
					<%--
					해당 option에 대한 값은 value, 출력내용은 innerText
										val()			text()
						value값이 선택되지 않을 때는 text() 내용이 value값으로 처리된다.
						결국 $("name=price").val();로 선택되어진 option이 처리가 된다.
					 --%>
					<option value="0">가격선택</option>
					<option>1000</option>
					<option>2000</option>
					<option>3000</option>
					<option>4000</option>
					<option>5000</option>
				</select>
			</td>
		</tr>
		<tr><th>수량</th>
			<td>
				<select name="cnt">
					<option value="0">수량선택</option>
					<%for(int cnt=1; cnt<=10; cnt++) { %>
					<option><%=cnt%></option>
					<% } %>
				</select>
			</td>
		</tr>
		<tr><td colspan="2" id="show"></td></tr>
	</table>	
	</form>
	
</body>
</html>