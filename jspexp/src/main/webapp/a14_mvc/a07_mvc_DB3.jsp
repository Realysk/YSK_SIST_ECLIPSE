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
ex) id로 회원정보 MVC ajax로 검색처리.. 5조
--%>

<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=id]").keyup(function(event){
			if(event.keyCode==13){
				var idVal = $("[name=id]").val();
				xhr.open("get","${path}/schMember.do?id="+idVal,true);
				xhr.send();
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						var jTxt = xhr.responseText;
						$("#show td").text("");
						if(jTxt!="{}"){
							var member = JSON.parse(xhr.responseText);
							console.log(member);
							$("#show td").eq(0).text(emp.id);
							$("#show td").eq(1).text(emp.name);
							$("#show td").eq(2).text(emp.auth);
							$("#show td").eq(3).text(emp.point);
						}else{
							alert("해당 회원번호 데이터가 없습니다.");					
						}
					}
				};
				
			}
		});
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center">회원정보 mvc(ajax처리)</h2>
	<table align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td></tr>
	</table>	
	<table id="show"  align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%"><col width="20%"><col width="30%">
		<tr><th>아이디</th><td></td><th>이름</th><td></td></tr>
		<tr><th>권한</th><td></td><th>포인트</th><td></td></tr>
	</table>	
</body>
</html>