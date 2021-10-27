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
# 계층구조관련 메서드
1. children("자식중선택자")
2. parents() : 상위계층 객체들.
   parent() : 바로 상위 부모객체
3. next() : 형제(같은 부모 요소객체를 둔 같은 level에 있는 요소객체)중에 다음 요소객체지정
4. prev() : 형제(같은 부모 요소객체를 둔 같은 level에 있는 요소객체)중에 앞선 요소객체지정
5. siblings() : 형제요소객체들 지정.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("계층 구조 요소객체들..(클릭)").click(function(){
			$("p").parent().css("font-size","30px");
			$("p").parent(".selected").css("background","yellow");
			// 배열.each(function(단위객체, index){}) :
			$("p").parents().each(function(el, idx){
				console.log(idx);
				console.log(el);
			});
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<div><p>홍길동</p></div>	
	<div class="selected"><p>이순신</p></div>	
	<div><p>홍길동</p></div>	
	<div><p>홍길동</p></div>	
	
</body>
</html>