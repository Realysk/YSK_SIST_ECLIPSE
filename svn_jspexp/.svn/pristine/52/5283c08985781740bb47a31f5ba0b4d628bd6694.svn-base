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
<%
	String pnameS = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	if(pnameS==null) pnameS="";
	if(priceS==null) priceS="0";
	if(cntS==null) cntS="0";
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(cntS);
	// vo객체에 할당 처리하기.
	Product prod = new Product(pnameS, price, cnt);
	// dao 연계하여 매개변수로 전달 ..
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>물건명</th><td><%=prod.getName()%></td></tr>
		<tr><th>가격</th><td><%=prod.getPrice()%></td></tr>
		<tr><th>갯수</th><td><%=prod.getCnt()%></td></tr>
		<tr><th>구매총계</th><td><%=prod.getPrice()*prod.getCnt()%></td></tr>
	</table>	
	</form>
</body>
</html>