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
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<%--
	ex)다음 화면요청결과값까지 출력하세요
	이름: [    ]
	성별: ()남 ()여
	좋아하는 동물 : []강아지 []고양이 []돼지 []기타
	    [전송]
	2조는 메시지 전송, 전체(손들기)
	 --%>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>성별</th>
			<td>
				<input type="radio" name="gender" value="남"/>남
				<input type="radio" name="gender" value="여"/>여
			</td></tr>
		<tr><th>좋아하는 동물</th>
			<td>
				<input type="checkbox" name="favAn" value="강아지"/>강아지
				<input type="checkbox" name="favAn" value="고양이"/>고양이
				<input type="checkbox" name="favAn" value="돼지"/>돼지
				<input type="checkbox" name="favAn" value="기타"/>기타
			</td></tr>
			
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String []favAn = request.getParameterValues("favAn");
	if(name!=null){
	%>
	<table  align="center" class="listTable">
		<tr><th>이름</th><td><%=name%></td></tr>
		<tr><th>성별</th><td><%=gender%></td></tr>
		<%for(int idx=0;idx<favAn.length;idx++){ %>
		<tr><th>좋아하는 동물 <%=idx+1%></th><td><%=favAn[idx]%></td></tr>
		<%}%>
	</table>	
	<%} %>
	
</body>
</html>