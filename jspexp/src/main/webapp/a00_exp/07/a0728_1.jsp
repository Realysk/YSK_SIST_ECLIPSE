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
		document.querySelector("h3").innerText="예약 처리현황";
	}
</script>
</head>
<%-- 
# 

--%>
<%
	boolean isValid = true; // 현재 페이지 요청 페이지에서 왔는지 check
	String title = request.getParameter("title");
	String payS = request.getParameter("pay");
	String cntS = request.getParameter("cnt");
	String time = request.getParameter("time");
	if(title == null){
		isValid = false;
	}
	int pay = 0;
	if(payS!=null){
		pay = Integer.parseInt(payS);
	}
	int cnt = 0;
	if(cntS!=null){
		cnt = Integer.parseInt(cntS);
	}
	
%>
<body>
<script>
	// 요청 페이지에서 온 것이 아니면 요청 페이지로 이동하게 처리..
	var isValid = <%=isValid%>; 
	if(!isValid){
		alert("현재페이지는 입력 후, 처리되는 페이지입니다!");
		location.href="a0728.jsp";
	}
</script>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>영화제목</th><td><%=title %></td></tr>
		<tr><th>관객수</th><td><%=cnt %></td></tr>
		<tr><th>관람료</th><td><%=pay %></td></tr>
		<tr><th>예약시간</th><td><%=time %></td></tr>
		<tr><th>총관람료</th><td><%=cnt*pay %></td></tr>
	</table>	
	</form>
	
	
</body>
</html>