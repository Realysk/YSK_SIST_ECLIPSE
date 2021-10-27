<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>

<%

%>
<body>

	<h2 align="center">주간문제</h2>
<%-- 
# 주간 정리문제
1. useBean을 활용하여, 요청값을 처리하는 코드를 예제로 기술하세요. --%>
<jsp:useBean id="p01" class="jspexp.z02_vo.Person"/>
<jsp:setProperty name="p01" property="*"/>
<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>나이</th><td><input type="text" name="age" value=""/></td></tr>
		<tr><th>사는 곳</th><td><input type="text" name="loc" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>		
</form>		
<c:if test="${not empty p01.name }">
	<h3 align="center">${p01.name}, ${p01.age}, ${p01.loc}</h3>
</c:if>
<%--
2. useBean과 dao를 활용하여 사원정보 검색을 출력하세요.--%>
	<form id="frm02">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value="${param.ename}"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value="${param.job}"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:useBean id="sch" class="jspexp.z02_vo.Emp"/>
	<jsp:setProperty property="*" name="sch"/>
	<%-- 초기 null값에 대한 처리 --%>
	<c:if test="${sch.ename==null}"><c:set target="${sch}" property="ename" value=""/></c:if>
	<c:if test="${sch.job==null}">${sch.setJob("")}</c:if>
	<table  align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var = "emp" items="${dao.getPreparedEmpList(sch)}">
		<tr><td>${emp.empno}</td><td>${emp.ename}</td>
			<td>${emp.job}</td><td>${emp.sal}</td><td>${emp.deptno}</td></tr>
		</c:forEach>
	</table>	

<%--
3. el 태그의 empty는 어떤 활용을 할 수 있는지? 실제 예제를 들어 보세요.
	해당 값이 null경우나 ""공백인 경우에 대한 처리를 할때, 조건값을 활용한다.

--%>
	<h3 align="center">empty 처리 예제</h3>
	<form id="frm02" method="post">
	<table align="center" class="listTable">
		<tr><th>num01</th><td><input type="text" name="num01" value=""/></td></tr>
		<tr><th>num02</th><td><input type="text" name="num02" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="합산"/></td></tr>
	</table>	
	</form>	
	<c:set var="num01" value="${(empty param.num01)?'0':param.num01}"/>
	<c:set var="num02" value="${(empty param.num02)?'0':param.num02}"/>
	<h4 align="center">${num01} + ${num02} = ${num01 + num02}</h4>
<%--
4. page scope와 session scope를 이용하여, 회원정보를 받아서, 리스트되게 처리하세요.
	1) form : 1단계 회원명입력  2단계 : 그외 정보입력
	2) page scope 로 요청값 받기
	3) session scope로 데이터 있는지 여부를 확인하여 누적처리하기.
--%>
	<h3 align="center">회원 정보 입력 및 리스트</h3>
	<form method="post">
	<table align="center" class="listTable">
		<tr><th>회원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>		
	<c:set var="member" value="${param.name}" scope="page"/>
	<c:choose>
		<c:when test="${mlist==null}"><%-- empty mlist는 객체가 생성이 되었으나 size가 0인 경우도 포함.. --%>
			<jsp:useBean id="mlist" class="java.util.ArrayList" scope="session"/>		
		</c:when>
		<c:otherwise>
			<span style="visibility:hidden;">${mlist.add(member)}</span>		
		</c:otherwise>
	</c:choose>
	<h4 align="center">현재 크기:${mlist.size()}</h4> 
	<c:forEach var="name" items="${mlist}">	
	<h4 align="center">${name}</h4>
	</c:forEach>	
	<h3 align="center">회원 정보 입력 및 리스트2</h3>
	<form method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass" value=""/></td></tr>
		<tr><th>회원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>		
	<%-- 단위객체로 받을 수 있는 page범위 Member 선언 --%>
	<jsp:useBean id="member2" class="jspexp.z02_vo.Member" scope="page"/>
	<c:if test="${not empty param.id}"><%-- 요청값이 있을 때.. --%>
		<jsp:setProperty property="*" name="member2"/>
	</c:if>
	<c:choose>
		<c:when test="${mlist2==null}"><%-- empty mlist는 객체가 생성이 되었으나 size가 0인 경우도 포함.. --%>
			<jsp:useBean id="mlist2" class="java.util.ArrayList" scope="session"/>		
		</c:when>
		<c:otherwise>
			<span style="visibility:hidden;">${mlist2.add(member2)}</span>		
		</c:otherwise>
	</c:choose>
	<h4 align="center">등록회원수:${mlist2.size()}</h4> 
	<table  align="center" class="listTable">
		<tr><th>아이디</th><th>회원명</th><th>권한</th><th>포인트</th></tr>
		<c:forEach var="mem" items="${mlist2}">	
		<tr><td>${mem.id}</td><td>${mem.pass}</td><td>${mem.auth}</td><td>${mem.point}</td></tr>
		</c:forEach>
	</table>	
	
