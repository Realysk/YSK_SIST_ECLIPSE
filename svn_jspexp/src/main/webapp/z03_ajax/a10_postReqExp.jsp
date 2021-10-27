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
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=name],[name=price],[name=cnt]").keyup(function(event){
			if(event.keyCode==13){
				var name = $("[name=name]").val();
				var price = $("[name=price]").val();
				var cnt = $("[name=cnt]").val();
				var snd ="name="+name+"&price="+price+"&cnt="+cnt;
				xhr.open("post","z11_data.jsp",true);
				// 1. post방식일 때, header부분 설정변경..
				xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xhr.send(snd);
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						$("div").html(xhr.responseText);
					}
				}
				// ex) a10_postReqExp.jsp  물건명, 가격, 갯수 입력 enter    z11_data.jsp  물건명 총계
				//     5조
			}
		});
	});
</script>
	<h2 align="center">비동기 post 방식</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>