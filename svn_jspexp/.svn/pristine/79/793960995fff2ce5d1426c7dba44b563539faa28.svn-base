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
# jstl의 조건문 처리

--%>
<%

%>
<body>
	<h2 align="center">jstl에서 조건문 처리</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>점수</th><td><input type="text" name="point" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
		<input type="submit" value="등급확인"/></td></tr>
	</table>	
	</form>
	<c:if test="${not empty param.point}"> <%-- 요청값이 있을 때, 출력 처리 --%>
		<h3 align="center">${param.point}점에 
			<c:choose>
				<c:when test="${param.point>=90}">A등급</c:when>
				<c:when test="${param.point>=80}">B등급</c:when>
				<c:when test="${param.point>=70}">C등급</c:when>
				<c:when test="${param.point>=60}">E등급</c:when>
				<c:otherwise>F등급</c:otherwise>
			</c:choose> 입니다.
		</h3>	
	</c:if>
	<%-- ex) 물건가격[   ] 갯수[   ] [구매]
			구매 총계가 10만원 이상일 때, 10%할인, 5~10미만 5%, 그외는 3%할인
			할인률과 최종 금액 표시.. 2조
	
	 --%>
	
</body>
</html>