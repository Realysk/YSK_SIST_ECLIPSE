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
# 
1. usebean에서 사용되는 property란 무엇을 의미하는지 vo 객체를 예로 기술하세요
	1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현
	2) 메서드 이름을 사용해서 프로퍼티의 이름을 결정  cf) 주의 필드가 아니다!!
	3) 규칙 : 프로퍼터 이름은 propertyName일 경우

	ex) 
	class Person{
		private String name; //  property가 아님
		public void setName(String name){  
			// set을 뺀 Name ==> 소문자 name 이것이 프로퍼터이다.
		}
		public String getName(){
			// get을 뺀 Name ==> 소문자 name 이것이 프로퍼터이다.
			// el에서 property이름으로 ${p01.name}으로 호출하여 사용할 수 있다.
		}
	}
2. Person 객체를 usebean으로 활용하여 이름, 나이, 사는 곳을 property로 저장하고, 호출하세요.
	


3. 모델1과 모델2의 차이를 기술하세요.
	1) 모델1
		jsp에서 화면을 호출할 때, 바로 요청 페이지에서 호출되어 필요로하는
		객체를 화면 jsp단에서 처리하는 것을 말한다. 전통적인 웹페이지 호출 방식으로
		간단한 화면 구성시 활용한다.
	2) 모델2
		요청값과 요청 페이지를 처리하는 controller(servlet)를 기반으로
		model(핵심데이터)를 만들어서, view(jsp/html)을 처리하는 방식을 말한다.
		controller가 중재자 역할을 하면서, 각각의 기능별로 분리를 처리하는 방식을 말한다.
		현재 가장 보편화되어 있는 개발 패턴 중에 하나이다. 
4. MVC란 무엇인지 servlet 클래스인, A03_MVC.java를 통해서 각각의 구성요소를 나타내고 설명하세요.
5. el 태그로 Member VO 객체의 정보를 출력하세요.
--%>
<%
	// page단위에서만 사용할 수 있는 범위 설정..
	pageContext.setAttribute("m01", new Member("himan","7777","홍길동","관리자",1000));

%>




<jsp:useBean id="p01" class="jspexp.z02_vo.Person"/>
<jsp:setProperty property="name" name="p01" value="홍길동"/>
<jsp:setProperty property="age" name="p01" value="25"/>
<jsp:setProperty property="loc" name="p01" value="서울"/>
<body>
	<h3 align="center">회원 정보</h3>
	<table  align="center" class="listTable">
		<tr><th>아이디</th><td>${m01.id }</td></tr>
		<tr><th>패스워드</th><td>${m01.pass }</td></tr>
		<tr><th>이름</th><td>${m01.name}</td></tr>
		<tr><th>권한</th><td>${m01.auth }</td></tr>
		<tr><th>포인트</th><td>${m01.point }</td></tr>
	</table>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>이름</th><td><jsp:getProperty property="name" name="p01"/> </td></tr>
		<tr><th>나이</th><td>${p01.age}</td></tr>
		<tr><th>사는곳</th><td>${p01.loc}</td></tr>
	</table>	
	
</body>
</html>