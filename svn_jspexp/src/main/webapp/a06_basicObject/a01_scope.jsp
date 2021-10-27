<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    buffer="10kb"
    %> <%--페이지 지시자를 통해서 buffer메모리 설정.. --%>
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
# 주요 기본 객체
1. jsp에서 사용되는 기본 객체는 다음과 같다.
	1) request : 클라이언트의 요청 정보를 저장한다.
	2) response : 응답 정보를 저장한다.
	3) pageContext : jsp 페이지에 대한 정보를 저장한다.
	4) session : HTTP 세션 정보를 저장한다.
	5) application : 웹 어플리케이션에 대한 정보를 저장한다.
	6) out : jsp 페이지가 생성하는 결과를 출력할 때 사용되는 출력 스트림이다.
	7) config : jsp 페이지에 대한 설정 정보를 저장한다.
	8) page : jsp 페이지를 구현한 자바 클래스 인스턴스이다.
	9) exception : 예외 객체. 에러 페이지에서만 사용된다.
2. out 기본 객체
	1) jsp 페이지가 생성되는 모든 내용은 out 기본 객체를 통해서 전송이 가능하다.
	2) 복잡한 if-else 사용시, out 기본 객체 사용하면 편리하다.
	3) 출력메서드
		print() : 데이터를 출력한다.
		println() : 데이터를 출력하고, 줄바꿈 처리를 한다.
		newLine() : 줄바꿈처리를 한다.
	4) 버퍼관련 메서드
		int getBufferSize() : 버퍼의 크기를 구한다.
		int getRemaining() : 현재 버퍼의 남은 크기를 구한다.
		clear() : 버퍼의 내용을 비운다. 만약 버퍼가 이미 플러시 되었다면  IOException을 발생시킨다.
		clearBuffer() : 버퍼의 내용을 비운다.
		flush() : 버퍼를 플러시한다.
		boolean isAutoFlush() : 버퍼가 다 찼을 때, 자동으로 플러시 할 경우 true를 리턴한다.

--%>
<%
	String name = "홍길동";
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">버퍼의 크기:<%=out.getBufferSize() %></h3>
	<h3 align="center">남은 버퍼의 크기:<%=out.getRemaining()%></h3>
	<h3 align="center">자동 flush:<%=out.isAutoFlush() %></h3>
	
	<%
	out.println("<h3 align='center'>"+name+"</h3>");
	%>
	<%--
	ex) 요청값을 age를 설정하여 out.println()를 활용하여 age가 18이상이면 성년 그외에는 미성년을 출력하세요.
		4조.. 전체(손들기)
	 --%>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>나이</th><td><input type="text" name="age" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="확인"/></td></tr>
	</table>	
	</form>
	<%
	String ageS = request.getParameter("age");
	if(ageS!=null){
		int age = Integer.parseInt(ageS);
		out.println("<h3 align='center'>"+(age>=18?"성년":"미성년")+"</h3>");
	}
	%>
	
</body>
</html>