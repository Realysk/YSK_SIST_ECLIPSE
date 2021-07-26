<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="Request : 요청 값 넘기기";
	};

</script>
</head>
<body>

	<h3></h3>

	<%--
		# JSP에서 요청 값 처리
			1. JSP에서는 요청 값 형식으로 현재 페이지에 요청 데이터를 넘겨주거나 다음 페이지에 요청값을 전달해 줄 수 있다.
			2. 기본 형식
				1) get방식에 의한 요청 값 전달 : 요청페이지명?요청key=요청값&요청key2=요청값2
				2) 요청 페이지에서는 request.getParameter("요청key") 형식으로 요청 값을 받을 수 있다.
					- JSP의 서버단 JAVA 프로그램에서 처리가 가능하다.
			3. 단계별 연습 예제
				0) 핵심 keyword의 이해
					request.getParameter("요청키")
					URL 주소에 페이지명?key=value&...&...
				1) 현재 페이지에 요청 값 처리하기
				2) 다른 페이지에 요청 값 처리하기
					형식
					- a href="이동할페이지?요청key=요청값&요청key2=요청값2"
					- javascript location
					- form 객체 활용
				3) 요청 값의 여러가지 데이터 유형 처리하기
					- null
					- 숫자형 변환
					- 객체형 할당 처리
	 --%>
	 <%--
	 1. 현재 페이지에 요청 값 처리하기
	 	a11_requestParam.jsp?id=himan&pass=7777
	 	로 주소 값을 넘기면 아래 코드는 id로 himan과 pass로 7777을 할당하여 출력한다.
	  --%>
	  <%
	  	String id = request.getParameter("id");
	  %>
	  	<h4> EX1) 요청 값 넘기기 </h4>
		<table>
			<tr><th> a13_receive.jsp로 요청 값 넘기기 </th></tr>
			<tr><th> 입력한 ID : <%=id %> </th></tr>
			<tr><td><a href="a13_receive.jsp?id=himan"> ID만 넘기기 </a></td></tr>
			<tr><td><a href="a13_receive.jsp?id=himan&pass=8888"> ID / 패스워드 넘기기 </a></td></tr>
			<tr><td><a href="a13_receive.jsp?name=홍길동&age=25"> 이름과 나이 넘기기 </a></td></tr>	
		</table><br>
	  
	  <%--
	  	ex) a14_recieve.jsp
	  		첫번째 링크 : 물건명
	  		두번째 링크 : 물건명, 가격
	  		세번째 링크 : 물건명, 가격, 수량
	  		네번째 링크 : 물건명, 가격, 수량, 구매자명
	   --%>
	   <%
	   	 String prodname = request.getParameter("prodname");
	   	 String price = request.getParameter("price");
	   	 String pcnt = request.getParameter("pcnt");
	   	 String buyname = request.getParameter("buyname");
	   %>
	   	<h4> EX2) 요청 값 넘기기 (오류) </h4>
		<table>
			<tr><th colspan="4"> a14_receive.jsp로 요청 값 넘기기 </th></tr>
			<tr><th> 입력한 물건명 : <%=prodname %> </th><th> 입력한 가격 : <%=price %> </th><th> 입력한 수량 : <%=pcnt %> </th><th> 입력한 구매자명 : <%=buyname %> </th></tr>
			<tr>
				<td><a href="a14_receive.jsp?prodname=사과"> 물건명 넘기기 </a></td>
				<td><a href="a14_receive.jsp?prodname=사과&price=2000"> 물건명, 가격 넘기기 </a></td>
				<td><a href="a14_receive.jsp?prodname=사과&price=2000&pcnt=4"> 물건명, 가격, 수량 넘기기 </a></td>
				<td><a href="a14_recieve.jsp?prodname=사과&price=2000&pcnt=4&buyname=홍길동"> 물건명, 가격, 수량, 구매자명 넘기기 </a></td>
			</tr>	
		</table><br>
		
		<%--
		# JS로 데이터 처리
			1. 함수로 요청 페이지에 데이터 넘겨주기
			2. 입력 된 내용을 요청 페이지에 넘겨주기
		 --%>
		 
		 <h2 onclick="send('사과')"> 물건명 전달 </h2>
		 물건명 : <input type="text" name="pname"/><br>
		 가격 : <input type="text" name="price"/><br>
		 수량 : <input type="text" name="cnt"/><br>
		 <input type="button" value="구매정보전달" onclick="buy()"/><br>
		 <script type="text/javascript">
		 	
		 	function send(prod) {
		 		// location.href="이동할페이지?요청key=요청값";
		 		location.href="a15_js_receive.jsp?pname=" + prod;
		 	}
		 	
		 	function buy() {
		 		var pname = document.querySelector("[name=pname]").value;
		 		var price = document.querySelector("[name=price]").value;
		 		var cnt = document.querySelector("[name=cnt]").value;
		 		location.href="a15_js_receive.jsp?pname="+pname+"&price="+price+"&cnt="+cnt;
		 	}
		 	
		 </script>
		 
		 <%--
		 	ex) ID : [   ]
		 		PW : [   ]
		 		NAME : [   ]
		 		AUTH : [   ]
		 		[정보전달] 클릭 시, a15_js_receive.jsp에 데이터를 전달 처리하세요.
		  --%>
		  
		  ID : <input type="text" name="id"/><br>
		  PW : <input type="password" name="pw"/><br>
		  NAME : <input type="text" name="name"/><br>
		  AUTH : <input type="text" name="auth"/><br>
		  <input type="button" value="정보전달" onclick="mem()"/><br>
		  
		  <script type="text/javascript">
		  	
		  	function mem() {
		  		var id = document.querySelector("[name=id]").value;	
		  		var pw = document.querySelector("[name=pw]").value;	
		  		var name = document.querySelector("[name=name]").value;	
		  		var auth = document.querySelector("[name=auth]").value;	
		  		location.href="a15_js_receive.jsp?id="+id+"&pw="+pw+"&name="+name+"&auth="+auth;
		  	}
		  	
		  </script>
	
</body>
</html>