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
<%-- 
# 요청값에 따른 반응값 처리.
1. get방식 요청값 처리 
	url+"?key=value&key2=vlue2"...
	
2. 데이터를 처리해주는 방식
	1) .txt : 입력된 데이터를 전송
	2) .html : html 태그 결과 코드를 전송
	3) .jsp : jsp로 요청값을 받은 화면을 처리..
	4) controller(MVC패턴)의 결과로 문자열을 받는 처리..	 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("#schBtn").click(function(){
			var nameVal = $("[name=name]").val();
			//alert(nameVal);
			xhr.open("get","z08_data.jsp?name="+nameVal,false);
			xhr.send();
			$("div").html(xhr.responseText);
		});
	});
	// ex) a08_calcu.jsp [   ] [  ] [합산]  
	//        @@ + @@ = @@  <==  z09_data.jsp  4조
</script>
<body>
	<h2 align="center">html화면호출!!</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
		<input type="button" id="schBtn" value="호출"/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>