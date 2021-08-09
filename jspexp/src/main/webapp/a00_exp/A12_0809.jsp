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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("08.09 정리 문제");
	});

</script>
</head>
<%-- 
# 주간정리
	1. jsp 기본 객체 중 특정한 시간적인 범위를 지정하여 설정할 때, 쓰이는 객체들과 이 범위에 대하여 기술하세요.
	
		내장 객체 중 Date가 있으며 선언 방식은 var d01 = new Date(); 처럼 한다.
		지원하는 메서드로는 아래와 같다.
		
 		.getFullYear() : 연도
 		.getMonth() : 월 (0~11) index 값을 가져온다.
 		.getDate() : 일
 		.getDay() : 요일 (0~7) index 값을 가져온다.
 		.getHour() : 시간
 		.getMinute() : 분
 		.getSecond() : 초
 		.toLocaleString() : GMT 기준 위치 표현 방식에 맞게 처리
 		
 		.setXXXX(변경할 데이터);
	
	2. 액션태그 중에 외부 페이지를 포함하는 태그와 request 범위로 이동하는 태그를 기술하세요.
	
		<jsp:include page="포함될페이지.jsp"></jsp:include>
		
		<jsp:forward page="이동할페이지.jsp"></jsp:forward>
		String name = request.getParameter("name");	
	
	3. 서버와 클라이언트 연결 시, 임시 데이터의 발생의 저장 위치에 따른 객체를 기술하고, 이 중 client단에 저장하는 객체의 기본 코드를 기술하세요.
	
		# 서버와 클라이언트의 대화
			1. 결과로 특정한 데이터를 클라이언트에 저장할 때 : Cookie
			2. 결과로 특정한 데이터를 서버에 저장할 때 : Session
			3. 서버 클라이언트
				클라이언트 =====(request)=====> 서버
					   <=====(response)=====
			4. 쿠키는 response 객체로 전달 받는다. 클라이언트(브라우저)에 저장.
			5. 세션은 request 객체로 서버에 저장
			
		// 쿠키 설정
		Cookie c1 = new Cookie("name", "himan");
		response.addCookie(c1); // 서버에 클라이언트(브라우저)에 쿠키 값을 전달하여 저장. 처리.
		
		// 브라우저에 있는 쿠키를 서버단에 request를 통해 보내서 확인하기
		Cookie[] cks = request.getCookies();
	
	4. jsp 페이지의 에러발생 처리 방법을 기술하세요.
	
		1) 최상단에 isErrorPage = "true" 선언
		2) <tr><th> Error Type </th><td> <%=exception.getClass().getName() %> </td></tr>
		   <tr><th> Error Message </th><td> <%=exception.getMessage() %> </td></tr>
		   에러가 발생할 때 표시할 메세지 선언
	
	5. bean을 활용한 객체의 생성과 활용을 기술하세요.
	
		<jsp:useBean id="빈이름" class="자바빈클래스이름" scope="범위"/>
		
		<%
			p01.setName("사과"); // p01의 set프로퍼티는 name, price, cnt
			p01.setPrice(3000);
			p01.setCnt(2);
		%>
		
		<table align="center" class="listTable">
			<tr><th> 물건명 </th><td><%=p01.getName() %></td></tr>
			<tr><th> 가격 </th><td><%=p01.getPrice() %></td></tr>
			<tr><th> 수량 </th><td><%=p01.getCnt() %></td></tr>
		</table>
	
	6. property란 무엇인가? 위 bean을 객체를 기준으로 기술하세요.
	
		- 자바빈 프로퍼티
			1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현
			2) 메서드 이름을 사용해서 프로퍼티의 이름을 결정
			3) 규칙 : 프로퍼티 이름은 propertyName일 경우
				- setter : public void set 프로퍼티명(타입)
				- getter : public 리턴타입 get 프로퍼티명()
				- boolean 타입일 경우 getter에 get 대신 is 사용 가능
				- 배열 지정 가능 ex) public void setNames(String []names)
				
		<jsp:useBean id="stud" class="jspexp.z02_vo.Student"/>
		<jsp:setProperty property="name" name="stud" value="홍길동"/>
		stud.setName("홍길동");
		<jsp:setProperty property="kor" name="stud" value="70"/>
		<jsp:setProperty property="eng" name="stud" value="80"/>
		<jsp:setProperty property="math" name="stud" value="90"/>
		
		<table align="center" class="listTable">
			<tr><th> 이름 </th><td><jsp:getProperty property="name" name="stud"/></td></tr>
			<tr><th> 국어 </th><td><jsp:getProperty property="kor" name="stud"/></td></tr>
			<tr><th> 영어 </th><td><jsp:getProperty property="eng" name="stud"/></td></tr>
			<tr><th> 수학 </th><td><jsp:getProperty property="math" name="stud"/></td></tr>
		</table><br>
	
	7. MVC 패턴의 의미와 Servlet을 통한 Controller단 주요 선언 내용을 기술하세요.
	
		// # Controller의 주요 기능
		// 1. 요청 값 처리
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num01");
		// 2. 모델 데이터 설정 (Controller <==> Service <==> DAO)
		//		View단에 넘겨 줄 핵심 데이터 설정
		int num01 = 0; if(num01S != null) num01 = Integer.parseInt(num01S);
		int num02 = 0; if(num02S != null) num02 = Integer.parseInt(num02S);
		request.setAttribute("num01", num01);
		request.setAttribute("num02", num02);
		request.setAttribute("sum", num01+num02);
		// 3. VIEW 화면 처리
		String page = "a00_exp\\a0805_view.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);		
	
	8. js의 Date 객체의 주요 메서드를 기술하세요
	
 		.getFullYear() : 연도
 		.getMonth() : 월 (0~11) index 값을 가져온다.
 		.getDate() : 일
 		.getDay() : 요일 (0~7) index 값을 가져온다.
 		.getHour() : 시간
 		.getMinute() : 분
 		.getSecond() : 초
 		.toLocaleString() : GMT 기준 위치 표현 방식에 맞게 처리	
	
	9. js의 배열객체의 메서드를 기술하세요
	
 		length : 배열 요소의 갯수
 		concat() : 배열 요소를 이어줌.
 		join() : 모든 요소 문자열로
 		pop() : 마지막 요소 제거, 리턴
 		push() : 마지막 추가
 		reverse() : 순서 뒤집기
 		slice() : 지정부분 리턴
 		sort() : 정렬
 		splice() : 지정 부분 삭제, 삭제한 요소 리턴			
	
	10. js의 Date를 활용하여 오늘의 요일(getDay() - 0~6)을 구하고, setDate(getDate()-@@@)을 통해서 이번 주 일요일 날짜를 구하세요. 2X7 테이블을 통해서 요일 행과 날짜 행을 만들고, 이번 주 일요일 날짜와 오늘 날짜를 출력하세요.
	
	
	
