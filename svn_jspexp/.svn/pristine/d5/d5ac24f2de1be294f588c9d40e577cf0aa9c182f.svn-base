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
# jsp의 세션 범위 관련 기본 객체 
1. jsp는 변수들을 저장할 때, 특정한 범위로 저장을 할 수 있다.. 
	(page, request, session, application)
	(page 범위, 시간 - session time, 브라우저와 서버 관계, 서버)
	이때, 활용되는 객체가 session scope범위로 
	1) 한 페이지 단위에서 데이터를 저장하고 활용할 수 있는 pageContext, 
	2) 요청 page까지 데이터를 저장하고 활용할 수 있는 request,
		<jsp:forward page="요청페이지"/> request와 response를 요청페이지에
		전달..
		RequestDispatcher rd= request.getRequestDispatcher("페이지");
		rd.forward(request, response);	
		request.setAttribute("p01", new Person("홍길동",27,"서울신림동");
		요청된 페이지에서.
		Person p01 = (Person)request.getAttribute("p01");
		cf) MVC 패턴에서 모델데이터를 request로 객체에 저장한다.		 
	3) 브라우저가 닫힐 때까지 데이터를 저장하고 활용할 수 있는 session, 
		특정한 client(브라우저)와 server(웹 어플리케이션 서버-톰캣(WAS) )관계가 
		끝날 때까지
		[서버안]response.sendRedirect("이동할페이지") : 서버단 안에서 페이지 이동.
		[클라이언트]location.href="이동할페이지");
		[클라이언트]<a href="이동할페이지">안녕하세요</a>
		로 이동했을 때, 페이지를 이동했을지라도 특정 데이터나 객체를
		가지고 있을 수 있게 처리한다.
		ex) session.setAttribute("mem01", new Member("himan",7777,
		"홍길동",3000);
		Member mem01 = (Member)session.getAttribute("mem01");		
	4) 서버단위로 데이터를 저장하고 활용할 수 있는 application으로 기본 객체를
	지원하고 있다.
		다른 브라우저(client)가 다를지라도, 
		브라우저를 다 닫고, 다시 시작하더라도 데이터를 가지고 있을 수 
		있는 객체..ex) 주의 session은 url주소를 복사하여 같은 브라우저에서는
		창을 닫기까지 session값을 유지하나, 다른 브라우저(client가 다름)에서
		유지 되지 않으나, application 범위로를 접근이 가능하다.
		ex) application.setAttribute("data01", new Emp(7778,
		"홍길동","사원");
		Emp emp = (Emp)application.getAttribute("data01");




--%>
<%
// 1. page Scope 데이터 처리 : 현재 페이지에서만 사용할 수 있는 범위로 객체 선언.
	pageContext.setAttribute("pageVar", "홍길동(page)");
// 2. request Scope 데이터 처리.. : request 처리까지 데이터를 가지고 있다..
	request.setAttribute("requestVar", "김길동(request)");
//	RequestDispatcher rd = request.getRequestDispatcher("a02_sessionScope2.jsp");
//	rd.forward(request, response);
// 3. session scope 데이터 처리 : 같은 종류의 브라우저가 열려진 상황에서는 해당 페이지를 link나 location.href, 
//    등으로 변경하더라도 데이터를 유지하는 것을 말한다. 즉, 서버와 클라이언트가 접속하고 있는 상황에서 데이터 유지..
	session.setAttribute("sessionVar", "신길동(session)");
// 4. application scope 데이터 처리 : 브라우저의 종류와 접속과 상관없이 서버가 구동되어 있는 순간 데이터를 유지한다.
	application.setAttribute("applicationVar","마길동(application)");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("session scope");
	});
</script>
<body>
	<%--
	<jsp:useBean id="b01" class="jspexp.z02_vo.Member" 
		scope="page|request|session|application"></jsp:useBean> 
	<c:set var="변수명" value="데이터" scope="page|request|session|application"/>
	${b01.id}
	${변수명}
	
	--%>
		
	<jsp:forward page="a02_sessionScope2.jsp"/>
	
	<%-- request, response 정보와 함께 페이지 이동--%>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar")%></td></tr>
		<tr><th>request범위</th><td><%=request.getAttribute("requestVar")%></td></tr>
		<tr><th>session범위</th><td><%=session.getAttribute("sessionVar")%></td></tr>
		<tr><th>application범위</th><td><%=application.getAttribute("applicationVar")%></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>