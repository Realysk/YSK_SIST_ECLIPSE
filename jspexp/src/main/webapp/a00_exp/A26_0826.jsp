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
	1. 비교연산자와 논리연산자의 문자열 비교/논리처리 형식을 비교 기술하세요.
	
		request.setAttribute("num01",25);	
		request.setAttribute("num02",5);	
		${num01+num02}, ${num01*num02} 사칙연산
		${num01>=num02} 관계연산
		request.setAttribute("mem",new Member("himan",7777");
		${mem.id=='himan' and mem.pass=='7777'}
		비교연산자 - ==,eq, !=, ne, 
					< 또는 lt, >, gt, >= ge
		논리연산 처리 && and, || or, ! not		
	
	2. empty 연산자를 이용하여, 아이디입력 유무를 표기하세요.
	    아이디[   ][등록확인]==> el태그로 요청값 입력여부로 js로 표기
	
	
	
	3. jstl사용 설정방법을 기술하세요.
	
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		
		path 부분은 전부 el태그로 표기 ${path}
	
	4. el과 jstl을 활용하여, 기본 경로 설정과 한글 post방식 요청값에 대한 encoding 처리를 기술하세요.
	
		
	
	5. XMLHttpRequest은 어떤 역할을 하는 객체인지 기술하세요.
	
		XMLHttpRequest객체가 화면 전환 없이 요청값을 통해서 서버에 특정한 데이터를 받아서 다시 html화면에서 처리해주는 방식을 말한다.
	
	6. 동기와 비동기 통신 방식의 차이를 기술하고, XMLHttpRequest에서는 코드상 어떤 차이가 있는지 기술하세요.
	
		동기작업은 send()메서드 후 데이터가 오기까지 기다렸다가 responseText를 통해서 서버에서 데이터를 받아서 처리한다.
			비동기 작업은 onreadystatechange 이벤트 메서드를 통해서 다른 작업을 하는 도중에 이벤트를 설정해놓고, 상태값으로 데이터가 전체 입력이 되었을 때 처리할 수 있도록 한다.
			ex) xhr.send(); xhr.responseText;로 해당 내용을 완료하기까지 기다린다.
		비동기작업은 전송 후 다른 작업/프로세스를 진행하면서 요청상태값을 기준으로 해서 변경되는 메서드를 선언하고 (onreadystatechange) 상대값에 해당하면 서버에서 온 결과값을 처리한다.
			ex) xhr.onreadystatechange=function() {
					xhr.readyState, xhr.status 코드값으로 상태값을 확인 처리
				}		
	
	7. 두개버튼을 만들고 동기/비동기 방식으로 z01_data.txt에 있는 인사말을 불러서 출력하세요.
	    [동기호출][비동기호출]
	    데이터 출력
	
	
	
	8. json 데이터의 기본형식을 기술하세요.
	
		1) {속성:속성값},[{속성:속성값....}]
		2) 웹서비스상 json형식은 다음과 같은 형식을 준수하여야 정상적으로 객체화하여 사용할 수 있다.
		3) 형식 (ajax 처리 시 반드시 지켜야 한다.)
			{"속성":"문자열데이터","속성":숫자형/boolean형데이터}
			속성과 문자열 데이터는 반드시 ""(쌍따옴포) 사이에 입력해야 한다.
			cf) ''사이에 입력하거나 없이 입력하는 것은 정상처리가 되지 않는다.
				숫자형/boolean형 데이터는 반드시 ""/'' 없이 그대로 처리해야 한다.
				ex) {"empno":7780, "ename":홍길동, "sal":7000}		
	
	9. json 문자열 데이터를 json 객체로 변환하는 메서드를 기술하세요.
	
		responseText로 받은 데이터는 문자열형 json데이터이기에 객체로 사용하려면 eval('('+xhr+')') 함수를 이용해야 한다. JSON.parse(xhr) 객체 함수 이용
		네트워크로 전달되어 온 데이터는 문자열형이기에 객체로 변환하여 사용할 수 있다.
		-- eval('('+xhr+')'), JSON.parse(xhr)		
	
	10. z06_data.txt에 구매 정보([])를 선언후, a06_buyList.jsp로 구매정보를 테이블에 리스트 처리하세요.(전날마지막문제)
	
	

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