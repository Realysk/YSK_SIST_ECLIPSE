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
# 자바빈(javabeans)
1. 웹 프로그램밍에서 데이터의 표현을 목적으로 사용한다.
2. 일반적인 구성
	값을 저장 필드, 수정 setter메서드, 읽기 위한 getter 메서드..
	vo객체의 구성 처리.
3. 자바빈 프로퍼터.
	1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현
	2) 메서드 이름을 사용해서 프로퍼티의 이름을 결정  cf) 주의 필드가 아니다!!
	3) 규칙 : 프로퍼터 이름은 propertyName일 경우
		- setter : public void set프로퍼티명(타입)
		- getter : public 리턴타입 get프로퍼티명()
		- boolean 타입일 경우 getter에 get대신 is 사용 가능
		- 배열 지정 가능 ex) public void setNames(String []names)
	4) 읽기/쓰기
		- 읽기 전용 :get또는 is 메서드만 존재하는 프로퍼티
		- 읽기/쓰기  : get/set 또는 is/set 메서드가 존재하는 프로퍼티.
4. jsp:useBean 태그
	1) jsp에서 자바빈 객체를 생성할 때, 사용한다.
	2) 기본 형식
		<jsp:useBean id="빈이름" class="자바빈클래스이름" scope="범위"/>
		- id : jsp페이지에서 자바빈 객체에 접근할 때 사용할 이름
		- class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름
		- scope : 자바빈 객체가 저장될 영역을 저장한다.
			page, request, session, application 중 하나를 값을 가진다.	

--%>
<%

%>
<%--
	Member m01 = new Member();
	pageContext.setAttribute("m01",m01);
 --%>
<jsp:useBean id="m01" class="jspexp.z02_vo.Member" scope="page"/>
<jsp:useBean id="p01" class="jspexp.z02_vo.Product" scope="page"/>
<%
	m01.setName("홍길동"); // ㅡ m01의 set프로퍼터는 name
	p01.setName("사과");  // p01의 set프로퍼티는 name, price, cnt
	p01.setPrice(3000);
	p01.setCnt(5);
%>
<%-- ex) Product 클래스를 z02_vo에 생성하고, useBean을 객체를 생성후,
		물건명, 가격, 갯수를 출력 하세요  3조 --%>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>bean name 퍼로퍼티</th><td><%=m01.getName()%></td></tr>
		<tr><th>물건명</th><td><%=p01.getName()%></td></tr>
		<tr><th>가격</th><td><%=p01.getPrice()%></td></tr>
		<tr><th>갯수</th><td><%=p01.getCnt()%></td></tr>
	</table>	
	
</body>
</html>