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

</head>
<%-- 
# 정리문제
1. session 4가지범위로 변수를 선언하여 출력하세요.

2. el에 의해 과일명 배열을 출력하세요.
3. el을 활용하여 쇼핑몰에 구매한 내용을 요청값에 의해 객체로 할당하고, 선택한 할인율(10%,15%,20%)따라
    구매정보를 출력하세요.
    1) form화면 구성
    2) el로 요청 내용 처리..(요청값을 객체의 메서드에 할당 처리)
    	- Product객체는 pageContext.setAttribute("prod", new Product());
    	- ${prod.setName(param.name)}${prod.setPrice(param.price)}${prod.setCnt(param.cnt)}
    	- ${prod.name}${prod.price}${prod.cnt} 	
    3) 할인율 내용에 따라 데이터
    	- ${prod.price*prod.cnt*param.discount}
4. 아이디 패스워드를 입력하여, el로 요청값으로 인증여부(himan/7777)를 출력하세요.
	1) 로그인 화면 구성.
	2) ${param.id} ${param.pass}
	3) 인증여부 
		${param.id == 'himan' && param.pass == '7777'}  true/false
		${param.id == 'himan' and param.pass == '7777'}
		${(param.id == 'himan' and param.pass == '7777')?'인증':'미인증'}
		${ not empty param.id } : 해당 데이터가 ""아니고 null도 아닐때..

5. 아래와 같은 등록정보를 처리한 화면을 el로 다음 페이지에서 출력하세요
    아이디:[   ] 패스워드:[   ] 성별:()남()여 취미:[]음악[]운동[]여행[]독서[]게임[]
    [등록]
    ${param.id}
    ${param.pass}
    ${param.gender}
    ${paramValues.hobbies[0]}
    ${paramValues.hobbies[1]}
    ${paramValues.hobbies[2]}
    ${paramValues.hobbies[3]}
    ${paramValues.hobbies[4]}
    
    
6. session으로 List객체를 선언하고, 사원정보(사원번호, 사원명, 직책)을 입력하여
    누적처리한 리스트를 출력하세요.
    1) 해당 범위 객체를 선언...
    session.setAttribute("empList", new ArrayList<Emp>());
    session.setAttribute("emp", new Emp());
    2) 이동해서 el로 데이터 할당 처리할 수 있게..
    response.sendRedirect("a0825_1.jsp");
    3) 해당 페이지
    - 화면 구성 : 사원정보(사원번호, 사원명, 직책)을 입력
    ${emp.setEmpno(param.empno)}
    ${emp.setEname(param.ename)}
    ${emp.setJob(param.job)}
    ${empList.add(emp)}; 
    사원정보 갯수 : ${empList.size()}
    ${empList.get(0).empno},${empList.get(0).ename},${empList.get(0).job}
    ${empList.get(1).empno},${empList.get(1).ename},${empList.get(1).job}
    ${empList.get(2).empno},${empList.get(2).ename},${empList.get(2).job}
    
# 주요진도 목표
1. el의 연산자 처리, 기타 기능메서드를 효과적으로 활용할 수 있다.
2. ajax의 원리를 이해하고, js에서 ajax 처리를 하는 기능 메서드를 활용할 수 있다.

--%>
<%

session.setAttribute("empList", new ArrayList<Emp>());
session.setAttribute("emp", new Emp());
response.sendRedirect("a0825_1.jsp");


pageContext.setAttribute("name", "사과");
pageContext.setAttribute("price", 3000);
pageContext.setAttribute("cnt", 2);
// request|session|application 범위로 설정
request.setAttribute("pname","컴퓨터");
session.setAttribute("id","himan");
application.setAttribute("serverInfo","tomcat 9.0");

request.setAttribute("array01", new String[]{"사과","바나나","딸기"});
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">회원등록</h3>	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><th>성별</th><td>
				<input type="radio" name="gender" value="남" checked/>남
				<input type="radio" name="gender" value="여"/>여
			</td></tr>
		<tr><th>취미</th><td>
				<input type="checkbox" name="hobbies" value="음악" />음악
				<input type="checkbox" name="hobbies" value="운동" />운동
				<input type="checkbox" name="hobbies" value="여행" />여행
				<input type="checkbox" name="hobbies" value="독서" />독서
				<input type="checkbox" name="hobbies" value="게임" />게임
			</td></tr>			
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>	
	<h3 align="center">회원등록 내용</h3>	
   	<table  align="center" class="listTable">
		<tr><th>아이디</th><td>${param.id}</td></tr>
		<tr><th>패스워드</th><td>${param.pass}</td></tr>
		<tr><th>성별</th><td>${param.gender}</td></tr>
		<tr><th>취미1</th><td>${paramValues.hobbies[0]}</td></tr>
		<tr><th>취미2</th><td>${paramValues.hobbies[1]}</td></tr>
		<tr><th>취미3</th><td>${paramValues.hobbies[2]}</td></tr>
		<tr><th>취미4</th><td>${paramValues.hobbies[3]}</td></tr>
		<tr><th>취미5</th><td>${paramValues.hobbies[4]}</td></tr>
		<%-- el 태그의 형변환은 jstl에서 확인해보자.. --%>
   	</table> 
	<h3 align="center">페이지 scope 호출 예제</h3>
   	<table  align="center" class="listTable">
      <tr><th>${pageScope.name}</th><th>${pageScope.price}</th><th>${pageScope.cnt}</th></tr>
      <tr><th colspan="3">${requestScope.pname}</th></tr>
      <tr><th colspan="3">${sessionScope.id}</th></tr>
      <tr><th colspan="3">${applicationScope.serverInfo}</th></tr>
   	</table>	
   	<table  align="center" class="listTable">
      <tr><th>array01</th><th>${array01[0]},${array01[1]},${array01[2]}</th></tr>
   	</table> 
   	<h3 align="center">쇼핑 el처리</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><th>할인율</th><td>
			<select name="discount"> <%-- 요청값에 의해 할인적용내용을 처리할려면 prod.price*prod.cnt*param.discount --%>
				<option value="0.9">10%</option>
				<option value="0.85">15%</option>
				<option value="0.8">20%</option>
			</select>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="구매처리"/></td></tr>
	</table>	
	</form>
   	<h3 align="center">로그인 el처리</h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="로그인"/></td></tr>
	</table>	
	</form>	
	<h4 align="center">
		아이디 : ${param.id},
		패스워드 : ${param.pass},
		${ (param.id == 'himan' && param.pass=='7777')?'인증':'미인증'}</h4>
	
<%
pageContext.setAttribute("prod", new Product());
%>	
	<%-- el는 요청값이 없는 null에 대한 처리도 자동으로 에러없이 처리해준다. --%>
	${prod.setName(param.pname)}${prod.setPrice(param.price)}${prod.setCnt(param.cnt)}
   	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.name}</td></tr>
		<tr><th>가격</th><td>${prod.price}</td></tr>
		<tr><th>갯수</th><td>${prod.cnt}</td></tr>
		<tr><th>기본총계</th><td>${prod.price*prod.cnt}</td></tr>
		<tr><th>할인적용금액</th><td>${prod.price*prod.cnt*param.discount}</td></tr>
		<%-- el 태그의 형변환은 jstl에서 확인해보자.. --%>
   	</table> 
	
</body>
</html>