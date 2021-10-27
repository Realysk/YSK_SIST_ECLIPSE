<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="a01_all_constructor.jsp" %> 
<%-- 이전 페이지 있는 변수와 같이 컴파일 되기에 같은 변수 선언 주석 --%>   
<%-- 
# directive
1. jsp 페이지에 대한 설정 정보를 지정
2. 디렉티브 구문
	<%@ 디렉티브이름 속성="속성값", 속성2="속성값2"
3. 종류
	1) page : jsp페이지에 대한 정보를 지정, 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리를 지정. : 기본 tag에서 확장적으로 사용자 정의 태그를 활용할 수 있게
		jsp 프로그램으로 만드는 것을 말한다. ex) jstl을 활용해서 <c:if <c:forEach...
	3) include : 다른 문서를 포함 :다른 jsp 파일 호출, 같이 컴파일 처리 변수 중복 처리 안 됨..
		cf) <jsp:include page=""/>와 차이점은 위 디렉티브 include를 포함된 소스를 합쳐서
			컴파일하지만, action 태그의 jsp:include는 각각 따로 java를 만들어 포함하는 관계에 있다.
			 	
4. page 디렉티브
	1) jsp 페이지에 대한 정보를 입력
		jsp가 생성할 문서의 타입, 사용할 클래스, 버퍼여부, 세션 여부
	2) jsp 디렉티브의 작성 예
		<%@ page contentType="text/htm; ..
		<%@ page import
	3) 주요 속성
		contentType : jsp가 생성할 문서의 타입을 지정. ex) html 화면, 기본 text, pdf/excel, 파일스트림을 통한 다운로드..
		import : jsp 페이지에서 사용할 자바 클래스를 지정.
		session : jsp 페이지가 세션을 사용할 지의 여부를 지정 default는 true
		info : jsp 페이지에 대한 설명을 입력한다
		errorPage : 에러가 발생할 때 보여 줄 페이지를 지정
		isErrorPage : 에러페이지인지의 여부를 지정.
				
--%>    
    
   
    
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

<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>