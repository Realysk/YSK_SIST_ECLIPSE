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
# filter callback함수..
1. 형식
	$("선택자").filter(function(index, 단위객체){
		return 조건boolean;
	}).속성메서드(속성,속성값);
	
	$("선택자").not("선택자");
	$("선택자").not(function(index, 단위객체){
		return 조건boolean;
	});
	해당 선택자의 반대되는 경우를 filter하여 선택처리한다.	
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("filter 함수처리");
		$("li").not(":even").css("color","blue");
		$("li").not(function(index, element){
			return index%3==2;
		}).css("color","orange");
		
		
		$("li").filter(function(index, element){
			// 기본 배경 색상 처리. element :단위 객체
			$(element).css("background-color","pink");
			return index%3==2;
		}).css("background-color","green");
		$("span").filter(function(idx, el){
			$(el).text(idx+1);
			$(el).css("background-color","yellow");
			return idx%3==2
		}).css("background-color","red").text("꽝!");
	});
</script>
<style>span{width:5%;border:1px solid blue;}</style>
<body>
	<h2></h2>
	<ul>
		<%for(int cnt=1;cnt<=10;cnt++){ %>
		<li>아이템_<%=cnt %></li>
		<%} %>
	</ul>
	<%--ex) span을 활용하여 1~20까지 출력(기본배경색상 노랑색)하되 
		3단위마다 꽝!이라는 표시와 함께 배경색상을 빨강색으로 처리하세요  3조, 손들기(전체)
	 --%>
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
	<span></span> 
</body>
</html>