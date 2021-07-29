<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
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
	.input{width:80%;}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="07.29 정리문제";
	}
</script>
</head>

	<h3 align="center"></h3>
<%-- 
	1. 요청 값의 post방식과 get방식의 차이점을 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> FORM 태그의 GET과 POST의 차이점 </th></tr>
			<tr><th> GET </th><td> GET 은 클라이언트에서 서버로 어떠한 리소스로 부터 정보를 요청하기 위해 사용되는 메서드이다. </td></tr>
			<tr><th> POST </th><td> POST는 클라이언트에서 서버로 리소스를 생성하거나 업데이트하기 위해 데이터를 보낼 때 사용 되는 메서드다. </td></tr>
			<tr><th> 차이점 </th><td> GET은 서버의 리소스에서 데이터를 요청할 때, POST는 서버의 리소스를 새로 생성하거나 업데이트할 때 사용한다.
									DB로 따지면 GET은 SELECT 에 가깝고, POST는 Create 에 가깝다고 보면 된다. </td></tr>
		</table><br><hr>
		</form>		
	<%--
	
	2. 아래와 같은 도서구매 시스템을 post방식으로 처리하세요.(한페이지처리)
	    도서명 [     ] 가격 [    ] 수량 [    ] [구매] 
	    ==> 구매한 도서 @@@ 총비용 @@ 할인 15% 후, 금액 @@@@
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 도서 구매 시스템 (POST) </th></tr>
			<tr><th> 도서명 </th><td><input type="text" name="bname"/></td></tr>
			<tr><th> 가격 </th><td><input type="number" class="input" name="price"/></td></tr>
			<tr><th> 수량 </th><td><input type="number" class="input" name="cnt"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
		</table><br><hr>
		</form>	
		<%
			String bname = request.getParameter("bname");
			if(bname != null) {
			int price = Integer.parseInt(request.getParameter("price"));
			int cnt = Integer.parseInt(request.getParameter("price"));
		%>
		<table>
			<tr><th colspan="2"> 도서 구매 내역 </th></tr>
			<tr><th> 도서명 </th><td><%=bname %></td></tr>
			<tr><th> 가격 </th><td><%=price %></td></tr>
			<tr><th> 수량 </th><td><%=cnt %></td></tr>
			<tr><th> 총계 </th><td><%=price*cnt %></td></tr>
		</table><br><hr>
		<% } %>
	<%--	
	
	3. 사원 정보 등록 처리 프로세스을 파일명과 요청값처리, JS, DAO 핵심 코드위주로 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 사원정보 등록 (JS, DAO) </th></tr>
			<tr><th> 사원명 </th><td><input type="text" name="ename" value=""/></td></tr>
			<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
		</table><br><hr>
		</form>
	<%--
	
	4. 회원정보 관리시스템을 기존 member테이블을 활용하여 진행하되, 전체리스트에서 등록처리화면로 처리하세요. (회원리스트화면, 등록처리화면, dao 등록)
	
	--%>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String auth = request.getParameter("auth");
			int point = Integer.parseInt(request.getParameter("auth"));
		
			MemberDAO dao = new MemberDAO();
			//ArrayList<Member> memlist = dao.getMemList(new Member(id, pw, name, auth, point));
		%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 회원정보 관리 시스템 </th></tr>
			<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
			<tr><th> PW </th><td><input type="text" name="pw" value=""/></td></tr>
			<tr><th> NAME </th><td><input type="text" name="name" value=""/></td></tr>
			<tr><th> AUTH </th><td><input type="text" name="auth" value=""/></td></tr>
			<tr><th> POINT </th><td><input type="number" class="input" name="point" value=""/></td></tr>
			<tr><td colspan="2"><input type="submit" value="조회"/></td></tr>
		</table><br><hr>
		</form>		
	<%--	
	
	5. 아래와 같은 임의의 구구단 문제를 10문제 리스트하고, 현재페이지에 post방식을 전달하여 최종 점수를 출력하세요.
	    번호  문제     정답
	    1    2 * 5  [   ]
	    2    4 * 3  [   ]
	    3    6 * 5  [   ]
	   ...
	        [시험완료] ==>  @@ 점.
	        
	--%>
		
	<%--	        
	        
--%>
<%

%>
<body>
	<%-- 
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table><br><hr>
	</form>
	--%>
</body>
</html>