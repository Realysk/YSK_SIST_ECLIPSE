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
		var xhr = new XMLHttpRequest();
	    $("[name=age]").keyup(function(event){
	    	if(event.keyCode==13){
	        	var snd ="age="+$("[name=age]").val();
	            xhr.open("get","${path}/ckAdult.do?"+snd,true);
	            xhr.send();
	            xhr.onreadystatechange=function(){
	            	if (xhr.readyState==4&&xhr.status==200) {
	                   alert(xhr.responseText);
	                   $("#show").text(xhr.responseText);
	                };
	            };
	         }
	    });
	});
	// ajax 처리시, form에는 enter키가 submit로 처리되는 것을 방지해주는 처리를 하여야 한다.
</script>
	<h2 align="center">성년 확인</h2>
	<table align="center" class="listTable">
		<tr><th>나이</th><td><input type="text" name="age" value=""/></td></tr>
	</table>	
</body>
</html>