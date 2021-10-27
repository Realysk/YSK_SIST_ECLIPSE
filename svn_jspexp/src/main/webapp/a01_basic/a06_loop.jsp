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
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	li{float:left;}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="반복문처리!!";
	};

</script>
</head>
<body>

	<h3></h3>
	<%for(int cnt=1;cnt<=10;cnt++){ %>
	
	<h4><%=cnt %> 안녕하세요!!</h4>
	
	<%}%>
	
	<table>
		<%for(int cnt=1;cnt<=10;cnt++){ %>
		<tr><th><%=cnt%></th><td>안녕하세요!!</td></tr>
		<%}%>
	</table>	
	
	<%for(int cnt=1;cnt<=10;cnt++){ %>
	<h5><%=cnt %>) 반가워요!</h5>
	<%} %>
	<%
		String fruits[]={"사과","바나나","딸기"};
	%>
	<select>
		<%for(int idx=0;idx<fruits.length;idx++){ %>
		<option><%=fruits[idx] %></option>
		<%}%>
	</select>
	<ul type="none">
		<%for(int idx=0;idx<fruits.length;idx++){ %>
		<li><a href="">[<%=idx+1%>] <%=fruits[idx] %></a></li>
		<%}%>
	</ul><br>
	<%for(int idx=0;idx<fruits.length;idx++){ %>
		<%=idx+1 %>번째 과일:<input type="text" size="3" 
			value="<%=fruits[idx]%>"/><br>
	<%}%>
	<%-- ex) a07_loop.jsp  
				배열로 사원명 배열 선언  
				배열로 사원번호 배열 선언  아래와 같이 출력하세요 6조
				배열로 부서명 배열 선언  						
				사원명  사원번호  부서명
				@@@		@@@		@@						
				@@@		@@@		@@						
				@@@		@@@		@@						
	 --%>
	<table>
		<tr>
		<%for(int idx=0;idx<9;idx++){ 
			if(idx%3==0){
		%>
				<tr>
			<%}%>
		<td><%=idx+1 %></td>
		<%
			if(idx%3==2){
		%>		</tr>
			<%
			}		
		}
		%>
		</tr>
	</table>
	
	
	
	<%--
	ex) a07_loop.jsp  
		h5, select option(반복), ul li(반복), input,  table tr td에
		해당 요소객체에 반문을 활용하여 출력처리하세요  5조..
		
		select
			option
			option
			option
		ul
			li	
			li	
			li	
	 --%>
	
	
</body>
</html>