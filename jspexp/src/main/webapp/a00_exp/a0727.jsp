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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%--
# 정리문제
1. 요청값을 전달하는 url형식과 요청값을 받는 jsp 기능 메서드를 기술하세요.
	query string : 페이지명?요청key=요청value&요청key2=요청value2...
	요청되는 페이지 : String 요청값할당변수 = request.getParameter("요청key")
2. 아래의 요청값 전달 처리의 방식 기본예제를 코드하세요
    0) 현재페이지 요청값 처리
       	String name = request.getParameter("name");
    	<h2>입력한 이름:<%=name%></h2>
    	실행한 창 url에 요청값 입력
    	url주소 : http://localhost:7080/jspexp/exp.jsp?name=홍길동
    1) a href 요청값 처리하기
    	<a href="요청할페이지1?fname=사과">사과호출</a>
    	<a href="요청할페이지2?fname=바나나&price=4000">물건정보(물건명,가격)</a>
    	<a href="요청할페이지3?fname=오렌지&price=3000&cnt=5">
    		물건정보(물건명,가격,갯수)</a>
    2) 함수호출하여 location.href 객체활용하기
    	function call(fname){
    		location.href="페이지1?food="+fname;
    	}
    	<h2 onclick="call('마라탕')">좋아하는 맛집이동</h2>
    	function call2(){
    		var fname = document.querySelector("[name=fname]").value;
    		location.href="페이지1?food="+fname;
    	}
    	좋아하는 음식 : <input type="text" name="fname"/>
    	<h2 onclick="call2()">음식 맛집 찾기</h2>
     	function openWin(){
    		var ename = document.querySelector("[name=ename]").value;
    		window.open("검색팝업화면?ename="+ename, "","width=300,height=300");
    	}
    	사원정보검색 : <input type="text" name="ename"/>
    	부서정보 : <input name="dpart"/>
    	<input type="button" value="사원정보상세검색" onclick="openWin()"/>   	
    	검색팝업화면
    		String ename = request.getParameter("ename");
    		// dao호출.
    		// 화면 출력하고..
    		function 이벤트처리함수(){
    			var 다시넘길데이터 
    			opener.document.querySelector("[name=dpart]").value=넘길데이터;
    		}
    	
    
    
3. 아래와 같은 처리를 함수와 location.href를 통해서 요청처리하세요.
   id:[    ]
   pass:[    ]
   [로그인] ==> 로그인  
   1단계) 로그인한 id:@@@ 패스워드 @@@  
   2단계) 인증여부 성공/실패 (himan/7777)
   3단계) 다음 페이지에서 select * from member where id = ? and pass=?
   	를 통한 dao를 만든 후, dao 연동하여 인증여부처리
   		- dao 처리
   		- 요청된 화면에서 dao객체 생성 처리결과 내용..
   4단계) 다음 페이지 js에서 alert으로 성공여부에 따라 main페이지 이동/login 페이지이동
	hint) 다음페이지에서 location.href 활용
 --%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" 
			name="pass" value=""/></td></tr>
		<tr><td colspan="2">
			<input type="button" value="로그인" onclick="login()"/></td></tr>
	</table>	
	</form>
	<script>
		function login(){
			var idVal = document.querySelector("[name=id]").value;
			var passVal = document.querySelector("[name=pass]").value;
			location.href="a0727_2.jsp?id="+idVal+"&pass="+passVal;
			
		}
	
	</script>
</body>
</html>