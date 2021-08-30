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
# 정리문제
	1. useBean을 활용하여 요청값을 처리하는 코드를 예제로 기술하세요.
	
		<jsp:useBean id="빈이름" class="패키지명.자바클래스" scope="session범위"/>
		<jsp:setProperty name="p01" property="loc" value="서울"/>
	
	2. useBean과 dao를 활용하여 사원정보 검색을 출력하세요.
	
		
	
	3. el 태그의 empty는 어떤 활용을 할 수 있는지 실제 예제를 들어보세요.
	
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
	
	4. page scope와 session scope를 이용하여 회원정보를 받아 리스트되게 처리하세요.
	
	
	
	5. jstl을 통한 객체할당을 하고 property를 변경처리하세요.
	
	
	
	6. jstl 반복문과 조건문을 이용하여 3/6/9 게임을 20까지 처리하여 출력하세요.
	
	
	
	7. XMLHttpRequest 객체의 get/post, 동기/비동기 방식의 기본 처리 형식을 기술하세요.
	
		1. 화면에 JS의 이벤트를 통해서 XMLHttpRequest객체를 생성하고, XMLHttpRequest객체가 화면 전환 없이 요청값을 통해서 서버에 특정한 데이터를 받아서 다시 html화면에서 처리해주는 방식을 말한다.
			client <====================> server
					new XMLHttpRequest() 생성하여
							요청값 (request) =>
							<= 반응값 (response)
		2. 궁극적으로 웹 프로그래밍에서 비동기의 기준은 요청값으로 통해서 서버에서 호출하는 화면이나 데이터를 가져올 때까지 다른 작업이나 화면을 처리할 수 있는지 여부에 따른 내용이다.
			다른 작업이나 화면을 처리할 수 있으면 비동기, 데이터를 가져올 때까지 기다리는 것을 동기라고 한다.
			xhr.open("get/post","서버의자원-html,text,jsp",true/false, 동기/비동기);
			서버의자원 : 반응값으로 받는 자원 (xhr.responseText)
		3. 일반적 효율적인 데이터 처리나 프로그래밍에서는 비동기가 필요하다. 그러나 때때로 XMLHttpRequest를 통해서 현재화면을 refresh하지 않고 특정 데이터를 받아오는 내용 안에서 전체 데이터를 받거나 파일을 받고 처리해야 되는 경우에는 동기가 필요하다. 그래서 open()의 마지막 매개변수의 option을 동기/비동기로 나누고 있다.
			cf) 이벤트 핸들러 함수는 지금 일어나는 것이 아니고 만약에 클릭한다면을 가정으로 처리하는 함수이듯이 비동기를 옵션으로 했을 때만 이벤트 핸들러 onreadystatechange = function(){} 가 필요로 하여 처리된다.
		4. 동기작업은 send()메서드 후 데이터가 오기까지 기다렸다가 responseText를 통해서 서버에서 데이터를 받아서 처리한다.
			비동기 작업은 onreadystatechange 이벤트 메서드를 통해서 다른 작업을 하는 도중에 이벤트를 설정해놓고, 상태값으로 데이터가 전체 입력이 되었을 때 처리할 수 있도록 한다.
			ex) xhr.send(); xhr.responseText;로 해당 내용을 완료하기까지 기다린다.
		5. 비동기작업은 전송 후 다른 작업/프로세스를 진행하면서 요청상태값을 기준으로 해서 변경되는 메서드를 선언하고 (onreadystatechange) 상대값에 해당하면 서버에서 온 결과값을 처리한다.
			ex) xhr.onreadystatechange=function() {
					xhr.readyState, xhr.status 코드값으로 상태값을 확인 처리
				}
		cf. 참고
		1. XMLHttpRequest로 화면이 전체적으로 로딩된 상황에서 현재 화면을 특정한 자원에 의한 모두 다 변경하지 않고 일부분을 변경할 수 있게 처리한다. 구체적으로 form객체의 submit 버튼으로 전체화면을 변경시키는 것과 구분하여야 한다. 서버에 있는 자원을 화면전체나 json데이터를 통해서 받아와서 처리할 수 있다.
		2. 동기/비동기라는 내용은 XMLHttpRequest로 서버에 접속하여 처리할 때 다른 요소객체를 선택하거나 다른 프로세스를 수행할 수 있는지 여부에 따라 구분된다.
		3. 동기로 처리하면 서버에서 특정한 데이터나 요소객체가 다 올 떄까지는 다른 작업을 하지 못하게 처리할 때 필요로 한다.		
	
	8. 사원 empno를 입력하고 enter키를 눌렀을 때 자세한 정보를 아래에 출력되게 ajax로 처리하세요.
	
	

--%>
<%

%>
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