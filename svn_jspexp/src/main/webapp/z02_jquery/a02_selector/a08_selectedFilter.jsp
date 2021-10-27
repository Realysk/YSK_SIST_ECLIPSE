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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("선택 select");
		// change() : 특정한 option의 선택을 변경을 했을 때, 처리되는 이벤트..
		$("select").change(function(){
			// $(":selected") :
			var data = $(":selected").text(); // select 하위에 선택된 option의 text
			var data2 = $(":selected").val(); // select 하위에 선택된 option의 text
			$("#show").text(data+":"+data2);
		});
	});
	// ex) 물건명:[    ] 가격:[select[1000~5000]] 갯수:[select[1~10]] 
	// 갯수를 선택했을 때, 하단에 구매 정보(물건명, 총계 @@ 를 출력) 1조 제출하고, 손들기(전체)
</script>
</head>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" width="30%" class="listTable">
		<tr><th>선택</th><td>
			<select name="phone">
				<option value="1">070</option>
				<option value="2" selected>010</option>
				<option value="3">02</option>
				<option value="4">031</option>
			</select>
		</td></tr>
		<tr><td colspan="2" id="show" style="text-align:center" ></td></tr>
	</table>	
	</form>
</body>
</html>