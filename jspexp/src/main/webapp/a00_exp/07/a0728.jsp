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
<title>Insert title here</title>
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="온라인 예약 시스템";
	}
</script>
</head>
<%--
# 정리문제
1. 요청값 처리에 대한 location.href 방식 form 하위 요소객체를 이용하여 처리하는
   방식의 차이점을 코드로 기술하세요.
   location.href="이동할페이지?요청키=요청값";
   ex) location.href="go.jsp?name=홍길동";
   1. client(js)로 이동처리 요청.
   <form action="이동할페이지">
   	   <input name="요청키" value="요청값"/>
   	   <input type="submit" /> 
   	   submit 버튼 클릭시, url로 이동할페이지?요청키=요청값
   ex) 
   <form action="go.jsp">
   	   <input name="name" value="홍길동"/>
   	   <input type="submit" />    	   
2. 요청값이 없는 경우에 처리할 내용에 대한 기본 코드를 기술하세요.
	1) 한 페이지로 요청값처리와 초기 form화면을 같이 처리할 때,
		사용된다.
	2) 초기요청 자체가 없는 경우
		url : 페이지명.jsp
		String name = request.getParameter("name");
		if(name==null)
	3) form하위에 입력을 하지 않고 submit버튼을 클릭한 경우
		url : 페이지명.jsp?name=
		String name = request.getParameter("name");
		if(name.equals(""))			
		cf) 일반적으로 서버에 전송이 안되게 js에서 입력없을 시,
		유효성 처리한다.
		if(nameVal==""){
			alert("입력을  하여야 전송됩니다");
			return;
		}
3. form 형식으로 숫자형 데이터를 전송하여 처리하는 방식에 있어서, 반드시 처리해야 될
   내용을 예제와 함께 기술하세요.
   String num01S = request.getParameter("num01");
   // .trim() : 양쪽 공백제거, 입력폼에 공백을 넣고 전송된 경우도 방지
   if(num01S==null || num01S.trim().equals("")){
   		num01S="0";
   }
   int num01 = Integer.parseInt(num01S);
   
4. 온라인 영화관 예약시스템에서 입장할 영화제목, 입장인원, 입장료, 상영시간으로 
   입력하여 처리결과를 확인하고자 한다. 2개 페이지로 처리하는 형식과 
   1개 페이지로 처리하는 형식을 구현해보세요.
   처리결과 : 영화제목, 상영시간, 입장인원, 총비용 출력
5. 아래와 같은 형식으로 계산기를 처리하세요.(1개페이지)
   [    ] [연산자select] [    ] [합산]
 --%>
<body>
	<h3 align="center"></h3>
	<%--
영화제목, 입장인원, 입장료, 상영시간	
 	--%>
	<form id="frm01" action="a0728_1.jsp">
	<table>
		<tr><th>영화제목</th>
			<td><input class="input" type="text" name="title" value=""/></td></tr>
		<tr><th>입장인원</th><td>
				<select class="input" name="cnt">
					<option value="">선택</option>
					<%for(int cnt=1;cnt<=20;cnt++){%>
					<option><%=cnt%></option>	
					<%}%>
				</select>	
		<tr><th>입장료</th>
			<td><input class="input" type="text" name="pay" 
					value="10000"/></td></tr>
					
		<tr><th>상영시간</th>
			<td>
				<select class="input" name="time">
					<option value="">선택</option>
					<%for(int hour=9;hour<=23;hour++){%>
					<option><%=hour%>:00</option>	
					<%}%>
				</select>
			</td></tr>
		<tr><td colspan="2"><input type="button" onclick="send()" value="등록"/></td></tr>
	</table>	
	</form>
	<script>
		function send(){
			var inputArr = document.querySelectorAll(".input");
			// 공백처리, 정규식표현처리, 문자의 범위
			// 요소객체.value=="",   isNaN(), .length 등을 활용하여, 유효성 check
			// 를 하고, 서버에 전송하는 것이 일반적이다.
			if(inputArr[0].value==""){
				alert("제목을 입력하세요!!");
				return; // submit()프로세스를 중지
			}
			if(inputArr[1].value==""){
				alert("입장인원 선택하세요!!");
				return; // submit()프로세스를 중지
			}
			if(inputArr[2].value==""){
				alert("상영시간을 선택하세요!!");
				return; // submit()프로세스를 중지
			}
			// form객체의 .submit()함수를 통해서 submit버튼을 클릭한 것과
			// 동일한 기능 처리..
			// 위에 유효성을 js로 check하고 전송해야할 경우 주로 사용된다.
			document.querySelector("#frm01").submit();
		}
	</script>
</body>
</html>