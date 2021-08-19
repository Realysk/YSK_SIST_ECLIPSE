<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
	import="java.net.*"	
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("도서 장바구니");
		$("h3").text("도서 구매 이동").click(function() {
			location.href="a04_buyBook.jsp";
		});
	});

</script>
<body>

	<%-- ex) 카트북에 장바구니 제외하세요. --%>
	

	<h2 align="center"></h2>
	<h3 align="center"></h3>
	
	<%
		// check된 쿠키값이 넘겨져온다.
		String bkNames[] = request.getParameterValues("ck");
		if(bkNames != null && bkNames.length>0) {
			// 1. 저장된 쿠키값
			for(Cookie ck:request.getCookies()) {
				// 2. check한 삭제할 쿠키 이름
				for(String cname:bkNames) {
					// 기존 쿠키값과 삭제로 요청되어 온 쿠키값을 비교
					if(ck.getName().equals(cname)) {
						// 유효기간을 0으로 하고 client에 response 객체로 전달
						ck.setMaxAge(0);
						response.addCookie(ck);
					}
				}
			}
			// 3. 서버단에서 페이지를 전환하여 변경된 쿠키값을 확인할 수 있다.
			response.sendRedirect("a05_CartBook.jsp");
		}
	%>

	<form method="post">
	<table align="center" class="listTable">
		<tr><th>CK</th><th>도서명</th><th>가격</th></tr>
		<% for(Cookie ck:request.getCookies()) { %>
		<tr><td><input type="checkbox" name="ck" value="<%=ck.getName()%>"/></td>
			<td><%=URLDecoder.decode(ck.getName(), "UTF-8") %></td>
			<td><%=URLDecoder.decode(ck.getValue(), "UTF-8") %></td>
		</tr>
		<% } %>
		<tr><td colspan="3" style="text-align:center"><input type="submit" value="쿠키삭제"/>
	</table>
	</form>	
	
</body>
</html>