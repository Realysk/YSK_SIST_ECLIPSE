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
# 배열형 반복처리 속성
1. <c:forEach var="단위데이터변수" 
	items="${배열형데이터}" varStatus="변수명">
	<c:forEach var="str" items="${arry}" varStatus="sts">
		${str} : 단위 데이터 출력..
		${sts.index} : 0부터 시작하여 증가하는 index번호 출력
		${sts.count} : 1부터 시작하여 증가하는 카운트번호 출력
		${sts.first} : 해당 반복의 첫번째인지 여부 boolean
			ex) <c:if test="${sts.first}">
		${sts.last} : 해당 반복의 마지막인지 여부 boolean
			ex) <c:if test="${sts.last}">
 vs) int idx=0;
     int count=1;
 	 for(String str:arry){
  		if(idx==0){ // 첫번째데이터
  		
  		}
  		<h2><%=str%></h2>
  		if(idx+1==arry.length){ // 마지막데이터
  		
  		}
  		idx++;
  		count++;
     }

--%>
<%
	pageContext.setAttribute("array", new String[]{"사과","바나나","딸기"});
	pageContext.setAttribute("list", Arrays.asList("컴퓨터","핸드폰","복사기","복사기","복사기","복사기","복사기") );
%>
<style>
	td{text-align:center;}
</style>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>번호</th><th>index</th><th>첫번째값여부</th><th>마지막값여부</th><th>데이터</th></tr>
		<c:forEach var="fruit" items="${array}" varStatus="sts">
			<tr><td>${sts.count}</td><td>${sts.index}</td>
				<td>${sts.first}</td><td>${sts.last}</td><td>${fruit}</td></tr>
		</c:forEach>
	</table>	
	<table  align="center" class="listTable">
		<tr><th>번호</th><th>index</th><th>첫번째값여부</th><th>마지막값여부</th><th>데이터</th></tr>
		<c:forEach var="prod" items="${list}" varStatus="sts">
			<tr ><td style="background:${sts.first||sts.last?'yellow':''};">${sts.count}</td><td>${sts.index}</td>
				<td>${sts.first}</td><td>${sts.last}</td><td>${prod}</td></tr>
		</c:forEach>
	</table>	
	<%--
	ex) List형태로 무지개 색을 선언하고, 반복문을 통해 h3에 배경색상과 함께 출력하세요..~~ 2조
	
	 --%>
   <%
      pageContext.setAttribute("rbList", Arrays.asList("red",  "orange", "yellow", "green",
    												"blue", "navy", "purple"));
   %>      
   <c:forEach var="rainbow" items="${rbList }" varStatus="sts">
      <h3 align="center" style="background:${rainbow};">${sts.count}) ${rainbow }</h3>
   </c:forEach>	 
		
</body>
</html>