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
ex1) h3를 5개 복사하여 만들고, 배열로 선언한 5개 과일명을 출력하세요..
	4조 전체(손들기)
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("콜백함수 연습");
		var fruits = ["사과","바나나","딸기","오렌지","수박"];
		var colors = ["red","yellow","red","orange","green"];
		$("h3").text(function(idx){
			//$(this) : 각각의 h3 요소객체..
			$(this).css("background-color",colors[idx]);
			return idx+1+") "+fruits[idx];
		});
		var tcolors=["red","blue","yellow"];
		$("td").text(function(idx){
			var bkRan = Math.floor(Math.random()*3);
			var coRan = Math.floor(Math.random()*3);
			$(this).css("background",tcolors[bkRan]);
			$(this).css("color",tcolors[coRan]);
			return (idx+1)*4;
		});
	});
// ex) 테이블 4X4를 만들고, 4의 배수로 각 td의 글자를 표현하고,
// 		배경색상과 글자색상을  red, blue, yellow 중에 임의로 출력되게 하세요.
//      초기에 text()를 기준으로 callback함수를 만들어 주세요. 5조  전체(손들기)
//     hint)
</script>
<style>td{font-size:25pt;text-align:center;}</style>
<body>
	<table  align="center" width="400px" height="400px" class="listTable">
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
	</table>	
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	
</body>
</html>