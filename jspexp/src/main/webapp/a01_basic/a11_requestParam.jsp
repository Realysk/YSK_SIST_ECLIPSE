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
					- javascript location = "이동할페이지?요청key=요청값&요청키2=요청값2
					- javascript
						함수 호출, form하위 요소입력
							location.href="주소?요청키="+요청값;
							window.open("주소?요청키="+요청값,"","");
					- form 객체 활용
						요청 페이지와 요청 값을 form 객체의 action 속성과 form 하위 객체의 name="속성" value="속성값" 형식으로 submit 버튼으로 처리하는 것을 말한다.
						# location.href="요청페이지?요청키=요청값";
							form 요소 객체의 속성과 하위에 객체들은 submit를 클릭하는 순간 위 내용을 처리해준다.
								ex) location.href="gogo.jsp?name=홍길동&age=25";
									<form action="gogo.jsp">
										<input type="text" name="name" value="홍길동"/>		
										<input type="text" name="age" value="25"/>
										<input type="submit" value="전송"/>
										<!-- submit 버튼을 클릭 시, js의 이벤트 함수 호출 필요 없이 위와 동일한 처리를 한다. -->
									</form>		
				3) 요청 값의 여러가지 데이터 유형 처리하기
					- null
						ex) String name = request.getParameter("name");
							if(name==null) name = "";
					- 숫자형 변환 : 요청 값을 일단 문자열로만 받을 수 있기 때문에 숫자형일 경우 형 변환 필요 Integer.parseInt(), Double.parseDouble()
						ex) String priceS = request.getParameter("price");
							if(priceS==null) price = "0";
							int price = Integer.parseInt(pirceS)s;
					- 객체형 할당 처리 : DAO나 여러가지가 메서드에 데이너를 넘길 때 객체로 할당처리하여 매개변수로 전송할 때 사용된다.
						ex) Product pod = new Product(name, price, cnt);
							dao.insertProduct(pod);
													
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
				<td><a href="a14_receive.jsp?prodname=망고&price=2000"> 물건명, 가격 넘기기 </a></td>
				<td><a href="a14_receive.jsp?prodname=배추&price=6000&pcnt=5"> 물건명, 가격, 수량 넘기기 </a></td>
				<td><a href="a14_receive.jsp?prodname=두리안&price=8000&pcnt=2&buyname=홍길동"> 물건명, 가격, 수량, 구매자명 넘기기 </a></td>
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