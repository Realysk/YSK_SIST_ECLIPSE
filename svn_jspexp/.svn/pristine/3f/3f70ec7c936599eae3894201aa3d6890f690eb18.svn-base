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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="수정처리..";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	boolean isUpdate = false;
	String empnoS = request.getParameter("empno");
	if(empnoS!=null){
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgrS = request.getParameter("mgr");
		String hiredateS = request.getParameter("hiredate");
		String salS = request.getParameter("sal");
		String commS = request.getParameter("comm");
		String deptnoS = request.getParameter("deptno");
		Emp upt = new Emp(
			Integer.parseInt(empnoS),ename,job,
			Integer.parseInt(mgrS),hiredateS,
			Double.parseDouble(salS),
			Double.parseDouble(commS),
			Integer.parseInt(deptnoS)
		);
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.updateEmp(upt);
		isUpdate = true;
	}
%>
<body>
	<script>
		var  isUpdate = <%=isUpdate%>;
		alert("수정완료!");
		location.href="a32_empDetail.jsp?empno=<%=empnoS%>";
	</script>

	<h3 align="center"></h3>
	<h2>수정키:<%=empnoS %></h2>
	<%-- ex) 부서정보 수정처리하고 확인하세요.. 1조 --%>
</body>
</html>