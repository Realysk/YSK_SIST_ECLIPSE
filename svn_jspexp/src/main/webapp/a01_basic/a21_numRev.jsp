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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<body>
	<h3 align="center"></h3>
<%	
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	if(num01S==null) num01S="0";
	if(num02S==null) num02S="0";
	int num01 = Integer.parseInt(num01S);
	int num02 = Integer.parseInt(num02S);
	int sum = num01 + num02;
// ex) 물건명, 가격, 갯수를 form으로 입력받아 다음 페이지에서 
//     물건명과 총액을 출력하세요.. 4조..
%>   	
	<h2 align="center"><%=num01%> + <%=num02 %> = <%=sum %></h2>
</body>
</html>
