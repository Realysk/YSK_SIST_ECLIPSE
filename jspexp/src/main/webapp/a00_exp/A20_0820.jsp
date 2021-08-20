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
# 정리문제
	1. jsp에서 예외클래스 등록을 처리하는 순서를 정리 하세요.
	
		1) 페이지별 에러 처리
			에러 페이지 지정 : errorPage = "에러발생시보여줄에러페이지"
			에러 페이지 작성 : isErrorPage = "true", exception.getMessage(), exceptopn.printStackTrace()
		2) 웹 서버 전체적으로 에러 지정
			web.xml
			(1) 에러코드별로 (http) 에러 지정
				<error-page>
					<error-code> 에러코드 </error-code>
					<location> 에러 페이지 URI </location>
				</error-page>
			(2) 예외 처리 클래스 관련 에러 지정
				에러 클래스를 선언하여 해당 내용에 합당한 부분을 location으로 호출하여 처리할 수 있다.
				<error-page> 
	
	2. 쿠키를 브라우저와 서버간에 처리코드를 기술하세요.
	
		1) 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송된다.
		2) 동작 방식
			(1) 쿠키 생성 : 웹 서버 => 브라우저 (쿠키저장소) : response.addCookie(new Cookie(name, value));
			(2) 쿠키 저장 : 브라우저의 쿠키 저장소에 저장 처리 : 
			(3) 쿠키 전송 : 브라우저 => 웹 서버 (요청 객체를 통해서 전달) : request.getCookies();
		3) 쿠키의 구성
			(1) 구성 요소
				- 이름 : 각각의 쿠키를 구별하는데 사용되는 이름
				- 값 : 쿠키의 이름과 관련된 값
				- 유효시간 : 쿠키의 유지 시간
				- 도메인 : 쿠키를 전송할 도메인
				- 경로 : 쿠키를 전송할 요청 경로
			(2) 쿠키 이름의 제약 (특수문자와 한글 처리)
				- 쿠키의 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 있다.
				- 콤마, 새미콜롬, 공백 등의 문자는 포함할  수 없다.
				- $로 시작할 수 없다.
				=> encoding 처리를 해야 한다.
			(3) 쿠키의 encoding과 decoding 처리
				한글과 같은 문자를 처리할 때 encoding으로 저장하고 decoding으로 불러와야 한다.
				Encoding 처리 : URLEncoder.encoder("한글데이터", "UTF-8");
				Decoding 처리 : URLDecoder.decoder("한글데이터", "UTF-8");
		4) 쿠키값의 삭제
			(1) 쿠키값은 일단 서버와 클라이언트가 끊어지면 사라진다.
				서버가 재기동 또는 클라이언트의 브라우저를 다 닫으면 서버와 연결이 끊어진다.
			(2) 클라이언트 프로그램으로 삭제할 수 있지만 JSP는 서버프로그램으로 삭제해야 하므로 해당 쿠키를 다시 클라이언트로 보내기 전에 유효시간을 0으로 설정하여 response 객체로 전달하여 삭제 브라우저의 저장 위치에서 삭제되게 한다.
				ex) ck.setMaxAge(0);
					response.addCookie(ck);	
	
	3. 쿠키의 한글처리시 사용하는 코드를 기술하세요.
	
		import="java.net.*"		
		Cookie 쿠키명 = new Cookie(URLEncoder.encode("속성값1", "UTF-8"), URLEncoder.encode("속성값2", "UTF-8"));
		<%=URLDecoder.decode(ck.getName(), "UTF-8") %> <%=URLDecoder.decode(ck.getValue(), "UTF-8") %>
	
	4. 쿠키값 삭제 2가지 방법을 기술하세요.

		(1) 쿠키값은 일단 서버와 클라이언트가 끊어지면 사라진다.
			서버가 재기동 또는 클라이언트의 브라우저를 다 닫으면 서버와 연결이 끊어진다.
		(2) 클라이언트 프로그램으로 삭제할 수 있지만 JSP는 서버프로그램으로 삭제해야 하므로 해당 쿠키를 다시 클라이언트로 보내기 전에 유효시간을 0으로 설정하여 response 객체로 전달하여 삭제 브라우저의 저장 위치에서 삭제되게 한다.
			ex) ck.setMaxAge(0);
				response.addCookie(ck);		
	
	5. 쿠키를 활용하여 영화를 예매하고, 최종 결재할 내용만 남기는 처리를 하세요.
	    [영화제목][보통/3d/4d][금액][관람갯수][예매] ==> 현예매현황(최종내용현황)
	    [] 영화제목 분류 금액 관람수
	    []  @@@  @@  @@@ @@@
	          [제외][결재]
	          
	          
	          
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