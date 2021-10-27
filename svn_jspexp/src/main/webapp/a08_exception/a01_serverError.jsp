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
# 에러처리
1. 페이지별 에러처리..
	에러 페이지 지정 : errorPage="예외발생시보여줄에러페이지"
	에러 페이지 작성 : isErrorPage="true", exception.getMessage(), 
					exception.printStackTrace()
2. 웹서버 전체적으로 에러 지정.
	web.xml
	1) 에러코드별(http)로 에러 지정.
	<error-page>
		<error-code>에러코드</error-code>
		<location>에러페이지 uri</location>					 
	2) 예외 처리 클래스 관련 에러 지정..
		에러 클레스를 선언하여 해당 내용에 합당한 부분을 location으로 호출하여 처리할 수 있다.
		
	<error-page>	

--%>
<%
	String s=null;
	// ex) ArrayListIndexOutOfBoundsException을 web.xml과 에러페이지로 설정하고,
	//     처리하세요   4조  다 된분 손들기
	String[]names=new String[1];
	names[1]="안녕";
%>
	<%--2/0--%>
	<%=s.toString()%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>