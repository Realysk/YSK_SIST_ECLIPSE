<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="jspexp.a01_start.A02_Entertainer"    
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
		document.querySelector("h3").innerText="인물 정보";
	};

</script>
</head>
<body>

<%
	// ex) A02_Entertainer 클래스를 생성하고 연예인 이름, 생년월일, 분야, 속성 설정 후 a05_with_vo.jsp에 출력하세요.

	A02_Entertainer en = new A02_Entertainer("Dwayne Johnson", 19720502, "영화배우");
%>

	<h3></h3>
	<table>
		<tr><th> 이름 </th><td><%=en.getName() %></td></tr>
		<tr><th> 생년월일 </th><td><%=en.getBirthday() %></td></tr>
		<tr><th> 직업 </th><td><%=en.getType() %></td></tr>
	</table>
	
</body>
</html>