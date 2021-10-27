<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	td{text-align:center;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<%-- 
# 
6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
   no  점수
--%>

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
	<table width="30%" align="center" id="show" class="listTable">
		<thead><tr><th>번호</th><th>점수</th></tr></thead>
		<tbody></body>
	</table>	
	
</body>
</html>