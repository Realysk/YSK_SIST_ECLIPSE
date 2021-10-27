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
	input[type=date ]{width:80%;}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="사원정보상세화면";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	String empnoS = request.getParameter("empno");
	Emp emp=null;
	if(empnoS!=null){ // 요청값이 있을 때, 처리..
		A05_PreparedDao dao = new A05_PreparedDao();
		emp = dao.getEmp( Integer.parseInt(empnoS) );
	}
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원번호</th><td><input type="text" name="empno" value="<%=emp.getEmpno()%>"/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=emp.getEname()%>"/></td></tr>
		<tr><th>관리자번호</th><td><input type="text" name="mgr" value="<%=emp.getMgr()%>"/></td></tr>
		<tr><th>입사일</th><td><input type="date" name="hiredate" value="<%=emp.getHiredate()%>"/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal" value="<%=emp.getSal()%>"/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm" value="<%=emp.getComm()%>"/></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=emp.getDeptno()%>"/></td></tr>
		<tr><td colspan="2">
				<input type="button" id="uptBtn" value="수정"/><%-- 부서정보 상세 Dao 화면 처리 5조 --%>
				<input type="button" id="delBtn" value="삭제"/>
				<input type="button" id="goMain" value="조회화면"/>		
		</td></tr>
	</table>	
	</form>
	<script>
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick=function(){
			if(confirm("수정하시겠습니까?")){
				var formObj = document.querySelector("form");
				formObj.action="a33_empUptProc.jsp";
				formObj.submit();
			}
		};
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick=function(){
			if(confirm("삭제하시겠습니까?")){
				var empno = document.querySelector("[name=empno]").value;
				location.href="a34_empDelProc.jsp?empno="+empno;
			}
		}
	
	</script>
</body>

</html>