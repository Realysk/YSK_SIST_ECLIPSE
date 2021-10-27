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
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%-- 
# 서버와 클라이언트의 대화
1. 결과로  특정한데이터를 클라이언트에 저장할 때 : 쿠키
2. 결과로  특정한데이터를 서버에 저장할 때 : 세션
3. 서버 클라이언트.
	클라이언트 ===(request)==>  서버
	        <==(response)== 
	        
4. 쿠키는 response 객체로 전달 받는다 클라이언트(브라우저)에 저장.
5. 세션은 request 객체로 전달 받아, 서버에 저장      
--%>
<%
// 쿠키 설정.
Cookie c1 = new Cookie("name","himan");
response.addCookie(c1); /// 서버에 클라이언트(브라우저)에  쿠키값을 전달하여 저장. 처리.
Cookie c2 = new Cookie("age","25");
response.addCookie(c2);
Cookie c3 = new Cookie("loc","seoul");
response.addCookie(c3);
// ex)  a11_cookie.jsp를 통해 쿠키를  한글(X) pname, price, cnt로 저장
//      a12_prodCookie.jsp를 통해 쿠키를 확인 하세요.. 2조..
%>
<body>
	<h3 align="center"></h3>
	<a href="a10_showCookie.jsp">저장된 쿠키값 확인하러 가기</a>
</body>
</html>