# 정리문제
	
	
	
	2. A13_MVC.java(/gogo.do)를 만들고, view단 호출(\a00_exp\A12_0809_gugu.jsp)
	   초기페이지에 임의의 구구단 [   ] X [   ] 정답 :[   ] [확인]
	   정답을 맞추면 정답입니다. 페이지(A12_0809_result.jsp)이동, 틀리면, 다시 구구단 문제 페이지로 이동 처리하게 하세요.
	
		
	
	4. 기념일 확인하기, 오늘로부터 [    ]일 [이전] [이후] 클릭시, 해당 날짜를 계산하여 출력하세요.
	   Date객체 활용 d.setDate(d.getDate()+@@@) 
	
		--%>
			<h2 align="center"></h2>		
			<h3 align="center"></h3>
			<form id="frm01" method="post">
			<table align="center" class="listTable">
				<tr><th> 오늘로부터 </th><td><input type="text" name="tDate" value="0" size="2"/></td></tr>
				<tr><td colspan="2" style="text-align:center"><input type="button" value="이전" id="befBtn"/><input type="button" value="이후" id="aftBtn"/></td></tr>
				<tr><td colspan="3" style="text-align:center" id="show"></td></tr>
			</table>
			</form>
			<script type="text/javascript">
				var toDay = new Date();
				$("h3").text(toDay.toLocaleString())
				
				$("#befBtn").click(function() {
					var dateCnt = $("[name=tDate]").val();
					alert(dateCnt);
					// 입력한 날짜의 수에 오늘 날짜를 뺀 날짜를 처리
					toDay.setDate(toDay.getDate()-dateCnt);
					$("#show").text(toDay.toLocaleDateString());
				});
				$("#aftBtn").click(function() {
					// 숫자형으로 변환
					var dateCnt = Number( $("[name=tDate]").val() );
					//$("h3").text(toDay.toLocaleString())
					//alert(toDay.getDate() + " : " + dateCnt);
					// 입력한 날짜의 수에 오늘 날짜를 뺀 날짜를 처리
					toDay.setDate(toDay.getDate()+dateCnt);
					$("#show").text(toDay.toLocaleDateString());
				});
			</script>
		<%--	
	
	6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
	   no  점수



--%>
<%

%>
<body>	
	
</body>
</html>