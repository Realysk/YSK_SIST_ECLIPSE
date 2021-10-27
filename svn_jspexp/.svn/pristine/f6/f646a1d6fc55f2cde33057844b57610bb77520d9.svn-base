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
<title>Insert title here</title>
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="post방식 전송";
	}
</script>
</head>
<%-- 
# 

--%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<%
	String ename = request.getParameter("ename");
	if(ename!=null){
	%>
	<h2>post방식을 받은 데이터</h2>
	<table>
		<tr><th>사원명</th><td><%=ename%></td></tr>
	</table>	
	<%}%>
	<%--
	ex) 구매할 도서명 가격 갯수를 입력하여, 출력하세요 (post방식처리) 3조..
	~ 12:30 풀이하겠습니다.
	
	 --%>
	<form method="post">
	<table>
		<tr><th>도서명</th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	<%
	String bname = request.getParameter("bname");
	if(bname!=null){
		int price = Integer.parseInt(request.getParameter("price"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
	%>
	<h2>구매 내역</h2>
	<table>
		<tr><th>도서명</th><td><%=bname%></td></tr>
		<tr><th>가격</th><td><%=price%></td></tr>
		<tr><th>갯수</th><td><%=cnt%></td></tr>
		<tr><th>계</th><td><%=price*cnt%></td></tr>
	</table>	
	<%} %>
	
</body>
</html>