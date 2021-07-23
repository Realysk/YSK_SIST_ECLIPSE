<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
	import="java.util.*"
%>
<%
//	import="jspexp.z02_vo.*" : VO 객체 import
//	import="jspexp.z01_database.*" : DAO import 
//	import="java.util.*" : 내장 객체 import

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
		document.querySelector("h3").innerText="07.23 정리문제";
	};

</script>
</head>
<body>
<%--
	1. 아래 내용을 JSP로 출력하세요.
		1) 반복문 1~4 선언 후 테이블 행(4X1)과 열(1X4)로 출력하세요.
		
			--%>
				<h3></h3>
				<table>
				<%for(int cnt=1; cnt<=4; cnt++) { %>
					<tr>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
					</tr>
				<% } %>
				</table><br>
			<%--
		
		2) 배열로 무지개색상 선언 후 h2로 7개의 무지개 배경색상으로 문자열과 함께 출력하세요.
		
			--%>
				<% for(int cnt=1; cnt<=7; cnt++) { %>
				<h2 id="rainbow" style="background-color:red; text-align:center;">무지개</h2>
				<% } %><br>		
			<%--		
		
		3) 아래와 같은 형식을 반복문을 활용하여 form하위 요소객체를 이용하여 테이블과 함께 출력하세요.
			선택		물건명	가격		수량
			[]		[  ]	[  ]	[select(1~10)]
			[]		[  ]	[  ]	[select(1~10)]
			[]		[  ]	[  ]	[select(1~10)]
			
			--%>
				<table>
					<tr><th>3번 문제</th></tr>
					<tr><td>${'내용'}</td></tr>
				</table><br>			
			<%--			
			
	    4) ArrayList<String>으로 메뉴리스트를 선언하고, ul하위에 li안에 a link로 메뉴로 출력하세요.
	    
			--%>
				<table>
					<tr><th>4번 문제</th></tr>
					<tr><td>${'내용'}</td></tr>
				</table><br>			
			<%--	    
	    
	    5) 회원 VO를 Member(아이디,패스워드,이름,권한,포인트)로 만들고, 회원리스트 ArrayList<Member>로 회원 5명 등록하고, 테이블 리스트로 출력처리하세요.
	    
			--%>
				 <%
				 	ArrayList<Member> mem = new ArrayList<Member>();
					mem.add(new Member("himan","1111","홍길동","사용자",1000));
					mem.add(new Member("badman","2222","김길동","사용자",4000));
					mem.add(new Member("goodjob","3333","마길동","관리자",2000));
				 %>
				 
				<table>
					<tr><th> ID </th><th> PW </th><th> 이름 </th><th> 권한 </th><th> 포인트 </th></tr>
					<%for(int idx=0; idx<mem.size(); idx++) { %>
					<tr>
						<td><%=mem.get(idx).getId() %></td>
						<td><%=mem.get(idx).getPw() %></td>
						<td><%=mem.get(idx).getName() %></td>
						<td><%=mem.get(idx).getAuth() %></td>
						<td><%=mem.get(idx).getPoint() %></td>
					</tr>
					<% } %>
				</table><br>			
			<%--	    
	    
	    6) 반복문과 조건문을 활용하여 번호가 있는 4X4테이블을 출력하세요.
	    
			--%>
				<table>
				<%for(int cnt=1; cnt<=4; cnt++) { %>
					<tr>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
						<td><%=cnt %></td>
					</tr>
				<% } %>
				</table><br>
			<%--	    
	    
	2. 학번 이름 국어 영어 수학 형식으로 출력할 내용을 테이블로 설계를 하고 데이터를 입력후 기존 dao(전날)에 출력 list하는 메서드를 만든 후, jsp 화면으로 출력처리하세요.

			--%>
				<%
					StudentDAO dao = new StudentDAO();
					ArrayList<Studentexp1> stulist = dao.getStuList();
				%>
			
				<table>
					<tr><th> 학번 </th><th> 이름 </th><th> 국어 </th><th> 영어 </th><th> 수학 </th></tr>
					<%for(Studentexp1 s:stulist) { %>
					<tr>
						<td><%=s.getSno() %></td>
						<td><%=s.getName() %></td>
						<td><%=s.getKor() %></td>
						<td><%=s.getEng() %></td>
						<td><%=s.getMath() %></td>
					</tr>		
					<% } %>
				</table>	
			<%--
 --%>
</body>
</html>