<%--
5. jstl을 통한 객체할당을 하고 property를 변경처리하세요--%>
	<c:set var ="prod" value="<%=new Product()%>"/>
	<c:set target="${prod}" property="name" value="사과"/>
	<c:set target="${prod}" property="price" value="3000"/>
	<c:set target="${prod}" property="cnt" value="2"/>
	<h4 align="center">jstl 객체 확인</h4> 
	<table  align="center" class="listTable">
		<tr><th>물건명</th><td>${prod.name }</td></tr>
		<tr><th>가격</th><td>${prod.price }</td></tr>
		<tr><th>갯수</th><td>${prod.cnt }</td></tr>
	</table>		
<%--.
6. jstl 반복문과 조건문을 이용하여, 3/6/9게임을 20까지 처리하여 출력하세요.--%>
	<h4 align="center">3,6,9 게임 출력</h4> 
	<table  align="center" class="listTable">
		<tr>
		<c:forEach var="cnt" begin="1" end="20">
		<th>
			<c:choose>
				<c:when test="${cnt%10!=0 && cnt%10%3==0}">
					짝
				</c:when>
				<c:otherwise>
					${cnt}				
				</c:otherwise>
			</c:choose>
		</th>
		</c:forEach>
		</tr>
	</table>

<%--
7. XMLHttpRequest 객체의 get/post, 동기/비동기 방식의 기본 처리 형식을 기술하세요.--%>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("#ajax01").click(function(){
			// get방식 동기 처리..
			xhr.open("get","z04_data.jsp?id=himan",false);
			xhr.send();
			$("#show1").text(xhr.responseText);
		});
		$("#ajax02").click(function(){
			xhr.open("post","z04_data.jsp",true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("id=higirl");
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					$("#show2").text(xhr.responseText);
				}
			}
		});
		$("[name=empno]").keyup(function(event){
			if(event.keyCode==13){
				// get/동기방식
				xhr.open("get","z05.data.jsp?empno="+$(this).val(),false);
				xhr.send();
				var emp = JSON.parse(xhr.responseText);
				console.log(emp);
				if(emp.ename!=undefined){
					$(".emp").eq(0).text(emp.empno);
					$(".emp").eq(1).text(emp.ename);
					$(".emp").eq(2).text(emp.job);
					$(".emp").eq(3).text(emp.hiredate);
					$(".emp").eq(4).text(emp.sal);
					$(".emp").eq(5).text(emp.comm);
					$(".emp").eq(6).text(emp.deptno);
				}else{
					$(".emp").text("");
				}
			}	
		});
	});
</script>
	<h2 id="ajax01">get방식/동기처리</h2>
	<h3 id="show1"></h3>
	<h2 id="ajax02">post방식/비동기처리</h2>
	<h3 id="show2"></h3>
<%--
8. 사원 empno를 입력하고 enter키를 눌렀을 때, 자세한 정보을 아래에 출력되게 ajax로 처리하세요.--%>
	<p align="center">
		사원번호:<input type="text" name="empno"/>
	</p>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td class="emp"></td></tr>
		<tr><th>사원명</th><td class="emp"></td></tr>
		<tr><th>직책</th><td class="emp"></td></tr>
		<tr><th>입사일</th><td class="emp"></td></tr>
		<tr><th>급여</th><td class="emp"></td></tr>
		<tr><th>보너스</th><td  class="emp"></td></tr>
		<tr><th>사원번호</th><td  class="emp"></td></tr>
	</table>

<%--
# 주요 목표
1. MVC를 통한 개발 패턴을 기본 form형식과 ajax형식을 비교할 수 있고, 처리할 수 있다.
2. json 데이터를 sever단에서 VO나 ArrayList를 통해서 변환하는 방법을 이해하고 처리할 수 있다.
3. jquery의 여러가지 이벤트 형식을 이해하고 처리할 수 있다.
# 핵심코드
$("요소").on({"이벤트1",function(){})
.bine(), unbind()
.prependTo(), after(), before(), wrap(), replaceWith(), clone()

--%>

	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>