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
# 요청값 post방식처리..
1. 아래의 기능 이외는 동일
	1) header 정보 변경..
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	2) send의 매개값으로 요청값전달
	xhr.send("key=value&key1=value2");
--%>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=id],[name=pass]").keyup(function(event){
			console.log(event.keyCode);
			if(event.keyCode==13){
				var id = $("[name=id]").val();
				var pass = $("[name=pass]").val();
				var snd ="id="+id+"&pass="+pass;
				console.log(snd);
				xhr.open("post","z12_data.jsp",true);
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
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>