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
		document.querySelector("h3").innerText="요청값(one page 처리)";
	}
</script>
</head>
<body>
	<%
	String priceS = request.getParameter("price");
	%>
	<h3 align="center"></h3>
	<%
	if(priceS==null){ // 초기화면..
	%>
	<form id="frm01">
	<table>
		<tr><th>가격</th><td>
			<input type="text" name="price" value=""/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="10%할인 금액"/></td></tr>
	</table>	
	</form>
	<%
	}else{ // 요청값이 있는 화면.
		int price = Integer.parseInt(priceS);
	%>	
	<table>
		<tr><th>가격</th><td><%=price %></td></tr>
		<tr><th>할인금액(20%할인)</th><td><%=(int)(price*0.8)%></td></tr>
	</table>		
	<%}%>
	<%--
	ex) 초기화면 구구단 문제을 임의로 출력 
		 [ 4  ] X [ 5 ] 	<input name="num01" value="4"/>
		 정답입력 :[    ][확인] ==> 다음 페이지에  4 X 5 = 20  정답/오답 출력..
		 5조
	
	 --%>
</body>
</html>