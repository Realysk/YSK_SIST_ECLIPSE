<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 

--%>
<%
	
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>
 <%-- 
 요청값의 처리..
 1. ${param.요청키}
 2. ${paramValues.요청키}
 	?name=홍길동&name=김길동  등 하나의 key를 중복적으로 활용할 때, 사용된다.
 	 ex) 입력form에서 type="checkbox"일 때나 동일한 이름으로 다중의 값을 받을 때 사용된다.
 	 type="checkbox" 는 checked가 된 데이터만 배열로 가져올 수 있다.
 --%>
     
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<h3 align="center">요청값에 대한 처리:${param.name}</h3> 	
	<h3 align="center">물건명:${param.name}</h3> 	 	
	<h3 align="center">물건가격:${param.price}</h3> 	 	
	<h3 align="center">물건갯수:${param.cnt}</h3>
	<h3 align="center">총계:${param.price*param.cnt}</h3><%-- 형변환 없이도 데이터를 처리해준다. --%>
<%--
# el을 활요하여
1. 사칙연산자, 비교연산자, 논리 연산자를 활용할 수 있다.
	ex) el의 요청값 처리를 활용하여 회원 id, pass, name, auth를 받아서 출력되게 하세요..
		id와 pass는 himan/7777일 때, 인증/미인증 처리되게 하세요.. 1조 전체/손들기


 --%>	  	 	
</body>
</html>