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
# 정리문제
	1. [JSP] 세션 scope의 범위를 구체적인 내용과 함께 기술하세요
	
	- JSP의 세션 범위 관련 기본 객체
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
	
	2. [JSP] application 객체를 활용하여 web.xml에 설정되어 있는 값을 처리하는 코드를 기술하세요.
	
	
	
	3. [JSP] <jsp:include> 액션 태그와 include의 기본 코드와 차이점을 기술하세요.
	
		@include 지시어 : 원래 페이지 안으로 include 지시어로 지정한 페이지의 소스가 그대로 복사 된다.
		<jsp:include> 액션태그 : 소스 코드가 복사되는 것이 아니라 제어권 자체가 include 액션으로 지정된 페이지로 넘어갔다가 다시 원래 페이지로 돌아온다.
	
	4. [JSP] <jsp:include> 액션 태그로 매개변수값으로 데이터를 처리하는 방식을 이용해서 포함된 페이지에 아이디값을 넘기세요.
	    로그인 메뉴1 메뉴2 ==> 클릭시, 하단 메뉴 이동
	    로그인 ID [  ][로그인] ==> 로그인후 메뉴1로 이동 ID값 전달
	
	
	
	5. [JSP] <jsp:forward>를 활용하여 물건명과 가격, 갯수를 입력하여 결과페이지(물건명,계)를 출력하세요.
	
	
	
	6. [JQuery] filter()와 not()의 차이를 기술하세요.
	
		- filter 기능 메서드 활용
			1. 기본 filter("선택자형식");
			2. filter(function(idx, 요소객체) {return boolean값;});
			
			cf) 기능메서드의 chaining
			$("요소선택자").기능메서드1().기능메서드2().기능메서드3()
				기능메서드가 연결해서 처리가 가능하다는 말을 의미한다.
				
		- not() : 해당 소스 코드의 반대로 코딩결과가 나타난다.
	
	7. [JQuery] 버튼을 클릭시, h2는 배경색상 노랑색으로 처리하고, add()를 활용해서 h2와 함께 h3의 글자색상을 navy로 처리하세요.
	
	
	
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>