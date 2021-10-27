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
# application 기본 객체 : 초기 파라미터
1. 초기화 파라미터 설정 : web.xml 파일 활용
	<context-param>
		<description>파라미터 설명
		<param-name>파라미터이름
		<param-value>파라미터값
2. application 초기 파라미터 관련 기능 메서드.
	getInitParameter(String name)
	getInitParameterNames() 



--%>
<%
	String info01 = application.getInitParameter("DB_IP");
	String info02 = application.getInitParameter("DB_PORT");
	String info03 = application.getInitParameter("DB_SID");
	String info04 = application.getInitParameter("USERNAME");
	String info05 = application.getInitParameter("PASSWORD");
	
	Enumeration<String> initParams= application.getInitParameterNames();
	/*
	# Enumeration 객체의 기는 메서드.
	1. .hasMoreElements() : 다음 라인의 데이터가 있는지 여부 boolean
	2. .nextElement() : 구성요소의 값을 가져온다.  name값을 가져올 수 있다.
	
	*/
	
	

	// ex) db의 port/sid/username/pass를 web.xml에 
//         설정하고, 화면에 출력하세요.
	//    2조  전체(손)
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("application info");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이피 정보</th><td><%=info01%></td></tr>
		<tr><th>포트 정보</th><td><%=info02%></td></tr>
		<tr><th>sid 정보</th><td><%=info03%></td></tr>
		<tr><th>계정 정보</th><td><%=info04%></td></tr>
		<tr><th>비밀번호정보</th><td><%=info05%></td></tr>
	</table>	
	</form>
	<h3 align="center">서버(web.xml)에 있는 값들</h3>
	<table  align="center" class="listTable">
		<tr><th>name</th><th>value</th></tr>
		<%	
			while(initParams.hasMoreElements()){ 
			String name = initParams.nextElement();
		%>
		<tr><td><%=name%></td><td><%=application.getInitParameter(name)%></td></tr>
		<%} %>
	</table>	
	
</body>
</html>