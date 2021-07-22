<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
	import="java.util.*"
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="사원정보";
	};

</script>
</head>
<body>

	<%
		A05_PreparedDao dao = new A05_PreparedDao();
		ArrayList<Emp> elist = dao.getEmpList();
	%>

	<h3></h3>
	<table>
		<tr><th> 사원번호 </th><th> 사원명 </th><th> 급여 </th></tr>
		<%for(Emp e:elist) { %>
		<tr>
			<td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getSal() %></td>
		</tr>		
		<% } %>
	</table>
	
</body>
</html>