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

</head>
<%-- 
# 
	// ex) 물건명:[    ] 가격:[select[1000~5000]] 갯수:[select[1~10]] 
	// 갯수를 선택했을 때, 하단에 구매 정보(물건명, 총계 @@ 를 출력) 1조 제출하고, 손들기(전체)

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("[name=price],[name=cnt]").change(function(){
			var pname = $("[name=pname]").val();
			var price = $("[name=price]>option:selected").text();
			var cnt = $("[name=cnt]").val(); // form 하위의 요소객체이기 때문에
			// 선택된 것을 값을 가져올 수 있다.
			$("#show").text("구매 정보 : "+pname+", 총계 : "+(price*cnt))
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th>
			<td>
				<select name="price">
					<%--
					해당 option에 대한 값은 value, 출력내용은 innerText
					                     val()          text()
					    value값이 선택되지 않을 때는 text()내용이 value값으로 처리된다.
					    결국 $("name=price").val();로 선택되어진 option이 처리가 된다.              
					 --%>
					<option value="0">가격선택</option>
					<option>1000</option>
					<option>2000</option> 
					<option>3000</option>
					<option>4000</option>
					<option>5000</option>
				</select>	
			</td></tr>
		<tr><th>갯수</th><td>
				<select name="cnt">
					<option  value="0">갯수선택</option>
					<%for(int cnt=1;cnt<=10;cnt++){%>
					<option><%=cnt%></option>
					<%}%>
				</select>		
		
		</td></tr>
		<tr><td colspan="2" id="show" style="text-align:center" ></td></tr>
	</table>	
	</form>
</body>
</html>