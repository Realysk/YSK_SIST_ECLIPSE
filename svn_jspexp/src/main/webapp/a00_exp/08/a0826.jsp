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

</head>
<%-- 
# 정리문제
1. 비교연산자와 논리연산자의 문자열 비교/논리처리 형식을 비교기술하세요.
	== : eq, != : ne (not equal), >= :ge(greater equal), <= :le(less equal)
	< : lt(less than), > : gt(greater than), && : and, || : or, ! :not
2. empty 연산자를 이용하여, 아이디입력 유무를 표기하세요.
    아이디[   ][등록확인]==> el태그로 요청값 입력여부로 js로 표기
3. jstl사용 설정방법을 기술하세요.
	1) lib 추가 : \webapp\WEB-INF\lib\jstl-1.2.jar
	2) 디렉티브 선언 : 
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	3) 테스트 및 확인 
		<c:set var="name" value="홍길동"/>
		${name}	 		

4. el과 jstl을 활용하여, 기본 경로 설정과 한글 post방식 요청값에 대한 encoding 처리를 기술하세요.
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	:서버안에 자원(소스 및 이미지 lib)을 접근할 때, 기준 경로를 설정할 수 있다.
	<fmt:requestEncoding value="utf-8"/>
	:요청값에 대한 한글 encoding 방식을 처리한다(주로 post방식일 때, 처리)

5. XMLHttpRequest은 어떤 역할을 하는 객체인지 기술하세요.
	클라이언트(브라우저)와 서버(톰캣)간에 요청값을 전송하거나, 반응값을 받을 때,
	화면 전환없이 처리하게 해주는 js의 객체이다.
	option에 따라, 동기적/비동기적으로 처리해준다.

6. 동기와 비동기 통신 방식의 차이를 기술하고, XMLHttpRequest에서는 코드상 어떤 차이가 있는지 기술하세요.
	동기방식 : 클라이언트가 특정한 자원을 서버에 요청하면 그 데이터가 올 때까지 다른 작업을 하지 않고 있다가
		오면 처리하는 방식을 말한다.
		xhr.open("","",false);
	비동기방식 : 클라이언트가 서버에 특정 자원을 요청하는 이벤트 핸들러를 만들고, 해당 이벤트 핸들러에
		결과값이 올 때를 대비해서 처리해 놓고, 다른 작업을 수행할 수 있게 하는 방식을 말한다.
		xhr.open("","",true);
		xhr.onreadystatchange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				// 조건일 때, 처리된다.
7. 두개버튼을 만들고 동기/비동기 방식으로 z01_data.txt에 있는 인사말을 불러서 출력하세요.
    [동기호출][비동기호출]
    데이터 출력
8. json 데이터의 기본형식을 기술하세요.
	반응값으로 json 데이터를 전달해서 js스크립트로 사용될 때, 꼭 지켜야 형식 선언..
	문자열형 json 데이터 ==> 객체형 데이터로 활용을 위해 필수요건
	[],{}
	{"속성":"문자열데이터","속성":숫자형/boolean형데이터 }
	ex) {"name":"홍길동","age":25,"isMarried":false}

9. json 문자열 데이터를 json 객체로 변환하는 메서드를 기술하세요.
	eval('('+문자열json데이터+')') 
	JSON.parse("문자열json데이터");

10. z06_data.txt에 구매 정보([])를 선언후, a06_buyList.jsp로 구매정보를 테이블에 리스트 처리하세요.(전날마지막문제)
# 오늘의 학습 목표
1. ajax의 get/post방식으로 요청을 처리하고 결과값을 처리할 수 있다.
2. 비동기 통신을 통한 화면 호출/json 데이터 호출방식을 이해하고 처리할 수 있다.
3. json parser를 js와 java단 처리의 필요성을 이해하고 활용할 수 있다.
4. jstl을 통한 변수선언, 조건문, 반복문을 활용하여 데이터를 처리할 수 있다.
5. jstl과 el을 상호 조합하여 효과적으로 처리할 수 있다.
# 핵심 개념 및 코드 찾아보기
1. 요청 header값의 변경 : xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
2. jstl : <c:set var="" value="" scope="" target=""/> 
	<c:if test="${point ge 70}"/><c:choose><c:when test="">
3. <c:forEach var="emp" item="${empList}" varStatus="sts"/> 
		${sts.index}${sts.count}${sts.first}${sts.last}
--%>
<script type="text/javascript">
	var idCheck = "${param.id}";
	if(idCheck==""){
		alert("아이디 입력하세요!!")
	}
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();	
		$("#btnSyn").click(function(){
			xhr.open("get","z01_data.txt",false);
			xhr.send();
			$("h3").text(xhr.responseText);
		});			
		$("#btnASyn").click(function(){
			xhr.open("get","z01_data.txt",true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					$("h3").text(xhr.responseText);		
				}
			}
		});		
	});
</script>
<body>
	<h2 align="center">연습문제</h2>
	<p align="center">
		<input type="button" value="동기방식" id="btnSyn"/>
		<input type="button" value="비동기방식" id="btnASyn"/>
	</p>
	<h3 align="center"></h3>
	
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="확인"/></td></tr>
	</table>	
	</form>
	<h3 align="center">${(empty param.id)?"아이디 입력 안됨!":"입력 성공"}</h3>
	
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>