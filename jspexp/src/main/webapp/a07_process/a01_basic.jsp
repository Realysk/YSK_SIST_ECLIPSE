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
# <jsp:include> 액션 태그
1. 다른 jsp 페이지의 실행 결과를 현재 위치에 삽입한다.
2. 기본형식
	<jsp:include page="포함될 페이지" flush="true/false">
		<jsp:param name="param1" value="value1"/>
		<jsp:param name="param2" value="value2"/>
	flush : 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러시 할 지의 여부를 지정한다.
	true이면 출력 버퍼를 플러시하고, false이면 하지 않는다.
	해당 페이지에 param1=value1&param2=value2형식으로 매개데이터를 전달 할 수 있다.

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("메인페이지");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>검색</th><td><input type="text" name="sch" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<%
	String sch = request.getParameter("sch");
	if(sch!=null){
	%>
	<jsp:include page="a02_subPage.jsp" flush="true">
		<jsp:param value="<%=sch%>" name="sch"/>
	</jsp:include>
	<%}%>
</body>
</html>