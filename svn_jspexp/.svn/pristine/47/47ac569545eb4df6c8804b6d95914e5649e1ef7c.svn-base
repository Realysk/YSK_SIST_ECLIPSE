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
# bean을 활용한 form데이터 처리
1. form 객체에 있는 데이터를 요청값으로 전달하기때문에,
	useBean의 property="*"로 하면, 요청key와 프로퍼티가 같으면 해당 객체에 할당이 된다.

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("사원데이터 처리");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>
	<jsp:useBean id="emp" class="jspexp.z02_vo.Emp"/>
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:setProperty property="*" name="emp"/>
	<%
		if(emp.getEname()!=null){
			dao.insertEmp(emp);
		}
	%>
	
	<table  align="center" class="listTable" width="30%">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th></tr>
		<%for(Emp e:dao.getEmpList()){ %>
		<tr><td><%=e.getEmpno()%></td><td><%=e.getEname()%></td><td><%=e.getJob()%></td></tr>
		<%}%>
	</table>	
	
</body>
</html>