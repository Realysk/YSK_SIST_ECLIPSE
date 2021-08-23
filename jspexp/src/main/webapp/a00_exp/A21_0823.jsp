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
	1. [jquery] filter()의 사용형식과 end()기능메서드의 의미를 기술하세요.
	
		기본 filter("선택자형식");
		filter(function(idx, 요소객체) {return boolean값;});		
	
	2. [jquery] event.target의 활용하는 기본예제를 기술하세요.
	
		$("#ul02").click(function(event){ // 이벤트에 일어난 내용..
			console.log(event.target);
			$(event.target).css("background",'orange');
		}); 		
	
	3. [jquery] 버튼을 클릭시, 하단에 h3가 추가되고, h3를 클릭시, 배경색상이 변경되게 처리하세요.
	
	
	
	4. [jquery] 계층 구조 메서드를 기술하세요.
	
		1) children("자식중선택자")
		2) parents() : 상위계층 객체들
		   parent() : 바로 상위 부모 객체
		3) next() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 다음 요소객체 지정
		4) prev() : 형제(같은 부모 요소객체를 같은 level에 있는 요소객체) 중에 앞선 요소객체 지정
		5) siblings() : 형제요소객체들 지정	
	
	5. [jsp] 액션 태그 <jsp:include><jsp:forward>의 차이점을 기술하세요.
	
		<jsp:include> : 해당 페이지를 포함한다. 
		
		<jsp:forward> : 해당 페이지로 요청 값과 함께 이동 처리된다. (request 요청 값은 함께 하여 이동)
	
	6. [jsp] 위 액션 태그를 활용하서 메뉴별 페이지가 이동되게 처리하세요.
	
	
	
	7. [jsp] 에러 코드와 클래스별 예외 처리를 web.xml(서버)단위로 처리하는 것을 기술하세요.
	
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
	
	8. [jsp] 쿠키를 활용하여, 물건을 카트에 담고, 삭제 처리하게 하세요.
	
	
	
	9. [jsp] 세션값의 설정과 할당을 List<VO>로 설정되게 하세요.
	
	
	
	10. [jsp] 해당 기능 버턴을 클릭시, 세션값이 없을 때, 로그인 페이지로 이동되게 처리하세요.
 
	

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