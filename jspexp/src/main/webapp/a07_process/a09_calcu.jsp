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
계산기 숫자1[   ] 숫자2[   ] 연산자 [select ] 
--%>
<%
	String goPage = request.getParameter("cal");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("[name=cal]").change(function(){
			$("form").submit();
		});
	});
</script>
<body>
	<%if(goPage!=null&&!goPage.equals("")){ %>
		<jsp:forward page="<%=goPage%>"/>
	<%}%>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>숫자1</th><td><input type="text" name="num01" value="0"/></td></tr>
		<tr><th>숫자2</th><td><input type="text" name="num02" value="0"/></td></tr>
		<tr><th>연산자</th>
		<td>
			<select name="cal">
				<option value=""> 연산자 선택 </option>
				<option value="a10_plus.jsp"> + </option>
				<option value="a11_minus.jsp"> - </option>
				<option value="a12_multi.jsp"> * </option>
				<option value="a13_divide.jsp"> / </option>
			</select>	
		</td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
<%--
		a09_calcu.jsp
		a10_plus.jsp    @@ + @@ = @@ 
		a11_minus.jsp    @@ - @@ = @@ 
		a12_multi.jsp    @@ * @@ = @@ 
		a13_divide.jsp    @@ / @@ = @@ 

--%>
</body>
</html>