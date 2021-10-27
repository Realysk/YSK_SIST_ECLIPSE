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
		document.querySelector("h3").innerText="온라인 예약 시스템 등록";
	}
</script>
</head>
<%-- 
# form 및 요청처리 단일 페이지
1. 요청폼과 결과 처리 화면 구현.
2. 전송결과 조건에 따른 초기와 결과하면 분리
3. 세부적인 데이터 처리..


--%>
<body>
<%
	String title = request.getParameter("title");
	String cntS = request.getParameter("cnt");
	String payS = request.getParameter("pay");
	String time = request.getParameter("time");
	if(title==null){
%>

	<h3 align="center"></h3>
	<form id="frm01" action="a0728_1.jsp">
	<table>
		<tr><th>영화제목</th>
			<td><input class="input" type="text" name="title" value=""/></td></tr>
		<tr><th>입장인원</th><td>
				<select class="input" name="cnt">
					<option value="">선택</option>
					<%for(int cnt=1;cnt<=20;cnt++){%>
					<option><%=cnt%></option>	
					<%}%>
				</select>	
		<tr><th>입장료</th>
			<td><input class="input" type="text" name="pay" 
					value="10000"/></td></tr>
					
		<tr><th>상영시간</th>
			<td>
				<select class="input" name="time">
					<option value="">선택</option>
					<%for(int hour=9;hour<=23;hour++){%>
					<option><%=hour%>:00</option>	
					<%}%>
				</select>
			</td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>
<%
	}else{
%>	
	<h2>예약 등록 처리 결과</h2>
	<table>
		<tr><th>영화제목</th><td><%=title %></td></tr>
		<tr><th>관객수</th><td><%=payS %></td></tr>
		<tr><th>관람료</th><td><%=cntS %></td></tr>
		<tr><th>예약시간</th><td><%=time %></td></tr>
		<tr><th>총관람료</th><td><%=Integer.parseInt(cntS)
					*Integer.parseInt(payS) %></td></tr>
	</table>		
<%} %>	
</body>
</html>