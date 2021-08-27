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
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=dname],[name=loc]").keyup(function(event) {
			//if(event.keyCode==13){
			search();
			//}
		});
		$("#schBtn").click(function(){
			search();
		});
	});
	function search(){
		var snd = "dname="+$("[name=dname]").val()+"&loc="+$("[name=loc]").val();
		var xhr = new XMLHttpRequest();
		xhr.open("post","z14_data.jsp",true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send(snd);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				$("div").html(xhr.responseText);
			}
		};
	}
</script>
<body>
	<h2 align="center">부서 정보 ajax 처리</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>부서명</th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" id="schBtn" value="검색"/></td></tr>
	</table>	
	</form>
	<div></div>
	
</body>
</html>