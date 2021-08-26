<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# JSTL
	1. JSP Standard Tag Library : 널리 사용되는 커스텀 태그를 표준으로 만든 태그 라이브러리
	2. JSTL의 환경 설정
		1) WebContent\WEB-INF\lib에 jstl-1.2 jar 추가
		2) tag lib를 상단에 선언
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	3. JSTL의 핵심 tag 종류
		1) core : <c:XXX/> 변수지원, 흐름제어 url처리
		2) fmt : <fmt:XXX/> 지역, 메시지 형식, 숫자 및 날짜 형식
		3) x(xml 코어), sql(데이터베이스), fn(함수)
	4. 활용
		1) 변수 설정
			el 변수 값 설정
			<c:set var="변수명" value="값" scope="session범위"/>
			선언된 변수는 el로 호출할 수 있다. ${변수명}
			ex) <c:set var="name" value="홍길동" scope="request"/>
				<h2> 이름 : ${name} </h2>
			ex) <%
					request.setAttribute("p", new Person("홍길동", 25, "서울신림동"));
				%>
				<c:set var="p01" value="${p}"/>
				# property : 객체의 속성의 접근하는 메서드를 사용하는 것을 말한다.
				그런데, set/get을 제외하고 모두 소문자로 변경하여 활용한다.
				public void setName(String name){} 메서드가 있고 이 객체의 property name을 호출한다는 것은 위 기능 메서드를 호출해서 처리한다는 것이다.
				setName => Name => name 최종 name이 property를 의미한다.
				el이나 jstl에서 호출할 때 필드명과 동일하기에 필드로 오인하는 경우가 많은데 필드는 private 접근제어자가 붙어 있어 접근하지 못 한다.
				private String name;
				public String getName01() {
					return name;
				}
				${p01.name} => 에러발생, 필드를 접근하는 것이 아니고 getName01()이라는 기능 메서드의 property명인 name01로 접근해야 하기 때문이다. 그러므로 ${p01.name01}로 접근하여 호출할 수 있다.
		2) 객체의 값의 변경
			<jsp:useBean id="객체참조명" class="@@@">
			<%
				mvc의 컨트롤에서 선언된 코드, jsp의 scriptlet코드
				request.setAttribute("객체참조명", new 객체명(@@@))>;
			%>
			<c:set var="변수명" value="${참조명}"/new 객체명("")"
			<c:set target="객체명(bean의 id, session scope의 변수명, c:set의 var=변수명)" property="프로퍼티이름/set메서드명" value="할당할값"/>
			${객체명.프로퍼티명}
			cf) 바로 el코드로 처리해도 된다. ${객체명.setName("홍길동")}
			ex) <c:set target="p01" property="name" value="마길동"/>
			${p01.name} : 변경된 데이터 확인
		3) 조건문 처리
			- 단일 조건문
				<c:if test="${el의 변수를 비교/조건 연산식}">
					boolean이 true일 때 수행할 내용
				</c:if>
			- 다중 조건문
				<c:choose>
					<c:when test="조건1인경우"> 조건1이 true일 때 </c:when>
					<c:when test="조건2인경우"> 조건2이 true일 때 </c:when>
					// else if가 포함되어 조건1이 아니고 조건2인 경우이다.
					<c:when test="조건3인경우"> 조건3이 true일 때 </c:when>	
					<c:otherwise> 위의 조건을 제외한 나머지 </c:otherwise>				
				</c:choose>
				% 주의 - when test 구문은 앞에 조건을 제외한 내용이다.

--%>
<%

%>
<body>

	<h2 align="center">JSTL의 활용</h2>
	<c:set var="name" value="홍길동" scope="request"/>
	<c:set var="age" value="25" scope="page"/>
	<%--
		# 객체의 선언 방법
			1. 이전 페이지나 controller, scriptlet으로 세션객체.setAttribute("객체명", new 객체());
			2. <c:set var="변수명" value="<%=new 객체%>"/>
			3. <jsp:useBean/>
	--%>
	<%
		request.setAttribute("p01", new Person());
	%>
	${p01.setName('홍길동')}
	<table align="center" class="listTable">
		<tr><th> NAME </th><td> ${name}</td></tr>
		<tr><th> AGE </th><td> ${age}</td></tr>
		<tr><th> p01 </th><td> ${p01.name}</td></tr>
	</table>
	<c:set var="prod" value="<%=new Product()%>"/>
	${prod.setName('사과')}
	<%-- target="${객체참조}" property="프로퍼티명" value="할당할데이터"
		 prod.setPrice(3000)
	 --%>
	<c:set target="${prod}" property="price" value="3000"/>
	<c:set target="${prod}" property="cnt" value="2"/>
	<table align="center" class="listTable">
		<tr><th> 물건명 </th><td> ${prod.name}</td></tr>
		<tr><th> 가격 </th><td> ${prod.price}</td></tr>
		<tr><th> 수량 </th><td> ${prod.cnt}</td></tr>
	</table>
	
	<jsp:useBean id="mem" class="jspexp.z02_vo.Member"/>
	<jsp:setProperty property="id" name="mem" value="himan"/>
	<jsp:setProperty property="name" name="mem" value="홍길동"/>
	<table align="center" class="listTable">
		<tr><th> ID </th><td> ${mem.id}</td></tr>
		<tr><th> NAME </th><td> ${mem.name}</td></tr>
	</table>
	<%-- ex) 위 내용 중 set target으로 객체의 데이터 변경방식을 활용하여 Student 객체를 선언하여 데이터를 할당 후 el로 출력하세요. --%>
</body>
</html>