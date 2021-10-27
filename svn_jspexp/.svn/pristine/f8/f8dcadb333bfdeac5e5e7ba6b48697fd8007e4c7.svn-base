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
<%--<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css"> --%>
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("#schBtn").click(function(){
			var sch = $("[name=sch]").val();
			// 1단계 해당 td 검색
			$("td:contains('"+sch+"')").css("color",'blue');
			// 2단계 해당 tr 검색
			$("tr:contains('"+sch+"'):parent").css("background-color",'yellow');
			//$("td:contains('"+sch+"')").parent().css("background-color",'yellow');
		});
		
		
	});
</script>
</head>
<%-- 
# 
6. 학생의 성적이 리스트되는 화면에서 검색할 행(필터선택자 확인)의 배경색상을 
   표기해주는 프로그램을 작성하세요.(1단계-해당데이터td,2단계-해당포함tr)
    검색내용 [    ][검색]
    no  이름  국어 영어 수학
    1   @@@  @@  @@ @@@
    2   @@@  @@  @@ @@@
    3   @@@  @@  @@ @@@
--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>검색내용</th><td><input type="text" name="sch" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" id="schBtn" value="검색"/></td></tr>
	</table>	 
	</form>
	<%
	List<String> asList = Arrays.asList("홍길동","김길동","신길동","마길동","오길동");
	%>
	<table  align="center" class="listTable">
		<tr><th>no</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>
		<%for(int cnt=1;cnt<=30;cnt++){ 
		%>
		<tr><td><%=cnt%></td>
			<td><%=asList.get((int)(Math.random()*asList.size())) %></td>
			<td><%=(int)(Math.random()*101) %></td>
			<td><%=(int)(Math.random()*101) %></td>
			<td><%=(int)(Math.random()*101) %></td>
			</tr>
		<%}%>
	</table>	
	
</body>
</html>