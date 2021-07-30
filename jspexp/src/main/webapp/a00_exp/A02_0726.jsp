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

	request.setCharacterEncoding("UTF-8");
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
			<script type="text/javascript">
				
				var prodCal = (pname, price, cnt) => price*cnt;
				console.log("총합 : " + prodCal("사과", 3000, 2));
			
			</script>
			<%--		
		
		3. js의 속성할당 방식 2가지를 기술하고, 구매정보를 화면에 출력하는 속성과 메서드를 처리하세요.
		
			--%>
			<%--
			객체.속성 = 데이터;
			객체['속성'] = 데이터;
			 --%>
			 
			<script type="text/javascript">
				
				var prod = {pname: '사과', price:3000, show:function() {
					var h2 = document.querySelector("h2");
					h2.innerHTML = "물건명 : " + this.pname + ", 가격 : " + this.price;
				}};
				prod.buyInfo();
			
			</script>
			<%--		
		
		4. database의 함수 종속성 개념을 기술하세요.
		
			--%>
			<h4> [4] : [DB] 함수 종속성 </h4>
			<table>
				<tr><th> 완전 함수 종속성 </th><td> 특정한 결정자에 종속되는 데이터에 대한 처리를 말한다. key 컬럼에 해당 컬럼에 종속될 때를 말한다. </td></tr>
				<td colspan="2"> ============================================== 테이블 분리 필요 ============================================== </td>
				<tr><th> 부분 함수 종속성 </th><td> 복합 키에 컬럼이 일부 종속 </td></tr>
				<tr><th> 종속되지 않음 </th><td> 키와 상관 없는 컬럼 </td></tr>
			</table>		
			<%--				
		
		5. database의 정규화과정을 기술하세요.
		
			--%>
			<h4> [5] : [DB] 정규화 </h4>
			<table>
				<tr><th> 제 1 정규화 </th><td> 컬럼의 원자성 유지 </td></tr>
				<tr><th> 제 2 정규화 </th><td> 주 식별자의 종속되지 않는 속성의 분리, 부분 종속 속성의 분리 </td></tr>
				<tr><th> 제 3 정규화 </th><td> 이행적 함수 종속의 분리 </td></tr>
				<tr><th> BCNF (보이스/코드) 정규화 </th><td> 하나의 릴레이션에 여러 개의 후보키가 존재하는 경우 </td></tr>
				<tr><th> 제 4 정규화 </th><td> 다치 종속 </td></tr>
				<tr><th> 제 5 정규화 </th><td> 후보키를 통하지 않는 join 종속 </td></tr>
			</table>		
			<%--				
		
		6. jsp로 현재 로그인된 회원의 정보(id, 이름, 포인트, 권한)을 객체화하여 화면에 출력하세요.
		
			--%>
         	<h4> [6] : [JSP] 현재 로그인 된 회원 정보 </h4>
               <%
               Member m = new Member("himan", null, "홍길동", "관리자", 7000);
               %>
            <table>
               <tr><th> ID </th><th> PW </th><th> NAME </th><th> AUTH </th><th> POINT </th></tr>
               <tr>
                  <td><%=m.getId() %></td>
                  <td><%=m.getPass() %></td>
                  <td><%=m.getName() %></td>
                  <td><%=m.getAuth() %></td>
                  <td><%=m.getPoint() %></td>
               </tr>
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
              	for(Memberexp1 m2:dao.getMemList()) {
               	%>
               <tr>
                  <td><%=m2.getMno_exp1() %></td>
                  <td><%=m2.getId() %></td>
                  <td><%=m2.getPass() %></td>
                  <td><%=m2.getName() %></td>
                  <td><%=m2.getPoint() %></td>
                  <td><%=m2.getAuth() %></td>
               </tr> 
               <% } %>
            </table><br>
			<%--
		
	 --%>
	
</body>
</html>