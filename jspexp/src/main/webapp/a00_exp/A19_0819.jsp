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
# 정리 문제
	1. [JQuery] parent(), children()의 차이를 기본예제를 통해서 기술하세요.
	
		parents() : 상위계층 객체들
	   	parent() : 바로 상위 부모 객체	
	
	2. [JQuery] 이벤트를 처리할 때, event.target는 어떤 용도로 쓰이며, .is("선택자")는 어떻게 활용되는가?
	
		event.target : 이벤트가 일어난 대상 객체..
		.is("선택자") : 위 이벤트의 대상객체가 선택자에 해당하는 여부를 boolean값을 가져온다.	
	
	3. [JQuery] 아래와 같은 화면을 처리하세요.(위 event.target, find() 활용)
	    물건명 [  ] 가격 [  ] [등록] ==> 등록시 아래에 추가가 되고
	    번호 물건명 가격
	    ##  ###  ## ==> 추가된 항목을 클릭시, 배경색상이 변경된다.           
	    ##  ###  ##          
	
	
	
	4. [JQuery] 계층 구조관련 기능 action 메서드를 기술하세요.
	
		1) children("자식중선택자")
		2) parents() : 상위계층 객체들
		   parent() : 바로 상위 부모 객체
		3) next() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 다음 요소객체 지정
		4) prev() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 앞선 요소객체 지정
		5) siblings() : 형제요소객체들 지정	
	
	5. [JQuery] 아래의 화면을 내용을 처리하세요.
	    []서울[]대구[]부산[]광주 ==> check시, 바로옆레이블 배경색변경
	
	
	
	6. [JSP] 서버 404 에러 발생시, 예외 처리 페이지 지정 방식을 기술하세요.
	
		- 에러 처리
			1) 페이지별 에러 처리
				에러 페이지 지정 : errorPage = "에러발생시보여줄에러페이지"
				에러 페이지 작성 : isErrorPage = "true", exception.getMessage(), exceptopn.printStackTrace()
			2) 웹 서버 전체적으로 에러 지정
				web.xml
				(1) 에러코드별로 (http) 에러 지정
					<error-page>
						<error-code> 에러코드 </error-code>
						<location> 에러 페이지 URI </location>	
	
	7. [JSP] session과 cookie의 가장 큰 차이점을 기술하세요.
 
		Cookie : 개인 PC에 저장됨.
		Session : 접속중인 웹 서버에 저장됨.		

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
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