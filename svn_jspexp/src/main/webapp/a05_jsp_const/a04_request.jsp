<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	// 한글 요청값에 처리. post방식일 때, 처리..
	request.setCharacterEncoding("utf-8");
	// contextpath는 프로젝트 명으로 물리적으로 서버상의 jspexp\src\main\webapp
	// 기준으로 접근하여, 여러가지 자원(파일/이미지/css)등을 절대위치로 접근이 가능하다.
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
<%-- 
# request 기본 객체 (client ==> server )
cf) request, response는 일단, 둘다 server에서 활용하는 jsp 코드의 객체인데,
request는 클라이언트에서 오는 요청값에 대한 처리, response는 주로 서버에서 클라이언트로
보낼 화면 출력, 쿠키값 전송 등을 처리한다.

1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공.
2. 주요 기능
	1) 클라이언트와 관련된 정보 읽기 기능
	2) 서버와 관련된 정보 읽기 기능
	3) 클라이언트가 전송한 요청 파라미터 읽기 기능
	4) 클라이언트가 전송한 요청 헤더 읽기 기능
	5) 클라이언트가 전송한 쿠키 읽기 기능
	6) 속성 처리 기능
3. 기본 정보 제공 메서드 : client(브라우저)에서 전달되어온 정보를 기준으로 메서드로 접근하여 처리할 수 있다.
	http://localhost:7080/jspexp/index.jsp
	1) request.getRemoteAddr() : 웹서버에 연결한 클라이언트의 ip 주소를 구한다.
	2) request.getMethod() : 웹 브라우저가 정보를 전송할 때, 사용한 방식을 구한다.
	3) request.getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다.  ex) jspexp/index.jsp
	4) request.getContextPath() : jsp 페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다. ex) jspexp
			웹서버의 절대적 경로설정의 중요한 역할을 한다. 이 기준 경로를 통해 여러가지 
			자원(css, html, jsp, 이미지 등)을 접근하여 사용할 수 있게 처리한다.
			jspexp\src\main\webapp 로 서버내에 특정한 폴드를 기준 경로로 설정한다.
	5) request.getServerName() : 연결할 때, 사용한 서버 이름을 구한다. ex) localhost
	6) request.getServerPort() : 서버가 실행 중인 포트 번호를 구한다. ex) 7080

--%>
<%

%>

<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("request!!");
	});
</script>
</head>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>클라이언트 주소(mac)</th><td><%=request.getRemoteAddr()%></td></tr>
		<tr><th>요청한 URL</th><td><%=request.getRequestURI()%></td></tr>
		<tr><th>서버 이름</th><td><%=request.getServerName()%></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>