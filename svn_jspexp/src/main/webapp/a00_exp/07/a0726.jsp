<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z02_vo.*"
    import="java.util.*"
    import="jspexp.z02_vo.*"
    import="jspexp.z01_database.A05_PreparedDao"
    %>
<%
//jspexp.z01_database.A05_PreparedDao
//jspexp.z02_vo.Emp
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">    
<%--
# 주간 정리문제
1. js의 배열에 대한 반복문 처리 형식(for in, for of, forEach)을 
  간단한 예제로 기술하세요.
for(var idx in arr){
   console.log(idx, arr[idx]);
}  
for (var idx of arr){
   console.log(idx,arr[idx]);
} 
arr.forEach(function(obj,idx,arr01){
});
 
2. 화살표 함수를 활용하여, 물건명과 가격의 총합을 처리하는 함수를 만드세요.
	var prodCal =(pname, price, cnt) => price*cnt;
	console.log("총합:"+prodCal("사과",3000,2));
	
3. js의 속성할당 방식 2가지를 기술하고, 구매정보를 화면에 출력하는 
   속성과 메서드를 처리하세요.
   객체.속성=데이터;
   객체['속성']=데이터;
   var prod = {pname:'사과',price:3000,buyInfo:function(){
   		var h2 = document.querySelector("h2");
   		h2.innerHTML = "물건명:"+this.pname+", 가격:"+this.price;
   }};
   prod.buyInfo();
   
4. database의 함수 종속성 개념을 기술하세요.
	완전함수종속성 : 특정한 결정자에 종속되는 데이터에 대한 처리를  말한다.
		key 컬럼에 해당 컬럼에 종속될 때를 말한다.
	======(테이블 분리 필요)=================================
	부분함수종속성 : 복합 키에 컬럼이 일부 종속
	종속되지 않음 : 키와 상관없는 컬럼.
5. database의 정규화과정을 기술하세요.
	제1정규화 : 컬럼의 원자성 유지
	제2정규화 : 주식별자의 종속되지 않는 속성의 분리, 부분 종속 속성의 분리
	제3정규화 : 이행적 함수종속의 분리
	BCNF정규화 : 하나의 릴레이션에 여러 개의 후보키가 존재하는 경우
	제4정규화 : 다치 종속
	제5정규화 : 호보키를 통하지 않는 조인 종속..
	

6. jsp로 현재 로그인된 회원의 정보(id, 이름, 포인트, 권한)을 객체화하여 화면에 출력하세요.



7. database로 만들어진 회원정보(id, pass,이름, 포인트, 권한)를 
   dao 기존 기능 메서드에 추가하여, 현재 등록된 jsp 회원 리스트 정보를 출력하세요.
 --%>
</head>
<body>
<%
	Member m = new Member("himan",null,"홍길동","관리자",7000);

%>
	<h3>아이디:<%=m.getId() %></h3>
	<h3>이름:<%=m.getName() %></h3>
	<h3>권한:<%=m.getAuth() %></h3>
	<h3>포인트:<%=m.getPoint() %></h3>
	<%
	A05_PreparedDao dao = new A05_PreparedDao();	
	%>
	<h2>회원정보</h2>
	<table>
		<tr>
			<th>아이디</th><th>패스워드</th><th>이름</th>
			<th>권한</th><th>포인트</th>	</tr>
		<%for(Member mem:dao.getMemberList()){ %>
		<tr><td><%=mem.getId()%></td>
			<td><%=mem.getPass()%></td>
			<td><%=mem.getName()%></td>
			<td><%=mem.getAuth()%></td>
			<td><%=mem.getPoint()%></td></tr>
		<%} %>
	</table>	
	
</body>
</html>