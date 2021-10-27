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
	String ckNames[] = request.getParameterValues("ck");
	if(ckNames!=null&&ckNames.length>0){
		for(Cookie ck:request.getCookies()){
			for(String name:ckNames){
				if(ck.getName().equals(name)){
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		response.sendRedirect("a0820_show.jsp");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("예매 내역");
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table  align="center" width="50%" class="listTable">
		<tr><th>ck</th><th>영화명</th><th>예약인원</th></tr>
		<%for(Cookie ck:request.getCookies()){ 
			if(!ck.getName().equals("JSESSIONID")){
		%>
		<tr><td><input type="checkbox" name="ck" value="<%=ck.getName()%>"/></td>
			<td><%=URLDecoder.decode(ck.getName(),"utf-8")%></td><td><%=ck.getValue()%></td></tr>
		<%	}
		} %>
		<tr><td colspan="3" style="text-align:center" >
				<input type="submit" value="삭제"/>
				<input type="button" id="preBuy" value="예매하러가기"/>
			</td></tr>
	</table>	
	</form>
	<script>
		$("#preBuy").click(function(){ location.href="a0820.jsp";});
	</script>
</body>
</html>