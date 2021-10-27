<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a01_start.*"
    %>
    <%-- import="jspexp.a01_start.*" : 해당 페키지는 모두 등록..--%>
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
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="시작!!";
	};

</script>
</head>
<body>
	<%
	ArrayList<String> list = new ArrayList<String>();
	list.add("CPU[i7 4.3GHz]");
	list.add("Ram[16g]");
	list.add("Hdd[ssd 250G]");
	List<String> list2 = Arrays.asList("사과","바나나","딸기");
	%>
	<table>
		<tr><th>번호</th><th>컴퓨터부품</th></tr>
		<%for(int idx=0;idx<list.size();idx++){ %>
		<tr><td><%=idx+1%></td><td><%=list.get(idx)%></td></tr>
		<%} %>
		
	</table>
	<%--
	ex1) 컴퓨터 부품을 list에 등록하고, 테이블로 아래 형식으로 출력하세요
		번호  컴퓨터부품
		1    @@
		2    @@
		3    @@
	ex2) ArrayList<Product> 처리하고, 아래와 같이 출력 하세요.  1조
		번호  물건명 	가격 갯수
		1	  @@@ 	@@	@@
		2	  @@@ 	@@	@@
		3	  @@@ 	@@	@@
	 --%>
	<%
	ArrayList<Product> plist = new ArrayList<Product>();
	plist.add(new Product("사과",3000,2));
	plist.add(new Product("바나나",4000,3));
	plist.add(new Product("딸기",12000,5));
	
	%> 
	 
	 
	<h3></h3>
	<table>
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<%for(int idx=0;idx<plist.size();idx++){ %>
		<tr><td><%=idx+1%></td>
			<td><%=plist.get(idx).getName() %></td>
			<td><%=plist.get(idx).getPrice() %></td>
			<td><%=plist.get(idx).getCnt() %></td></tr>
		<%}%>
	</table>
</body>
</html>