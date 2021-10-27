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
		document.querySelector("h3").innerText="부서정보상세";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	String deptnoS = request.getParameter("deptno");
	Dept d =null;
	if(deptnoS!=null){
		A05_PreparedDao dao = new A05_PreparedDao();
		d = dao.getDept(Integer.parseInt(deptnoS));
	}
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=d.getDeptno()%>"/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=d.getDname()%>"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%=d.getLoc()%>"/></td></tr>
		<tr><td colspan="2">
			<input type="button" id="uptBtn" value="수정"/>
			<input type="button" id="delBtn" value="삭제"/>
			<input type="button" id="mainBtn" value="메인화면"/>
			</td></tr>
	</table>	
	</form>
<script>
	var uptBtn = document.querySelector("#uptBtn");
	uptBtn.onclick=function(){
		var frm01 = document.querySelector("#frm01");
		frm01.action="a36_deptUptProc.jsp";
		frm01.submit();
	};
	var delBtn = document.querySelector("#delBtn");
	delBtn.onclick=function(){
		var deptno = document.querySelector("[name=deptno]").value;
		location.href="a37_deptDelProc.jsp?deptno="+deptno;
	};	
	
	
</script>	
</body>
</html>