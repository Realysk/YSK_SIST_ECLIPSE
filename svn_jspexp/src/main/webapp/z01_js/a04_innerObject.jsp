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
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("내장 객체");
		var num01 = 275;
		var num02 = new Number(275);
		console.log(typeof(num01));
		console.log(typeof(num02));
		// toFixed(소숫점자리수) : 객체에서 지원하는 기능메서드가 일반 number에서도
		// 사용이 가능하다.
		var num03 = 275.243222;
		console.log("소숫점 한자리수:"+num03.toFixed(1));
		console.log("소숫점 세자리수:"+num03.toFixed(3));
		// ex) 타율계산 처리
		$("[type=button]").click(function(){
			var base = $("[name=base]").val(); // 타석의 값을 가져오기
			var hitPt = $("[name=hitPt]").val(); // 안타의 값을 가져오기
			// 타율을 처리하여 h3에 출력하되 소숫점 3자리로 표현하세요.. 
			console.log("타석:"+base);
			console.log("안타:"+hitPt);
			console.log("타율:"+(hitPt/base));
			console.log("타율(자리수처리)):"+(hitPt/base).toFixed(3));
			$("h3").text("타율:"+(hitPt/base).toFixed(3)); // .text() jquery에서 화면 출력 cf) .html() 태그 랜더링 처리.. 2조
			/*
			.innerHTML ==> html코드를 랜더링하여 출력  <h2>안녕 ==> 글자를 크게 처리.. 
				==>  jquery에서 .html()가져오거나 .html("할당할 데이터")
			.innerText ==> 데이터를 그대로 출력   <h2>안녕 ==> <h2>안녕 글자 그대로 출력..
				==>  jquery에서 .text()가져오거나, .text("할당 데이터")
			
			*/
		});
	});
</script>
</head>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>타석</th><td><input type="text" name="base" value="0"/></td></tr>
		<tr><th>안타</th><td><input type="text" name="hitPt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" value="타율계산"/></td></tr>
	</table>	
	</form>
<%-- 
# 내장 객체와 기능 메서드..
1. Number
	숫자형 데이터를 생성 처리하는 객체.
	일반적으로 하위에 여러가지 변환 메서드를 통해서 데이터를 처리해준다.
	java의 wrapper(Integer, Double)개념을 unboxing, boxing 개념을 자동으로 처리하여 사용될 수 있다.
	즉, 숫자데이터.기능메서드() 처리가 가능하다. 
--%>
<%

%>
	
</body>
</html>