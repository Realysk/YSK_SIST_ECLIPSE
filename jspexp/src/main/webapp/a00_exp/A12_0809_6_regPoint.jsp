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
	var arry = [];
	$(document).ready(function(){
		$("h2").text("점수등록");
		
		$("#regBtn").click(function(){
			var point = $("input[name=point]").val();
			arry.push(point);
			showTab();
		});
		// 내림차순..
		$("#desBtn").click(function(){
			arry = arry.sort(function(left,right){	return right-left;});
			showTab();
		});
		$("#ascBtn").click(function(){
			arry = arry.sort(function(left,right){	return left-right;});
			showTab();
		});
		
	});
	function showTab(){
		var show="";
		arry.forEach(function(point, idx, arr){
			show+="<tr ><td>"+(idx+1)+"</td><td>"+point+"</td></tr>";
		});
		$("#show>tbody").html(show);
	}
</script>
</head>
<%-- 
# 6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
	 no  점수

--%>
<body>

	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>등록점수</th><td><input type="text" name="point" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="button" id="regBtn" value="등록" />
			<input type="button" id="desBtn" value="내림차순정렬" />
			<input type="button" id="ascBtn" value="오름차순정렬" />
			</td></tr>
	</table>	
	</form>
	<table width="30%" align="center" style="text-align:center" id="show" class="listTable">
		<thead><tr><th>번호</th><th>점수</th></tr></thead>
		<tbody></body>
	</table>	
	
</body>
</html>