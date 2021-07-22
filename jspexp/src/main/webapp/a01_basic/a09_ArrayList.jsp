<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="jspexp.a01_start.*"
%>
<%-- import="jspexp.a01_start.*" : 해당 파키지는 모두 등록 --%>
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
	
	<%--
		ex1) 컴퓨터 부품을 list에 등록하고 테이블로 아래 형식으로 출력하세요.
			번호	컴퓨터부품
			1	@@@
			2	@@@
			3	@@@
	 --%>
	 
	<%
		ArrayList<String> list = new ArrayList<String>();
		list.add("CPU [i7 4.3 GHz]");
		list.add("RAM [16G]");
		list.add("HDD [SSD 512G]");
	%>

	<h3></h3>
	<table>
		<tr><th> 번호 </th><th> 부품 </th></tr>
		<%for(int idx=0; idx<list.size(); idx++) { %>
		<tr><td><%=idx+1 %></td><td><%=list.get(idx) %></td></tr>		
		<% } %>
	</table>
	
	<%--	
		ex2) ArrayList<Product> 처리하고 아래와 같이 출력하세요.
			번호	물건명  가격	수량
			1	@@@	  @@	@@
			2	@@@	  @@	@@
			3	@@@	  @@	@@
	 --%>
	 
	 <%
	 	ArrayList<A03_Product> plist = new ArrayList<A03_Product>();
	 	plist.add(new A03_Product("사과",3000,2));
	 	plist.add(new A03_Product("바나나",4000,3));
	 	plist.add(new A03_Product("딸기",12000,5));
	 %>
	 
	<h3></h3>
	<table>
		<tr><th> 번호 </th><th> 물건명 </th><th> 가격 </th><th> 수량 </th><th> 총계 </th></tr>
		<%for(int idx=0; idx<plist.size(); idx++) { %>
		<tr>
			<td><%=idx+1 %></td>
			<td><%=plist.get(idx).getName() %></td>
			<td><%=plist.get(idx).getPrice() %></td>
			<td><%=plist.get(idx).getCnt() %></td>
			<td><%=plist.get(idx).getPrice() * plist.get(idx).getCnt() %></td>
		</tr>	
		<% } %>
	</table>
	
</body>
</html>