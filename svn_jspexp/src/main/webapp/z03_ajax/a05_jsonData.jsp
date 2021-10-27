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

<%-- 
# ajax로 json데이터 로딩.
1. 서버단에 있는 핵심 json형식의 데이터를 ajax로 가져오는 것을 말한다.
2. ajax처리 json데이터 필수 형식
	1) {속성:속성값},[{속성:속성값....}]
	2) 웹서비스상 json형식은 다음과 같은 형식을 준수하여야, 정상적으로 
		객체화하여 사용할 수 있다.
	3) 형식(ajax처리 시는 반드시 지켜야 한다.)
		{"속성":"문자열데이터","속성":숫자형/boolean형데이터}
		속성은 반드시 ""(쌍따옴표) 사이에 입력하여야 한다.
		문자열 데이터 반드시 "" 사이에 입력하여야 한다. 
			cf) ''사이에 입력하거나, 없이 입력하는 것은 정상적인 처리가 되지 않는다.
		숫자형/boolean형 데이터는 반드시 ""/''없이 그대로 처리하여야 한다.
		ex) {"empno":7780,"ename":"홍길동","sal":7000}
3. responseText로 받은 데이터는 문자열형 json데이터이기에
	객체로 사용할려면 eval('('+xhr+')') 함수를 이용하여야 한다.
	             **JSON.parse(xhr) 객체 함수 이용.
	네트워크로 전달되어 온 데이터는 문자열형이기에 객체로 변환하여 사용할 수 있다.
	-- eval('('+xhr+')') 함수, JSON.parse(xhr)
	
cf) json객체로 서버에서 전달해오면, html화면을 구현된 내용을 처리하는 것보다
복잡하고, 유효성 check를 하여야 하는 단점은 있지만, 서버에서 오는 데이터을 대한
부담을 줄여, 보다 빠르고 효율적으로 처리할 수 있는 장점을 가지고 있다.

--%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("json데이터 Ajax로딩").click(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("get","z05_data.txt",true);
			xhr.onreadystatechange=function(){
				if(xhr.readyState == 4 && xhr.status==200){
					// 1. json문자열 객체로 변경..
					var p01 = eval('('+xhr.responseText+')');
					console.log(p01);
					$("td").eq(0).text(p01.name);
					$("td").eq(1).text(p01.age);
					$("td").eq(2).text(p01.loc);
				}
			};
			xhr.send();
		});
	});
	// ex) z06_data.txt에 구매 정보([])를 선언후, a06_buyList.jsp로 구매정보를 테이블에 리스트 처리하세요.
	///     5조 제출, 전체(손들기)
</script>
</head>
<body>
	<h2 align="center"></h2>
	<table  align="center" class="listTable">
		<tr><th>이름</th><th>나이</th><th>사는 곳</th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>