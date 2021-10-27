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

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("쿠키만들기");
	});
</script>
<body>
	<%
	// ex) 한글로 쿠키값을 설정하여 확인할 수 있게 하세요.  1조, 손들기(전체)
	// a02_cookieMake.jsp : 쿠키 요청값을 생성 페이지
	// a03_showCookie.jsp : 쿠키 확인 페이지
	String ckName = request.getParameter("ckName");
	String ckValue = request.getParameter("ckValue");
	if(ckName!=null){
		Cookie c1 = new Cookie(URLEncoder.encode(ckName,"utf-8"),
							   URLEncoder.encode(ckValue,"utf-8"));
		response.addCookie(c1);
		// response.sendRedirect("이동할페이지") :
		// 서버단에서 페이지 이동 처리
		response.sendRedirect("a03_showCookie.jsp");
	}
	
	%>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>쿠키이름</th>
			<td><input type="text" name="ckName" />
		</td></tr>
		<tr><th>쿠키값</th>
			<td><input type="text" name="ckValue" />
		</td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="submit" value="쿠키만들기"/>
		</td></tr>
	</table>	
	</form>
</body>
</html>