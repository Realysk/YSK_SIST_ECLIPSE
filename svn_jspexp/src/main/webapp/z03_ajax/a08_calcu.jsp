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
# 

--%>
<%

%>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#plusBtn").click(plus);
		// 입력과 동시에 이벤트로 요청값과 결과값을 서버에 전달해서 처리..
		$("[name=num01],[name=num02]").keyup(plus);
	});
	function plus(){
		var num01 = $("[name=num01]").val();
		var num02 = $("[name=num02]").val();
		var snd = "?num01="+num01+"&num02="+num02;
		var xhr = new XMLHttpRequest();
		xhr.open("get","z09_data.jsp"+snd,false);
		xhr.send();
		$("div").html(xhr.responseText);
		
	}
	
</script>
	<h2 align="center">동기 연산</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>숫자1</th><td><input type="text" name="num01" value="0"/></td></tr>
		<tr><th>숫자2</th><td><input type="text" name="num02" value="0"/></td></tr>
		<tr><td colspan="2"><input type="button" value="합산" id="plusBtn"/></td></tr>
	</table>	
	</form>
	<div></div>	
	
</body>
</html>