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
		$("h2").text("기념일 계산");
	});
</script>
</head>
<%-- 
# 주간정리
진행 프로세스 
1) 전날 내용 및 지난 주, 내용을 확인 일단 한번 정리
2) 문제에 합당한 개념 정리, 범위 처리..



1. jsp 기본 객체 중 특정한 시간적인 범위를 지정하여 설정할 때, 쓰이는 객체들과
    이 범위에 대하여 기술하세요.
    서버와 클라이언트의 연결된 상태를 session 이라고 하는데,
    변수들은 이를 기초로한 session범위로 처리하고 있다.
    page : pageContext 페이지 범위 : 한 페이지 내에서만 사용이 가능하고 다음 페이지에서는
    	사용 불가능 하다.
    request : 요청 범위 : 요청값 전달(request) 범위까지 데이터를 사용하는 것을 말한다.
    	submit, location.href의 요청값을 호출하였을 때, 해당 처리 범위까지 사용한다.
    session : 세션 범위 : 브라우저가 서버와 연동하는 범위까지 데이터를 사용한다.
    application : 서버 범위 : 브라우저 상관없이 서버가 실행되는 범위까지 데이터를 사용한다.
2. 액션태그 중에 외부 페이지를 포함하는 태그와 request 범위로 이동하는 태그를 기술하세요.
	<jsp:include page="외부 jsp"/> :외부 jsp 페이지를 포함하여 처리되는 화면구성을 한다.
	<jsp:forward page="이동할 jsp"/> :특정한 jsp 페이지로 이동하여 request 범위로 
		데이터를 처리한다.
3. 서버와 클라이트 연결 시, 임시 데이터의 발생의 저장 위치에 따른 객체를 기술하고,
    이 중 client단에 저장하는 객체의 기본 코드를 기술하세요.
    세션(서버단 저장)	
    쿠키(클라이언트단 저장)
    클라이언트 <-------> 서버
    			      request : 요청값을 받을 때, 활용
    			      response : 클라이언트에 화면이나 쿠키값을 보낼 때 사용..
    
4. jsp 페이지의 에러발생 처리 방법을 기술하세요.
	1) 에러 페이지 만들기 z01_error.jsp : isErrorPage="true"
	2) 에러 페이지를 지정 하기.. errorPage = "z01_error.jsp"

5. bean을 활용한 객체의 생성과 활용을 기술하세요.
	<jsp:useBean id="참조변수" class="패키지명.클래스명" 
		scope="page|request|session|application"/>
6. property란 무엇인가? 위 bean 객체를 기준으로 기술하세요.
	Vo class
	class Person{
		public void setXXXX(){}    // 접근제어자가 public인 set/get메서드의   
		public String getXXXX(){}  // XXXX 부분을 소문자로 다 전환된 것을 말한다.
		// useBean이나 el태그로 주로 사용된다.
	}
7. MVC 패턴의 의미와 Servlet을 통한 Controller단 주요 선언 내용을 기술하세요.
	Model View Controller를 의미하는 것으로, 자바의 웹개발이나 화면처리 프로그램의 
	분화된 개발 패턴을 의미한다.
	서블릿의 controller
	1. 요청값 처리 : request.getParameter("요청키")
	2. 모델 데이터 처리 : request.setAttribute("모델키",모델값);
	3. 화면단 호출 : RequestDispatcher rd = rquest.getRequestDispatcher(화면 view단);
		rd.forward(request, response);	 
8. js의 Date 객체의 주요 메서드를 기술하세요
	set/get메서드
	XXXFullYear(), XXXMonth(), XXXDate(), getDay(), XXXHours(),
	XXXMinutes(), XXXSeconds() 

9. js의 배열객체의 메서드를 기술하세요
	.length : 배열의 크기
	.push() : 배열에 마지막에 데이터 추가.
	.pop() : 배열의 데이터 삭제.
	.slice(시작, 마지막) : 배열의 일정 부분 추출(구조변경 안됨)
	.splice(시작, 마지막) : 배열의 일정 부분 추출(구조변경)
	배열.concat( 배열 ) : 배열과 배열의 연결
	배열.sort(function(left, right){ return left-right}) :오른차순 정렬 
	배열.sort(function(left, right){ return right-left}) :내림차순 정렬 
10. js의 Date를 활용하여 오늘의 요일(getDay()-0~6)을 구하고, setDate(getDate()-@@@)을 통해서
이번 주 일요일 날짜를 구하세요. 2X7 테이블을 통해서 요일 행과 날짜 행을 만들고,
이번 주 일요일 날짜와 오늘 날짜를 출력하세요.
# 정리문제
2. A13MVC.java(/gogo.do)를 만들고, view단 호출(\a00_exp\a0809_gugu.jsp)
   초기페이지에 임의의 구구단 [   ] X [   ] 정답 :[   ] [확인]
   정답을 맞추면 정답입니다. 페이지이동(\a00_exp\a0809_result.jsp), 틀리면, 다시 구구단 문제 페이지로 이동 처리하게 하세요.
4. 기념일 확인하기, 오늘로부터 [    ]일 [이전] [이후] 클릭시, 해당 날짜를 계산하여 출력하세요.
   Date객체 활용 d.setDate(d.getDate()+@@@) 
6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
   no  점수

--%>
<%

%>

<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>오늘로부터</th>
			<td><input type="text" name="tDate" value="0" size='2'/></td>
			<td><input type="button" value="이전" id="befBtn"/><input type="button" id="AftBtn" value="이후"/></td>
			</tr>
		<tr><td colspan="3" style="text-align:center" id="show" ></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	<script type="text/javascript">
		var toDay = new Date();
		$("h3").text(toDay.toLocaleDateString())
		
		$("#befBtn").click(function(){
			var dateCnt = $("[name=tDate]").val();
			// 입력한 날짜의 수에 오늘 날짜를 뺀 날짜를 처리..
			// 자동형변환..
			toDay.setDate(toDay.getDate()-dateCnt);
			$("#show").text(toDay.toLocaleDateString());
		});
		$("#AftBtn").click(function(){
			// 숫자형으로 변환
			var dateCnt = Number( $("[name=tDate]").val() );
			//$("h3").text(toDay.toLocaleDateString())
			//alert(toDay.getDate()+":"+dateCnt);
			toDay.setDate(toDay.getDate()+dateCnt);
			$("#show").text(toDay.toLocaleDateString());
		});	
	</script>	
</body>
</html>