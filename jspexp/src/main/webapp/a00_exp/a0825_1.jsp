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
	emp => page 범위
	empList => session 범위
	누적되더라도 데이터가 다르게 객체를 생성하기에 데이터를 처리할 수 있다.
--%>
<%
	pageContext.setAttribute("emp", new Emp());
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("el 리스트 처리..");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>
    ${emp.setEmpno(param.empno)}
    ${emp.setEname(param.ename)}
    ${emp.setJob(param.job)}
    <span style="visibility:hidden;">${empList.add(emp)}</span>	
    <h3 align="center">등록된 사원정보 갯수:${empList.size()}</h3>
  	<table  align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th></tr>
		<tr><td>${empList.get(0).empno}</td>
			<td>${empList.get(0).ename}</td>
			<td>${empList.get(0).job}</td></tr>
	</table>  
	
	
</body>
</html>