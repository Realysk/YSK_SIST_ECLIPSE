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
# 세션이란?
1. 웹 컨테이너에서 클라이언트의 정보를 보관할 때, 사용된다.
2. 오직 서버에서만 생성하여 저장된다.
3. 클라이언트와 관계에서 세션이 생성되기에, 같은 브라우저가 아니면 세션은 종료가 된다.
4. session의 설정/삭제
	session.setAttribute("세션명", 할당할객체);
	지정한 세션만 삭제 session.removeAttribute("세션명")
	전체세션의 종료 session.invalidate()
5. session의 유효시간 설정.
	1) web.xml
	<session-config>
		<session-timeout>분단위
	2) setMaxInactiveInterval();
		
--%>
<%
	// 1. 기본 변수할당.
	session.setAttribute("num01", 25);
	// 2. 기본 객체할당.
	session.setAttribute("p01", new Person("홍길동",25,"서울"));
	// 3. 배열형 List 객체할당.
	session.setAttribute("list", Arrays.asList("사과","바나나","딸기"));
	
	// 1. 변수가져오기.
	int num01 = (Integer)session.getAttribute("num01");
	// 2. 객체 가져오기
	Person p01 = (Person)session.getAttribute("p01");
	// 3. 배열 가져오기..
	List<String> fruits = (List<String>)session.getAttribute("list");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("세션데이터");
	});
</script>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>변수(num01)</th><td><%=num01%></td></tr>
		<tr><th>변수(num01)EL</th><td>${num01}</td></tr>
		<tr><th>객체(p01)</th><td><%=p01.getName()%>,<%=p01.getAge()%>,<%=p01.getLoc()%></td></tr>
		<tr><th>객체(p01)EL</th><td>${p01.name},${p01.age},${p01.loc}</td></tr>
		<tr><th>배열(List)</th><td><%=fruits.get(0)%>,<%=fruits.get(1)%>,
								<%=fruits.get(2)%></td></tr>
		<tr><th>배열(List)EL</th><td>${list.get(0)},${list.get(1)},${list.get(2)}</td></tr>								
	</table>	
<%-- ex) 변수 num02, 객체 Product, 배열객체 List<Member>로 session으로 저장하고,
		호출하세요.. 5조, 전체(손)--%>  	
	<%
	session.setAttribute("num02", 25);
	session.setAttribute("prod", new Product("사과",3000,2));
	// Member(String id, String auth)
	session.setAttribute("mlist", Arrays.asList(new Member("himan","관리자"),
												new Member("higirl","일반사용자"),
												new Member("goodMan","방문객")
												));
	int num02 = (Integer)session.getAttribute("num02");
	Product prod = (Product)session.getAttribute("prod");
	List<Member>  mlist= (List<Member>)session.getAttribute("mlist");
	%>	
	<table  align="center" class="listTable">
		<tr><th>num02</th><td><%=num02 %></td></tr>
		<tr><th>prod</th><td><%=prod.getName()%>,<%=prod.getPrice()%>,<%=prod.getCnt()%></td></tr>
		<tr><th>mlist</th>
			<td>
				<%for(Member m:mlist){ %>
					<%=m.getId() %>,<%=m.getAuth()%><br>
				<%} %>
			</td>
			</tr>
	</table>
	<h3 align="center" onclick="location.href='a02_show.jsp'">Session의 능력 확인</h3>			
</body>
</html>