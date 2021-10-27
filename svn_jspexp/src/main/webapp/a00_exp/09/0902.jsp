<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>
<%-- 
# 정리문제
1. com.google.gson.Gson api를 활용하여, 객체를 json 문자열로, json 문자열을 객체로 변환하는
    기본 메서드를 기술하세요.
    Gson gson = new Gson();
    객체 ==> json 문자열
    String jsonString = gson.toJson(객체);
    json문자열 ==> 객체
    객체 참조 = gson.fromJson(json문자열, 클래스명.class);
    
    
2. MVC 패턴을 활용하여 ajax 데이터를 처리할려고 한다. controller, service, dao, view 단 위주로
    처리하는 핵심 프로세스를 정리하세요.
    1) 처리구조
    controller( url : call.do )
       요청값처리 : request.getParameter("key")
       model데이터처리  <-- service <-- dao
       		ajax는 모델데이터를 선언할 필요없이 json데이터로 처리
       		service단에서 Gson api 활용		
       view단호출
       		초기화면 호출(ajax처리일때만)..: response.redirect("호출할 페이지");
       		response.getWriter().print("json문자열데이터")
    View
       요청처리할 화면 name으로 구성 : <input name="key"
       js controller를 ajax 호출..
       var xhr = new XMLHttpRequest();
       $("이벤트선택자").이벤트명(function(){
       		xhr.open("get/post","${path}/call.do?요청key=요청값",true);
       		...
       		var jObj = JSON.parse(xhr.responseText);
       });
           
3. 전날 처리한 ajax 회원 id 조회 화면에서 등록,수정,삭제을 버튼을 추가하여 ajax로 처리해 보세요.
	1) 파일 및 핵심 코드
	controller(A27_AjaxController.java, /schMember.do)
		요청
		조건에 따른 초기화면, ajax 데이터
			service단
	service(CommonService.java)
		
	view(a14_mvc\a07_mvc_DB3.jsp)
		초기화면 호출	


# 주요 목표
1. jquery의 이벤트와 ajax처리의 핵심코드를 이해하고, 처리할 수 있다.
2. 스프링 개발 환경을 이해하고, 설치할 수 있다.
3. 스프링의 MVC 개발 패턴을 이해하고, 초기화면을 출력할 수 있다.

# 주요 개념 및 코드
1. $.ajax(), $.getJSON()
2. show(), hide(), toggle(), fadeIn(), fadeOut(), slideUp() 
3. 컨테이너, DI
--%>
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