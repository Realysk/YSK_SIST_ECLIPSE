<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"    
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

--%>
<%
	String name = request.getParameter("name");
	String cnt = request.getParameter("cnt");
	if(name!=null){
		response.addCookie(new Cookie(URLEncoder.encode(name,"utf-8"),cnt));
		response.sendRedirect("a0823_cookie.jsp");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("쿠키값 설정(카트담기)");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01"  method="post">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="담기"/></td></tr>
	</table>	
	</form>
	<h3 align="center">카트 확인</h3>
	<form method="post">
	<table  align="center" class="listTable">
		<tr><th>ck</th><th>물건명</th><th>갯수</th></tr>
		<%
		// <input type="checkbox" name="ck" 
		// 요청값으로 온 삭제할 쿠키의 이름들
		String []cks = request.getParameterValues("ck");
		if(cks!=null){ // check값이 있을 때만 처리..
			for(Cookie cookie:request.getCookies()){
				for(String ck:cks ){
					if(cookie.getName().equals(ck)){
						// 생존시간을 0로 처리..
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
			
			response.sendRedirect("a0823_cookie.jsp");
		}
		if(request.getCookies()!=null){
			for(Cookie ck:request.getCookies()){
				if(!ck.getName().equals("JSESSIONID")){
		%>
		<tr><td><input type="checkbox" name="ck" value="<%=ck.getName()%>"/></td>
			<td><%=URLDecoder.decode(ck.getName(),"utf-8")%></td><td><%=ck.getValue() %></td></tr>
		<%		}
			
			}
		}
		%>
		<tr><td colspan="3" style="text-align:center" ><input type="submit" value="삭제"/></td></tr>
	</table>	
	</form>
</body>
</html>