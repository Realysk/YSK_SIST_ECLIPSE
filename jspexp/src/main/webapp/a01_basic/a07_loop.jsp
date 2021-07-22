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
	li(float:left;)
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="반복문 예제";
	};

</script>
</head>
<body>

	<%-- 
		a07_loop.jsp
		
		h5, select option(반복), ul li(반복), input, table tr td에 해당 요소객체에 반복문을 활용하여 출력하세요.
		
		select
			option 
			option 
			option
		ul
			li
			li
			li
		ul
	--%>

	<% for(int cnt=1; cnt<=10; cnt++) { %>
	<h5><%=cnt %>) 반가워요!</h5>
	<% } %>
	<%
		String fruits[]={"사과", "바나나", "딸기"};
	%>
	
	<select>
		<%for(int idx=0; idx<fruits.length; idx++) { %>
		<option><%=fruits[idx] %></option>
		<% } %>
	</select>
	<ul type="none">
		<%for(int idx=0; idx<fruits.length; idx++) { %>
		<li>[<%=idx+1 %>] <%=fruits[idx] %></li>
		<% } %>
	</ul>
	<%for(int idx=0; idx<fruits.length; idx++) { %>
	<%=idx+1 %>번째 과일 : <input type="text" size="3" value="<%=fruits[idx] %>"/><br>
	<% } %>
	
	
	<table>
		<tr>
		<%for(int idx=0; idx<9; idx++) { 
			if(idx%3==0) {
				
		%>
				<tr>
		<% } %>
		<td><%=idx+1 %></td>
		<% 
			if(idx%3==2) {	
		%>
				<tr>
			<%
			}
		
		}
		%>
		</tr>
	</table>
		
	<h3></h3>
	<table>
		<tr><th><%="타이틀" %></th></tr>
		<tr><td>${'내용'}</td></tr>
	</table>
	
</body>
</html>