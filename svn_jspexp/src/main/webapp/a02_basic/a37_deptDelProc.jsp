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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# ex) 부서정보 삭제 처리 5조.
--%>
<%
	String deptnoS = request.getParameter("deptno");
	boolean isDelete=false;
	if(deptnoS!=null){
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.deleteDept(Integer.parseInt(deptnoS));
		isDelete = true;
	}
%>
<body>
	<script type="text/javascript">
		var isDelete = <%=isDelete%>;
		if(isDelete){
			alert("삭제 완료");
			location.href="a30_deptList.jsp";
		}
	</script>
</body>
</html>