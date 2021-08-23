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

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<jsp:useBean id="p01" class="jspexp.z02_vo.Person" />
	<%--  a02_bean_Param.jsp?callname=마길동&age=25&location=서울신림
		쿼리스트링의 이름 callname을 setProperty name 즉  public void setName(String name)
		으로 연동하여 데이터를 할당한다.  getProperty인 name으로 el로 호출할 수 있다.
	Person p01 = new Person();
	callname=마길동
	jsp:setProperty name="p01" property="name"  param="callname"/
	 	p01로 하는 참조변수에 요청key callname에 있는 데이터를 	 property name에 할당한다.
	p01.setName("마길동");
	 --%>
	<jsp:setProperty name="p01" property="name"  param="callname"/>
	<jsp:setProperty property="age" name="p01" />
	<jsp:setProperty property="loc" name="p01" param="location"/>
	<table  align="center" class="listTable">
		<tr><th>이름</th><td>${p01.name}</td></tr>
		<tr><th>나이</th><td>${p01.age}</td></tr>
		<tr><th>위치</th><td>${p01.loc}</td></tr>
	</table>	
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	
	
</body>
</html>