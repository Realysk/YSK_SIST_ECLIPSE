<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %><%-- 디렉티브(directive) --%>
<%
// a01_all_constructor.jsp
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%><%-- 스크립트 : 스크립틀릿 --%>     
    
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
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
# jsp의 구성요소.
1. 디렉티브(directive) 	
2. 스크립트 : 스크립트릿, 표현식, 선언부
3. 표현언어(el) : ${변수명}
4. 기본 객체 : request, response, session, out, pageContext, application
5. 정적인 데이터
6. 표준액션 태그 : <jsp:include, <jsp:forward, 
7. 커스텀 태그와 표준 태그 라이브러리(jstl) <c:set <c:forEach  <c:if  
--%>
<%!
	// declare(선언부)	
	String name = "홍길동";
	public int plus(int num01, int num02){
		return num01+num02;
	}
%>
<%
	// scriptlet(스크립틀릿)
	// 데이터 할당, 조건 반복문 처리
%>
<body>
	<h2 align="center"><%=name%></h2><%-- expression(표현) --%>
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