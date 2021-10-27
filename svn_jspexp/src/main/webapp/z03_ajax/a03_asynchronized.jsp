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
		$("h2").text("비동기처리방식").click(function(){
			//1. 객체 생성.
			var xhr = new XMLHttpRequest();
			xhr.open("get","z03_data.txt",true); // 동기방식으로 처리..
			//2. 요청값 및 자원호출 처리..
			xhr.send();
			//3. 이벤트 핸들러 정의(서버에 상태값이 변경되는 이벤트가 발생시..)
			xhr.onreadystatechange=function(){
				console.log("서버와 상태값 변경 코드:"+xhr.readyState);
				console.log("서버와 결과 변경 http코드:"+xhr.status);
				// xhr.readyState : 비동기 통신을 하면서 객체를 만들어지는 상태값 가져온다.
				// 0 : 객체 만듦, 1/2 : 데이터를 만들 준비, 3 : 데이터를 일부 받기 시작
				// 4 : 서버에 온 데이터를 완전히 받을 때,
				// xhr.status : 서버에 요청한 결과값을 받는 코드 (http 결과코드)
				// 200~299 :정상처리 일반적으로 200으로 사용한다.
				// 전송이 다되고, 결과 코드도 200일때, 결과값 받기 처리.
				if(xhr.readyState==4 && xhr.status==200){
					$("h3").text(xhr.responseText);
				}
			}
		});
	});
	// a04_aynchExp.jsp   z04.data.txt
	//	 사원정보 클릭  ==>    tr안에 사원명, 급여, 부서명
	//   을 비동기로 가져오세요..(테이블안에 추가) 4조  전체(손들기)
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>

	
</body>
</html>