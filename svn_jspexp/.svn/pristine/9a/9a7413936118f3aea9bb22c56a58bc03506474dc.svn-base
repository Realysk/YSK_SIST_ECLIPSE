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
		//$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 스크립트
1. 요청을 처리하는 데 필요한 코드(java)를 실행
2. 동적으로 응답 결과를 생성하기 위해 사용
3. 스크립트의 요소 세가지
	1) declaration : <%! %>  ex) java class 바로 밑 선언 부분..
		변수나 상수, 메서드를 선언만 하는 역할, 하단에 scriptlet이나 expression에 의해
		호출된다.
	2) scriplet	: <% %>		ex) java의 main()있는 부분..
	3) expression : <%= %>	 ex) java의 main()안에 System.out.println();
		declaration이나 scriptlet에 의해 선언된 내용을 화면에 출력처리할 때, 사용된다.
		cf) out.print("")와 유하게 처리할 때, 사용된다.

--%>
<%! // declare
	String pname;
	int getTot(int price, int cnt){
		return price*cnt;
	}
	String id;
	String pass;
	String login(String id, String pass){
		return id.equals("himan")&&pass.equals("7777")?"로그인 성공":"로그인 실패";
	}
%>
<%  // scriptlet
	pname = "바나나"; // 상단에 선언된 변수를 변경
	int sum = getTot(3000, 2); //선언된 메서드 활용
	id="himan";
	pass="7777";
	String result = login(id, pass);
%>
<body>
	<%-- expression --%>
	<h2 align="center">물건명:<%=pname %>, 총계:<%=sum %></h2>
	<h2 align="center">아이디:<%=id%>, 패스워드:<%=pass %>, 결과:<%=login(id, pass) %></h2>
<%--
ex) id, pass, login(아이디,패스워드)인증여부리턴, - declare 선언
	위 변수 선언 및 할당 - scirplet
	위 결과 내용 출력 - expression   3조.. 손들어 주세요..

 --%>	
</body>
</html>