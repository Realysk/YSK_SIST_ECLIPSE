<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# JSP의 세션 범위 관련 기본 객체
	1. JSP는 변수들을 저장할 때, 특정한 범위로 저장을 할 수 있다.
		(page 범위, 시간 - sesssion time, 브라우저와 서버 관계, 서버)
		이 때, 활용되는 객체가 session scope 범위로
		1) 한 페이지 단위에서 데이터를 저장하고 활용할 수 있는 pageContext,
		2) 요청 page까지 데이터를 저장하고 활용할 수 있는 request,
			<jsp:forward page="요청페이지"/> request와 response를 요청페이지에 전달
			RequestDispatcher rd = request.getRequestDispathcer("페이지");
			rd.forward(request, response);
			request.setAttribute("p01", new Person("홍길동", 27, "서울신림동"));
			요청 된 페이지에서 Person p01 = (Person)request.getAttribute("p01");
		3) 브라우저가 닫힐 때까지 데이터를 저장하고 활용할 수 있는 session, 특정한 client(브라우저)와 server(WAS-톰캣) 관계가 끝날때까지
			response.sendRedirect("이동할페이지");
			location.href="이동할페이지";
			<a href="이동할페이지">안녕하세요</a>로 이동했을 때 페이지를 이동했을지라도 특정 데이터나 객체를 가지고 있을 수 있게 처리한다.
				ex) session.setAttribute("mem01", new Member("himan", 7777, "홍길동", 3000);
					Member mem01 = (Member)session.getAttribute("mem01");
		4) 서버단위로 데이터를 저장하고 활용할 수 있는 application으로 기본 객체를 지원하고 있다.
			다른 브라우저(client)가 다를지라도, 브라우저를 다 닫고 다시 시작하더라도 데이터를 가지고 있을구 있는 객체
			ex) 주의! session은 url주소를 복사하여 같은 브라우저에서는 창을 닫기까지 session값을 유지하나 다른 브라우저(client가 다름)에서 유지 되지 않으나, application 범위로 접근이 가능하다.
				ex) application.setAttribute("data01", new Emp(7778, "홍길동", "사원");
				Emp emp = (Emp)application.getAttribute("data01");

--%>
<%
	// 1. page Scope 데이터 처리 : 현재 페이지에서만 사용할 수 있는 범위로 객체 선언
		pageContext.setAttribute("pageVar", "홍길동(page)");
	// 2. request Scope 데이터 처리 : request 처리까지 데이터를 가지고 있다.
		request.setAttribute("requestVar", "김길동(request)");
		RequestDispatcher rd = request.getRequestDispatcher("a02_sessionScope2.jsp");
		rd.forward(request, response);
	// 3. session scope 데이터 처리 : 같은 종류의 브라우저가 열려진 상황에서는 해당 페이지를 link나 location.href, 등으로 변경하더라도 데이터를 유지하는 것을 말한다. 즉, 서버와 클라이언트가 접속하고 있는 상황에서 데이터 유지.
		session.setAttribute("sessionVar", "신길동(session)");
	// 4. application scope 데이터 처리 : 브라우저의 종류와 접속과 상관없이 서버가 구동되어 있는 순간 데이터를 유지한다.
		application.setAttribute("applicationVar", "마길동(application)");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("session scope");
	});

</script>
<body>

		<jsp:forward page="a02_sessionScope2.jsp"/>

	<%-- request, response 정보와 함께 페이지 이동 --%>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar") %></td></tr>
		<tr><th>request범위</th><td><%=request.getAttribute("requestVar") %></td></tr>
		<tr><th>session범위</th><td><%=session.getAttribute("sessionVar") %></td></tr>
		<tr><th>application범위</th><td><%=application.getAttribute("applicationVar") %></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>