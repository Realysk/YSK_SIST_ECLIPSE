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
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="07.26 정리 문제";
	};
	
	var prodname = ("사과", "바나나", "딸기") => "사과", "바나나", "딸기";
 	var plus = (price01 + price02 + price03) => price01 + price02 + price03;
 	console.log(prodname + plus(2000,4000,10000));

</script>
</head>
<body>

	<%--
		1. js의 배열에 대한 반복문 처리 형식(for in, for of, forEach)을 간단한 예제로 기술하세요.
		
			--%>
			<h4> [1] : [JS] 반복문 형식 </h4>
			<table>
				<tr><th> for in </th><td> for in 반복문은 객체의 속성들을 반복하여 작업을 수행할 수 있다. </td></tr>
				<tr><th> for of </th><td> for of 반복문은 반복 가능한 객체 (Array, Map, Set, String, TypeArray, arguments 객체등) 를 반복하는 문법이다. </td></tr>
				<tr><th> for Each </th><td> for Each문은 배열이나 나열의 크기만큼 루프를 돌면서 각 원소를 순차적으로 접근하는데 매우 유용하다. </td></tr>
			</table>		
			<%--		
		
		2. 화살표 함수를 활용하여, 물건명과 가격의 총합을 처리하는 함수를 만드세요.
		
			--%>
			
			<%--		
		
		3. js의 속성할당 방식 2가지를 기술하고, 구매정보를 화면에 출력하는 속성과 메서드를 처리하세요.
		
			--%>
			
			<%--		
		
		4. database의 함수 종속성 개념을 기술하세요.
		
			--%>
			<h4> [4] : [DB] 함수 종속성 </h4>
			<table>
				<tr><th> 함수 종속성 </th><td> 릴레이션(테이블)을 구성하는 3개의 속성(컬럼) 집합 X, Y, Z에 대해 함수 종속 관계가 X -> Y, Y -> Z가 존재하면 논리적으로 X -> Z가 성립되는데 이 때 Z가 X에 이행적으로 함수 종속되었다고 함. </td></tr>
			</table>		
			<%--				
		
		5. database의 정규화과정을 기술하세요.
		
			--%>
			<h4> [5] : [DB] 정규화 </h4>
			<table>
				<tr><th> 제 1 정규화 </th><td> 복수의 속성값을 갖는 속성을 분리 처리 </td></tr>
				<tr><th> 제 2 정규화 </th><td> 주 식별자에 종속되지 않는 속성의 분리, 부분 종속 속성을 분리한다. </td></tr>
				<tr><th> 제 3 정규화 </th><td> for Each문은 배열이나 나열의 크기만큼 루프를 돌면서 각 원소를 순차적으로 접근하는데 매우 유용하다. </td></tr>
				<tr><th> BCNF (보이스/코드) 정규화 </th><td> 하나의 릴레이션(테이블)에 여러 개의 후보키(사원 테이블에 주민번호, 복합 된 후보키)가 존재하는 경우 제 3 정규형까지 모두 만족해도 이상 현상이 발생할 수 있다. </td></tr>
				<tr><th> 제 4 정규화 </th><td> - </td></tr>
				<tr><th> 제 5 정규화 </th><td> - </td></tr>
			</table>		
			<%--				
		
		6. jsp로 현재 로그인된 회원의 정보(id, 이름, 포인트, 권한)을 객체화하여 화면에 출력하세요.
		
			--%>
         	<h4> [6] : [JSP] 현재 로그인 된 회원 정보 </h4>
               <%
               List<Member> mem = Arrays.asList(
       		   		new Member("himan","1111","홍길동","사용자",1000),
       		   		new Member("badman","2222","김길동","사용자",4000),
       		   		new Member("goodjob","3333","마길동","관리자",2000),
       		   		new Member("badgirl","4444","신길동","관리자",7000),
       		   		new Member("heyman","5555","고길동","사용자",6000)
       		   );
               %>
            <script>
            	function upt(id) {
            		alert("수정할 ID : " + id);
            	}
            </script>
            <table>
               <tr><th> 전체선택 </th><th> ID </th><th> PW </th><th> 이름 </th><th> 권한 </th><th> 포인트 </th><th> 수정 </th></tr>
               <%for(Member m:mem) { %>
               <tr>
                  <td><input type="checkbox" name="ch" value="<%=m.getId()%>"/></td>
                  <td><input type="text" name="id" value="<%=m.getId()%>"/></td>
                  <td><input type="text" name="pw" value="<%=m.getPw()%>"/></td>
                  <td><input type="text" name="name" value="<%=m.getName()%>"/></td>
                  <td><input type="text" name="auth" value="<%=m.getAuth()%>"/></td>
                  <td><input type="text" name="point" value="<%=m.getPoint()%>"/></td>
                  <td><input type="button" name="upt" onclick="upt('<%=m.getId()%>')" value="수정"/></td>
                  <%-- 수정 할 항목 대입 --%>
               </tr>
               <% } %>
            </table><br>		
			<%--		
		
		7. database로 만들어진 회원정보(id, pass,이름, 포인트, 권한)를 dao 기존 기능 메서드에 추가하여, 현재 등록된 jsp 회원정보를 출력하세요.
		
			--%>
         	<h4> [7] : [JSP] DB 연동 후 DAO 호출 </h4>
            <%
               Memberexp1DAO dao = new Memberexp1DAO();
               ArrayList<Memberexp1> memlist = dao.getMemList();
            %>
         
            <table>
               <tr><th> NO. </th><th> ID </th><th> PW </th><th> NAME </th><th> POINT </th><th> AUTH </th></tr>
               <%
              	for(Memberexp1 m:dao.getMemList()) {
               	%>
               <tr>
                  <td><%=m.getMno_exp1() %></td>
                  <td><%=m.getId() %></td>
                  <td><%=m.getPass() %></td>
                  <td><%=m.getName() %></td>
                  <td><%=m.getPoint() %></td>
                  <td><%=m.getAuth() %></td>
               </tr> 
               <% } %>
            </table><br>
			<%--		
		
	 --%>
	
</body>
</html>