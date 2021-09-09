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
		document.querySelector("h3").innerText="계산기";
	}
</script>
</head>
<%-- 
# 
[    ] [연산자select] [    ] [합산]
@@ X @@ = @@
1. 폼작성/요청처리화면구현
2. 초기화면과 요청처리 후 내용에 대한 로직 분리.
3. 결과값 처리..
--%>
<body>
<%
	String num01S = request.getParameter("num01");
	String calS = request.getParameter("cal");
	String num02S = request.getParameter("num02");
	if(num01S==null){
%>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr>
		<td><input type="text" name="num01" value="0"/></td>
		<td><select name="cal">
				<option value="0"> + </option>
				<option value="1"> - </option>
				<option value="2"> X </option>
				<option value="3"> / </option>
			</select></td>
		<td><input type="text" name="num02" value="0"/></td>
		<td><input type="submit" value="연산"/></td></tr>
	</table>	
	</form>
	<%}else{
		int num01 = Integer.parseInt(num01S);
		int num02 = Integer.parseInt(num02S);
		int calIdx = Integer.parseInt(calS);
		String cal[] = {" + "," - "," X "," / "};		
		int result[] = {num01+num02, num01-num02, 
						num01*num02, num01/num02};
		// calIdx에서 받은 index에 따른 연산결과를 배열에 index로 선택하기 때문에
		// 조건문이 필요 없다.
	%>
	<h2>계산결과</h2>
	<table>
		<tr><td><%=num01%> <%=cal[calIdx]%> <%=num02%> = <%=result[calIdx] %></td></tr>
	</table>
	<%}%>	
	
</body>
</html>