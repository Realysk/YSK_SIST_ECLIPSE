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
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 
a04_buyBook.jsp (구매할 도서 - 구매처리 - 쿠키에 담기) 도서명, 가격  
a05_CartBook.jsp (현재 카트에 담기 도서)
5조, 전체(손들기)
--%>
<%
	String bkname = request.getParameter("bkname");
	String price = request.getParameter("price");
	if(bkname!=null){
		response.addCookie(new Cookie(bkname,price));
		response.sendRedirect("a05_CartBook.jsp");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("구매할 도서 카트에 담기");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>도서명</th><td><input type="text" name="bkname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="카트담기"/></td></tr>
	</table>	
	</form>
</body>
</html>