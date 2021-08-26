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
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").click(function(){
			console.log("1");
			var xhr = new XMLHttpRequest();
			console.log("2");
			xhr.open("get","z06_data.txt",true);
			console.log("3");
			xhr.send();
			console.log("4");
			xhr.onreadystatechange=function(){
				console.log("이벤트#"+xhr.readyState+":"+xhr.status);
				if(xhr.readyState == 4 && xhr.status==200){
					// 문자열데이터 확인..
					console.log(xhr.responseText);
					var plist = JSON.parse(xhr.responseText);
					var show="";
					$(plist).each(function(idx, prod){
						show+="<tr><td>"+(idx+1)+"</td><td>"+prod.name+
						"</td><td>"+prod.price+"</td><td>"+prod.cnt+"</td></tr>";
					});
					$("tbody").html(show)
				}
			}
			
		});
	});
</script>
</head>
<body>
	<h2 align="center">구매정보로딩</h2>
	<table  align="center" class="listTable">
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th></tr></thead>
		<tbody></tbody>
	</table>	
	
</body>
</html>