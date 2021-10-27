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
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="총계"/></td></tr>
	</table>	
	</form>
	<%--
	1. 초기화면에 나타날 내용.
	2. 요청값에서 처리할 내용.
	3. 요청값이 초기화면/요청되었을 때, 데이터를 구분해서 어떤 처리가 필요한지 
		생각하여 코딩..
		1) 요청값이 초기화면에 데이터 확인.
			null일때는 초기 화면..
	 --%>
	<%
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	System.out.println("가격:"+priceS);
	System.out.println("갯수:"+cntS);
	
	if(priceS==null){ // 초기 화면..
		priceS="0"; // 에러가 발생하지 않게 처리.
	}
	
	if(cntS==null){ // 초기 화면..
		cntS="0"; // 에러가 발생하지 않게 처리.
	}	
	int price = Integer.parseInt(priceS);
	int cnt = Integer.parseInt(cntS);
	%> 
	<%if(request.getParameter("price")!=null){%> <%--초기화면과 구분 --%>
		<h2 align="center"><%=price*cnt%></h2>
	<%}%>
</body>
</html>