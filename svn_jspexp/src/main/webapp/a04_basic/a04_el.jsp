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
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 표현 언어
1. Expression language
2. jsp에서 사용가능한 새로운 스크립트 언어..
3. el의 주요 기능
	1) jsp의 네 가지 기본 객체가 제공하는 영역의 속성 사용
	2) 집합 객체에 대한 접근 방법 제공
	3) 수치 연산, 관계연산, 논리 연산 제공
	4) 자바 클래스 메서드 호출 기능 제공
	5) 표현언어만의 기본 객체 제공
4. 간단한 구문 때문에 표현식 대신 사용.
5. jsp에서 중급 단계에서 jstl과 함께 사용된다.
	1) 초급
		declare(<%! %>, scriptlet(<%%>), expression(<%=%>)
	2) 중급 
		el(${}), jstl( <c:set>, <c:forEach, <c:if> <c:forTokens>
		
	


--%>
<%
	request.setAttribute("num01", 25); // request 범위로 num01변수에 25를 할당
	request.setAttribute("num02", 30); // request 범위로 num02변수에 30를 할당
	request.setAttribute("name", "홍길동"); // request 범위로 num02변수에 30를 할당
	
// ex)  물건명 가격 갯수를 request로 선언하고,  el 로  물건명 가격 갯수 총계를 출력 하세요  5조
	request.setAttribute("name","사과");
	request.setAttribute("price",2000);
	request.setAttribute("cnt",5);
	request.setAttribute("prod",new Product("오렌지",2000,10));
	//session.setAttribute("mem", dao.getMember())
	//  el 태그는 property 개념으로 접근이 가능한다. getXXXX, ##주의  접근제어자가 있는 field를 접근하는 것이 아니고,
	//  public으로 된 get프로퍼터를 접근해서 호출하는 것이다.
%>
<body>
	<!-- 조건문으로 mem의 auth가 admin일때... -->
	<input type="button" value="공지사항 등록"/>
	
	<h2 align="center"></h2>
	<h3 align="center">${"EL 태그로 출력"}</h3>
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.name}</td></tr> <%-- prod.getName()를 호출하여 처리하는 것이다. --%>
		<tr><th>가격</th><td>${prod.price}</td></tr>
		<tr><th>갯수</th><td>${prod.cnt}</td></tr>
	</table>	
	
	
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${name}</td></tr>
		<tr><th>가격</th><td>${price}</td></tr>
		<tr><th>갯수</th><td>${cnt}</td></tr>
	</table>	
	
	<table  align="center" class="listTable">
		<tr><th>이름 : ${name}</th></tr>
		<tr><th>${num01} + ${num02} = ${num01+num02}</th></tr>
		<tr><th>${num01} - ${num02} = ${num01-num02}</th></tr>
		<tr><th>${num01} * ${num02} = ${num01*num02}</th></tr>
		<tr><th>${num01} / ${num02} = ${num01/num02}</th></tr>
	</table>	
	
</body>
</html>