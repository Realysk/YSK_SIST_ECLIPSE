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
# 표현 언어(Expression Language)
1. jsp에서 사용 가능한 새로운 스크립트 언어
	데이터가 없을 때, nullpoint예외가 발생하지 않아서, 웹 화면에서는
	효과적인 언어라고 할 수 있다.
	jstl과 함께 사용하면 기존 script언어를 쓰지 않아도 된다.
2. 주요 기능
	1) jsp의 네 가지 기본 객체가 제공하는 영역의 속성 사용
		(page, request, session, application)에서 변수를 사용
		session.setAttribute("name","홍길동");
		${name} :session 범위 안에서 해당 변수의 데이터를 ${}형식으로
		활용할 수 있다.
	2) 객체와 집합 객체에 대한 접근 방법 제공
		- 객체
		request.setAttribute("p01", new Person("홍길동",25,"서울신림"));
		${변수명.get프로퍼터}
		${p01.name} ${p01.age} ${p01.loc}
		- 집합객체
		request.setAttribute("arr01", {"사과","바나나","딸기"});
		${arr01[0]},${arr01[1]},${arr01[2]},
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2);
		plist.add(new Product("바나나",4000,3);
		plist.add(new Product("딸기",12000,3);
		request.setAttribute("plist",plist);
		${plist.get(0).name},
		${plist.get(1).price},
		${plist.get(2).cnt},
	3) 수치연산, 관계연산, 논리 연산을 제공
		request.setAttribute("num01",25);	
		request.setAttribute("num02",5);	
		${num01+num02}, ${num01*num02} 사칙연산
		${num01>=num02} 관계연산
		request.setAttribute("mem",new Member("himan",7777");
		${mem.id=='himan' and mem.pass=='7777'}
		비교연산자 - ==,eq, !=, ne, 
					< 또는 lt, >, gt, >= ge
		논리연산 처리 && and, || or, ! not
	4) empty
		${변수명 !=null && 변수명 !=""}
		${not empty 변수명} null 아니고 공백이 아닐때
		${empty 변수명} null 이거나 공백일때, 
	5) 3항 연산자
		${ 변수==변수?"true일때":"false일때" }	

--%>
<%
	// 페이지 범위로 데이터 설정..
	pageContext.setAttribute("name", "사과");
	pageContext.setAttribute("price", 3000);
	pageContext.setAttribute("cnt", 2);
	// request|session|application 범위로 설정
	request.setAttribute("pname", "컴퓨터");
	session.setAttribute("id", "himan");
	application.setAttribute("serverInfo", "tomcat 9.0");
	
	
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("el 태그의 활용");
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center">일반 변수</h3>
	<%--
	pageContext로 설정한 데이터는 pageScope.설정변수로 호출할 수 있다.
	pageScope는 명확하게 구분해줄 필요성이 있을 때를 제외하고 생략 가능하다.
	 --%>
	<table  align="center" class="listTable">
		<tr><th>${pageScope.name}</th><th>${price}</th><th>${cnt}</th></tr>
		<tr><th>${sessionScope.name}</th><th>${sessionScope.price}</th><th>${requestScope.pname}</th></tr>
		<tr><th>${requestScope.pname}</th><th>${id}</th><th>${applicationScope.cnt}</th></tr>
		<tr><th>${applicationScope.pname}</th><th>${pageScope.id}</th>
			<th>${applicationScope.serverInfo}</th></tr>
	</table>	
	<%-- ex) session scope별로 도서명 도서가격 도서갯수 출판사로 선언하고, 해당 내용을 el로 호출하세요 
			3조   전체(손들기)
	 --%>
	 <%
	 	// p01이라는 이름으로 객체를 할당
	 	request.setAttribute("p01", new Person("홍길동", 25, "서울신림동"));
	 %>
	 	${p01.setName('김유신')} ${p01.setAge(31)} <%-- el을 통한 변경이 가능하다. --%>
	 	<h3 align="center"> 객체로 할당</h3>
		<table align="center" class="listTable">
			<tr><th>${p01.name}</th><th>${p01.age}</th><th>${p01.loc}</th></tr>
		</table>
		
	<%-- ex2) session 범위로 객체로 물건명, 가격, 갯수를 할당하고 가격을 el로 인상 후 10% 출력하세요. --%>
	
	<%
		session.setAttribute("p02", new Product("사과", 3000, 5));
	%>
		${p02.setPrice(p02.price*1.1)}
	 	<h3 align="center"> 객체로 구매 정보 내용 확인 </h3>
		<table align="center" class="listTable">
			<tr><th>물건명</th><td>${p02.name}</td></tr>
			<tr><th>가격</th><td>${p02.price}</td></tr>
			<tr><th>수량</th><td>${p02.cnt}</td></tr>
		</table>
	<%
		// 배열형 데이터 처리
		request.setAttribute("array01", new String[]{"사과","바나나","딸기"});
		// ArrayList형 데이터 처리
		List<Product> list = new ArrayList<Product>();
		list.add(new Product("사과", 3000, 2));
		list.add(new Product("바나나", 4000, 3));
		list.add(new Product("딸기", 12000, 5));
		request.setAttribute("list", list);
	%>
	 	<h3 align="center"> 리스트형 배열 데이터 처리 </h3>
		<table align="center" class="listTable">
			<tr><th>array01</th><td>${array01[0]}, ${array01[1]}, ${array01[2]}</td></tr>
			<tr><th>list</th><td>${list.get(0).getName()}</td></tr>
			<tr><th>list</th><td>${list.get(1).getPrice()}</td></tr>
			<tr><th>list</th><td>${list.get(2).getCnt()}</td></tr>
		</table>
		
	<%-- ex3) 부서정보 ArrayList<Dept>로 할당하여 el로 호출하여 출력하세요. --%>
	
	<%
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		dlist.add(new Dept(10, "si", "서울신림"));
		dlist.add(new Dept(20, "기획", "서울신림"));
		dlist.add(new Dept(30, "회계", "서울마포"));
		dlist.add(new Dept(40, "개발", "서울강남"));
		request.setAttribute("dlist", dlist);
	%>
		<table align="center" class="listTable">
			<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
			<tr><td>${dlist.get(0).deptno}</td><td>${dlist.get(0).dname}</td><td>${dlist.get(0).loc}</td></tr>
			<tr><td>${dlist.get(1).deptno}</td><td>${dlist.get(1).dname}</td><td>${dlist.get(1).loc}</td></tr>
			<tr><td>${dlist.get(2).deptno}</td><td>${dlist.get(2).dname}</td><td>${dlist.get(2).loc}</td></tr>
			<tr><td>${dlist.get(3).deptno}</td><td>${dlist.get(3).dname}</td><td>${dlist.get(3).loc}</td></tr>
		</table>
	<%--
	요청값 처리
		1. ${param.요청키}
		2. ${paramValues.요청키}
		?name=홍길동
	 --%>
	 	<h3 align="center"> 요청값에 대한 처리 : ${param.name} </h3>
</body>
</html>