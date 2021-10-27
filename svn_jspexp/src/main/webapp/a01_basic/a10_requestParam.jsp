<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
# jsp에서 요청값 처리..
1. jsp에서는 요청값 형식으로 현재 페이지에 요청데이터를
넘겨주거나 다음 페이지에 요청값을 전달해 줄 수 있다.
2. 기본 형식
 	1) get방식에 의한 요청값 전달
 		요청페이지명?요청key=요청값&요청key2=요청값2
 	2) 요청페이지에서는 request.getParameter("요청key")
 		형식으로 요청값을 받을 수 있다.
 		- jsp의 서버단 java 프로그램에서 처리가 가능하다.
 		
3. 단계별 연습예제
	0) 핵심 key word의 이해
		request.getParameter("요청키")
		url주소에 페이지명?key=value&....&...
	1) 현재 페이지에 요청값 처리하기
	2) 다른 페이지에 요청값 처리하기
		형식
		- a href="이동할페이지?요청key=요청값&요청키2=요청값2"
		- javascript 
			 함수호출, form하위 요소입력
			 location.href="주소?요청키="+요청값;
			 window.open("주소?요청키="+요청값,"","");
		- form 객체 활용.
			요청페이지와 요청값을 form객체의 action속성과
			form하위 객체의 name="속성" value="속성값"형식으로
			submit 버튼으로 처리하는 것을 말한다.
			# location.href="요청페이지?요청키=요청값";
			form요소객체의 속성과 하위에 객체들은 submit을 클릭하는 순간
			위 내용을 처리해준다.
			ex) location.href="gogo.jsp?name=홍길동&age=25";
			<form action="gogo.jsp">
				<input type="text" name="name" value="홍길동"/>
				<input type="text" name="age" value="25"/>
				<input type="submit" value="전송"/>
				<!-- submit 버튼을 클릭시, js의 이벤트 함수호출 필요없이
				위와 동일한 처리를 한다. -->
			</form>
			
				
	3) 요청값의 여러가지 데이터 유형 처리하기..	
		- null
			ex) String name = request.getParameter("name");
				if(name==null) name = "":
		- 숫자형변환
			요청값을 일단 문자열로만 받을 수 있기 때문에
			숫자형일 경우 형변환 필요 Integer.parseInt(), Double.parseDouble()
			ex) String priceS = request.getParameter("price");
				if(priceS==null) name = "0":
				int price = Integer.parseInt(priceS);
		- 객체형 할당 처리..
			Dao나 여러가지가 메서드에 데이터를 넘길 때,
			객체로 할당처리하여 매개변수로 전송할 때, 사용된다.
			ex) Product pod = new Product(name, price, cnt);
				dao.insertProduct(pod);
	4) 한페이지에서 요청값 처리
		1) form, location을 통해서 현재 페이지 다시 요청하면서, 요청값 처리하는 경우가
			있다. 주로 검색처리
		2) 물리적으로는 jsp가 한페이지이지만, 논리적으로는 2페이지로 요청값을 전달하고
			요청값을 받아서 처리하는 것이다.
		3) 핵심 처리..
			request.getParameter()를 통해서 한 소스에서 처리되기에
			초기 화면에 대한 처리를 하고, 요청값을 넘겼을 때를 구분하여서 처리한다.
			- null에 대한 처리 : 초기에는 null을 가지고 있기때문에 처리되어야 한다.
			
		
	5) form method="post" 방식 처리..	
		 기본의 url을 통해 전송하는 방식은 get방식인데,
		 전송하는 용량 제한과 url에 보이는 단점이 있다.	
		 전송방식을 post로 하면, url에 요청값(key=value)가
		 사라지고 요청페이지만 남게된다.
		 요청값은 내부적으로 요청 body에서 전달되어, 
		 요청값을 보이지 않게 처리하거나, 많은 요청을 처리할 때,
		 활용된다..
		
--%>
<%--
1. 현재 페이지에 요청값 처리하기
	a10_requestParam.jsp?id=himan&pass=7777
	로 주소값을 넘기면
	아래 코드는 id로 himan을 출력한다.
	pass로 7777 값을 할당하여 출력 할수 있다.
 --%>
	<%
	String id = request.getParameter("id");
	%>
	<h2>입력한 id: <%=id%></h2>
	<%--
	ex)   a11_requestParam.jsp에 요청key name, age, loc를 넘기고,
	값을 받아, 화면에 이름 @@@, 나이 @@@, 사는 곳 @@@를 출력하세요.
	1조..
	
	
	 --%>	
	<a href="a12_receive.jsp?id=himan">아이디만 넘기기</a><br>	
	<a href="a12_receive.jsp?id=himan&pass=8888">아이디/패스워드 넘기기</a><br>	
	<a href="a12_receive.jsp?name=홍길동&age=25">이름과 나이 넘기기</a><br>
	<%--
	ex) a13_receive.jsp   2조..
	첫번째 링크 : 물건명
	두번째 링크 : 물건명과 가격
	세번째 링크 : 물건명과 가격, 갯수
	네번째 링크 : 물건명과 가격, 갯수, 구매자명
	
	 --%>	
   <a href="a13_receive.jsp?pname=망고">물건명 넘기기</a><br>
   <a href="a13_receive.jsp?pname=사과&price=2000">물건명+가격</a><br>
   <a href="a13_receive.jsp?pname=바나나&price=3000&cnt=5">물건명+가격+갯수</a><br>
   <a href="a13_receive.jsp?pname=딸기&price=12000&cnt=4&name=오길동">물건명+가격+갯수+구매자명</a><br>	
   <%--
   # js로 데이터 처리
   1. 함수로 요청페이지에 데이터 넘겨주기..
   2. 입력된 내용을 요청페이지에 넘겨 주기..
    --%>
   <h2 onclick="send('사과')">물건명 전달</h2> 
   물건명:<input type="text" name="pname"/><br>
   가격:<input type="text" name="price"/><br>
   갯수:<input type="text" name="cnt"/><br>
   <input type="button" value="구매정보전달" onclick="buy()"/>
   <script>
   	function send(prod){
   		// location.href="이동할페이지?요청key=요청값";
   		location.href="a14_js_receive.jsp?pname="+prod;
   	}
   	function buy(){
   		var pname = document.querySelector("[name=pname]").value;
   		var price = document.querySelector("[name=price]").value;
   		var cnt = document.querySelector("[name=cnt]").value;
   		location.href="a14_js_receive.jsp?pname="
   				+pname+"&price="+price+"&cnt="+cnt;
   	}
   
   </script>   
   <h1>회원 정보 전달</h1>
   <%--
   ex) 회원 아이디 :[    ] 패스워드 :[   ] 회원명 :[     ]
   	   권한 :[      ]
   	   [정보전달]  ==> 클릭시, a14_js_receive.jsp에 데이터를 전달 처리하세요..
   	   3조.
    --%>
    <h2>회원정보전달!</h2>
    회원아이디 : <input type="text" name="id"/><br>
    비밀번호 : <input type="password" name="pass"/><br>
    회원명 : <input type="text" name="name"/><br>
    권한 : <input type="text" name="auth"/><br>
    <input type="button" value="회원등록" onclick="register()"/>
    <script>
       function register() {
          var id= document.querySelector("[name=id]").value;
          var pass= document.querySelector("[name=pass]").value;
          var name= document.querySelector("[name=name]").value;
          var auth= document.querySelector("[name=auth]").value;
          location.href="a14_js_receive.jsp?id="+id
        		  +"&pass="+pass+"&name="+name+"&auth="+auth;
       }
    </script>
   
   
   
	

</body>
</html>

