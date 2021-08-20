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
# Session
	1. 웹 컨테이너에서 클라이언트의 정보를 보관할 때 사용된다.
	2. 오직 서버에서만 생성하여 저장된다.
	3. 클라이언트와 관계에서 세션이 생성되기에, 같은 브라우저가 아니면 세션은 종료가 된다.
	4. session의 설정
		session.setAttribute("세션명", 할당할객체);
		지정한 세션만 삭제 session.removeAttribute("세션명");
		전체 세션의 종료 : session.invalidate();
	5. session의 유효시간 설정
		1) web.xml
		<session-config>
			<session-timeout> 분 단위 </session-timeout>
		</session-config>
		2) setMaxInactiveInterval();

--%>
<%
	// 1. 기본 변수 할당
	session.setAttribute("num01", 25);
	// 2. 기본 객체 할당
	session.setAttribute("p01", new Person("홍길동", 25, "서울"));
	// 3. 배열형 List 객체 할당
	session.setAttribute("list", Arrays.asList("사과","바나나","딸기"));
	
	// 1. 변수 가져오기
	int num01 = (Integer)session.getAttribute("num01");
	// 2. 객체 가져오기
	Person p01 = (Person)session.getAttribute("p01");
	// 3. 배열 가져오기
	List<String> fruits = (List<String>)session.getAttribute("list");
	
	// ex) 변수 num02, 객체 Product, 배열객체 List<Member>로 session으로 저장 후 호출하세요.

	session.setAttribute("num02", 30);
	session.setAttribute("prod1", new Product("사과", 3000, 3));
	session.setAttribute("mlist", Arrays.asList("hong111","1111","홍길동","사용자",5000));
	
	int num02 = (Integer)session.getAttribute("num02");
	Product prod1 = (Product)session.getAttribute("prod1");
	List<Member> mlist = (List<Member>)session.getAttribute("mlist");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
<body>

	<h2 align="center"></h2>
	<table align="center" style="text-align:center" class="listTable">
		<tr><th> 변수 (num01) </th><td colspan="3"><%=num01 %></td></tr>
		<tr><th> 변수 EL (num01) </th><td colspan="3">${num01}</td></tr>
		<tr><th> 객체 (p01) </th><td><%=p01.getName() %></td><td><%=p01.getAge() %></td><td><%=p01.getLoc() %></td></tr>
		<tr><th> 객체 EL (p01) </th><td>${p01.name}</td><td>${p01.age}</td><td>${p01.loc}</td></tr>
		<tr><th> 배열 (List) </th><td><%=fruits.get(0) %></td><td><%=fruits.get(1) %></td><td><%=fruits.get(2) %></td></tr>
		<tr><th> 배열 EL (List) </th><td>${list.get(0)}</td><td>${list.get(1)}</td><td>${list.get(2)}</td></tr>
	</table>
	
	<%-- ex) 변수 num02, 객체 Product, 배열객체 List<Member>로 session으로 저장 후 호출하세요. --%>
	
	<table align="center" style="text-align:center" class="listTable">
		<tr><th> 변수 (num02) </th><td colspan="5"><%=num02 %></td></tr>
		<tr><th> 변수 EL (num02) </th><td colspan="5">${num02}</td></tr>
		<tr><th> 객체 (prod1) </th><td><%=prod1.getName() %></td><td><%=prod1.getPrice() %></td><td><%=prod1.getCnt() %></td></tr>
		<tr><th> 객체 EL (prod1) </th><td>${prod1.name}</td><td>${prod1.price}</td><td>${prod1.cnt}</td></tr>
		<tr><th> 배열 (mlist) </th><td><%=mlist.get(0) %></td><td><%=mlist.get(1) %></td><td><%=mlist.get(2) %></td><td><%=mlist.get(3) %></td><td><%=mlist.get(4) %></td></tr>
		<tr><th> 배열 EL (mlist) </th><td>${mlist.get(0)}</td><td>${mlist.get(1)}</td><td>${mlist.get(2)}</td><td>${mlist.get(3)}</td><td>${mlist.get(4)}</td></tr>
	</table>
	
</body>
</html>