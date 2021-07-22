<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="물건 리스트";
	};

</script>
</head>
<body>

	<%
		// ex) a03_with_java.jsp로 하고 테이블에 물건명, 가격, 수량 정보를 출력하세요.
		String pname = "사과";
		int price = 3000;
		int cnt = 3;
	%>

	<h3> 물건 리스트 </h3>
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th><th> 총계 </th></tr>
		<tr><td><%=pname %></td><td><%=price %></td><td><%=cnt %></td><td><%=price*cnt %></td></tr>
	</table>
	
</body>
</html>