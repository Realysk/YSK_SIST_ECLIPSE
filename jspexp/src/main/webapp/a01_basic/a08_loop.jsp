<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
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
		document.querySelector("h3").innerText="사원 정보";
	};

</script>
</head>
<body>

	<%--
		ex) a08_loop.jsp  아래와 같이 출력하세요.
			배열로 사원명 배열 선언
			배열로 사원번호 배열 선언
			배열로 부서명 배열 선언
			사원명	사원번호	부서명
			@@@		@@@		@@@
			@@@		@@@		@@@
			@@@		@@@		@@@
	 --%>
	 
	 <%
	 	String[] names = {"홍길동", "김길동", "신길동"};
	 	int[] empnos = {7780, 7790, 7800};
	 	String[] dnames = {"인사", "재무", "회계"};
	 %>

	<h3></h3>
	<table>
		<tr><th> 사원명 </th><th> 사원번호 </th><th> 부서명 </th></tr>
		<%for(int idx=0; idx<empnos.length; idx++) { %>
		<tr>
			<td><%=names[idx] %></td>
			<td><%=empnos[idx] %></td>
			<td><%=dnames[idx] %></td>		
		</tr>
		<% } %>
	</table>
	
</body>
</html>