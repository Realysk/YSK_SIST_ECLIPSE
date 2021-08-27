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
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>
<%--
# jstl의 반복문 처리.
1. 기본 형식
	<c:forEach var="cnt" begin="시작변수" end="마지막변수"
		step="증감단위">
		<h2>${cnt}</h2>
	</c:forEach>	
	for문과 비교
	<%for(int cnt=시작변수;cnt<=마지막변수;cnt++(증감단위)){ %>	
		<h2><%=cnt%></h2>
	<%}%>	
2. 기타 옵션..
	<c:forEach var="str" items="${배열형데이터}" varStatus="sts">
		<h2>${sts.index}
	1) varStatus="sts" 
		${sts.index} : 반복문에서 0부터 시작하는 index를 출력
		${sts.count} : 반복문에서 1부터 시작하는 카운트 출력
		${sts.first} : boolean을 첫번째 값인지 여부를 나타냄..
		${sts.last} : boolean으로 마지막 값인지 여부를 나타냄..
	int index = 0;
	int count = 1;
	boolean first = false;
	boolean last = false;		 
	for(String str : array){
		if(index == 0){
			first = true;
		}
		if(count == array.length){
			last = true;		 
		}
		index++;
		count++;
		
	}
		
--%>
<%

%>
<body>
	<h2 align="center">반복문처리..</h2>
	<h3 align="center">1~15까지 출력</h3>
	<c:forEach var = "cnt" begin="1" end="15">
		<span>${cnt},</span>
	</c:forEach>
	<h3 align="center">20~50까지 짝수 출력</h3>
	<c:forEach var = "cnt" begin="20" end="50" step="2">
		<span>${cnt},</span>
	</c:forEach>	
	<%--
	ex) 반복문 연습
	1. h5로 1~7까지 출력 하면서 안녕하세요 표시.
	2. 테이블을 열을 1열~3열까지  @@행 @@열 표기..
	3. 테이블을 행을 1행~5행까지  @@행 @@열 표기..  5조
	생각해보기) 행열이 있는 테이블은 어떻게 구성할 것인가?
	 --%>
	<c:forEach var ="cnt" begin="1" end="7"> 
	<h5 align="center">${cnt}) 안녕하세요</h5>
	</c:forEach>
	<table  align="center" class="listTable">
		<tr>
			<c:forEach var="cnt" begin="1" end="3">
			<th>(1행,${cnt}열)</th>
			</c:forEach>
		</tr>
	</table>	
	<table  align="center" class="listTable">
		<c:forEach var="cnt" begin="1" end="5">
		<tr><th>(${cnt}행,1열)</th>
		</tr>
		</c:forEach>
	</table>
	<table  align="center" class="listTable">
		<c:forEach var="rcnt" begin="1" end="3">
			<tr>
			<c:forEach var="ccnt" begin="1" end="3">
				<td>[${rcnt}행, ${ccnt}열]</td>
			</c:forEach>
			</tr>
		</c:forEach>
		</tr>
	</table>	
	
	<table  align="center" class="listTable" width="300pt" height="300pt">
			<c:forEach var="cnt" begin="1" end="9">
			<c:if test="${cnt%3==1}"><tr></c:if> 
				<%-- 나머지값이 1일 때, 행을 만들고<tr>, 행의 카운트를 증가 처리한다. --%>
			<th>${cnt}</th>
			<c:if test="${cnt%3==0}"></tr></c:if>
				<%-- 나머지값이 0일 때, 행을 닫는다</tr> --%>
			</c:forEach>
		</tr>
	</table>	
	<%-- ex) 행/열 테이블 jstl로 생성  4*5 테이블을 생성하고 1~20까지 출력하세요
			열이 5개 단위로 tr을 추가 처리..
			1조..  --%>
	<table  align="center" class="listTable" width="50pt" height="40pt">
			<c:forEach var="cnt" begin="1" end="20">
			<c:if test="${cnt%5==1}"><tr></c:if> 
			<th>${cnt}</th>
			<c:if test="${cnt%5==0}"></tr></c:if>
			</c:forEach>
		</tr>
	</table>				
</body>
</html>