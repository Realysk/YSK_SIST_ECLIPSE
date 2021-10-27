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
	td{text-align:center;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 
a03_showCookie.jsp : 쿠키 확인 페이지
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("저장된 쿠키 확인");
		$("h3").text("쿠키만들러 가기").click(function(){
			location.href="a02_cookieMake.jsp";
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
<%
	// check된 쿠키값이 넘겨져온다.
	String ckNames[] = request.getParameterValues("ck");
	if(ckNames!=null&&ckNames.length>0){
		// 1. 저장된 쿠키값
		for(Cookie ck:request.getCookies()){
			// 2. check한 삭제할 쿠키이름..
			for(String cname:ckNames){
				// 기존 쿠키값과 삭제로 요청되어온 쿠키값을 비교..
				if(ck.getName().equals(cname)){
					// 유효기간을 0로 하고, client에 response 객체로 전달.
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		// 2. 서버단에서 페이지를 전환하여 변경된 쿠키값을 확인할 수 있다.
		response.sendRedirect("a03_showCookie.jsp");
	}
%>	
	<form method="post">
	<table  align="center" class="listTable">
		<tr><th>ck</th><th>쿠키이름</th><th>쿠키값</th></tr>
		<%for(Cookie ck:request.getCookies()){ %>
			<tr><td>
				<input type="checkbox" name="ck" 
					value="<%=ck.getName()%>"/>
				</td>
				<td><%=URLDecoder.decode(ck.getName(),"utf-8")%></td>
			<td><%=URLDecoder.decode(ck.getValue(),"utf-8")%></td></tr>
		<%}%>
		<tr><td colspan="3" style="text-align:center;">
				<input type="submit" value="쿠키삭제"/>
		</td></tr>
	</table>	
	</form>
	
</body>
</html>