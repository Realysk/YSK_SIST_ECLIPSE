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

<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("서버정보");
	});
</script>
<body>
<%-- 
# application을 통한 서버정보
1. getServerInfo() : 간단한 서버정보 
2. getMajorVersion() : 서블릿 규약 메이저 버젼
3. getMinorVersion() : 서블릿 규약 마이너 정보.
4. application.log() ; 서버단위 로그 메시지 기록
cf) log():jsp의 기본 로그 표기..

--%>
	<h2 align="center"></h2>

	<table  align="center" class="listTable">
		<tr><th>서버정보</th><td><%=application.getServerInfo()%></td></tr>
		<tr><th>서블릿 규약 메이저 버젼</th><td><%=application.getMajorVersion()%></td></tr>
		<tr><th>서블릿 규약 마이너 정보</th><td><%=application.getMinorVersion()%></td></tr>
	</table>
	<%
	log("로그 메시지 기록## jsp에서 기본 console로 출력되는 내용..");
	application.log("로그 메시지 기록(application 단위 로그)");
	%>	
	<%-- ex) 물건명, 가격, 갯수 변수를 선언하여, System.out.println(), log, application.log()로
		서버 console에 출력처리하세요.  5조 전체(손) --%>
	<%	
	String name = "사과";
	int price= 3000;
	int cnt = 5; // F11   debug
	System.out.println(name+":"+price+":"+cnt);	
	log(name+":"+price+":"+cnt);	
	application.log(name+":"+price+":"+cnt);
	String ename = request.getParameter("ename");
	// 1. 에러 tracking 1단계 서버의 console에 데이터가 정상 처리가 되는 지 확인..
	log("요청값1:"+ename);
	 %>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=ename%>"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>	
	<%
	log("요청값2:"+ename);
	if(ename!=null){ %>
	<h3>이름:<%=ename.toString()%></h3>
	<%}%>
		
	
</body>
</html>