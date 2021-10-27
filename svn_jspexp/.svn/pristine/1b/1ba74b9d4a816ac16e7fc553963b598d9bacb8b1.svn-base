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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h2").innerText="포함하는 페이지";
	}
</script>
</head>
<%-- 
# 액션 태그
1. 외부 페이지를 jsp단위로 포함시키거나 페이지를 조건따라서 이동처리할 때, 
	사용되는 것이 action 태그 이다.
2. include 액션 테그.
	외부에 공통 페이지를 jsp 단위로 가지고 와서 사용할 때, 활용된다.
3. 각 액션 태그로 포함된 페이지는 따로, java가 만들어져서 사용 되는 것이다.	
--%>
<%

%>
<body>
	<h2 align="center">안녕</h2>
	<form id="frm01">
	<table class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<jsp:include page="a04_include.jsp"></jsp:include>
	
</body>
</html>