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
		$("h2").text("선택 select");
		// change() : 특정한 option의 선택을 변경을 했을 때 처리되는 이벤트
		$("select").change(function() {
			var data = $(":selected").text(); // select 하위에 선택 된 option의 text
			var data2 = $(":selected").val(); // select 하위에 선택 된 option의 val
			$("#show").text(data + " : " + data2);
		});
	});
	
	// ex) 물건명 : [   ] 가격:[select[1000~5000]] 수량 : [select[1~10]] 수량을 선택했을 때 하단에 구매 정보(물건명, 총계)를 출력.
	
	$(document).ready(function() {
		$("select > #price").change(function() {
			var pname = $("#pname").text();
			var price = $("#selPrice").text();
			var cnt = $("#selCnt").text();
			$("#show2").text("구매정보 : " + pname + ", 총계 : " + (price*cnt));
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
	<table align="center" width="30%" class="listTable">
		<tr><th> 선택 </th>
			<td><select name="phone">
					<option value="1"> 070 </option>
					<option value="2" selected> 010 </option>
					<option value="3"> 02 </option>
					<option value="4"> 031 </option>
				</select>
			</td>
		</tr>
		<tr><td colspan="2" id="show" style="text-align:center"></td></tr>
	</table>	
	</form><br>
	
	<form id="frm01" method="post">
	<table align="center" width="30%" class="listTable">
		<tr><th> 물건명 </th>
			<td><input type="text" name="pname"/></td></tr>
			
		<tr><th> 가격 </th>
			<td><select name="price">
					<option id="selPrice" selected> 1000 </option>
					<option> 2000 </option>
					<option> 3000 </option>
					<option> 4000 </option>
					<option> 5000 </option>
				</select>
			</td>
		</tr>
		
		<tr><th> 수량 </th>
			<td><select name="cnt">
					<option id="selCnt" selected> 1 </option>
					<option> 2 </option>
					<option> 3 </option>
					<option> 4 </option>
					<option> 5 </option>
					<option> 6 </option>
					<option> 7 </option>
					<option> 8 </option>
					<option> 9 </option>
					<option> 10 </option>
				</select>
			</td>
		</tr>
		
		<tr><td colspan="3" id="show2" style="text-align:center"></td></tr>
	</table>	
	</form><br>
	
</body>
</html>