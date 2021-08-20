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
	div{
		background:red;border:1px solid blue;
		width:70px;height:70px;margin:0 3px;float:left; 
	}
	.toggleCls{width:40px;background-color:blue;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 
# 정리문제
1. [js] 위치기반 선택자 중, :even과 :nth-child(even) 차이점을 기술하세요
	$("td:even") : 모든 td의 짝수번째 내용을 선택
	$("td:nth-child(even)") : td의 상위인 tr기준으로 td가 짝수번째인 것..
	$("td:eq(0)")	: 화면에서 첫번째 td
	$("td:nth-child(0)"); 모든 tr하위의 첫번째 td
2. 위치기반 선택자를 활용하여 테이블의 배경색상을 행단위 짝/홀로 변경하여 출력하세요.
	$("tr:even").css("background-color","yellow");
	$("tr:odd").css("background-color","pink");
3. 4*4테이블을 1~16로 출력하여 만들고, 이 중 폭탄이 들어간 CELL 1개를 만들어 클릭시, 꽝
    이라는 문자열을 출력하고 문자열색상은 빨강색, 배경색상은 노랑색으로 처리하세요.
4. 클래스적용에 대한 기능 메서드를 기술하세요.
	$("선택자").addClass("css선언한 클래스명") : 해당 css선언한 클래스명으로 적용.
	$("선택자").removeClass("클래스") : 적용된 클래스 삭제
	$("선택자").toggleClass("클래스") : 이벤트에 의해 해당 클래스가 적용/미적용을 반복처리.
	 

5. 10개의 div가 오른쪽으로 리스트된 화면에서 짝수 div인 것만 sliding되게 처리하고, 버튼을 클릭시 마다
    배경색상과 폭이 변경되게 처리하세요.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		//$("td").text("테스트")
		//$("tr:even").css("background-color","yellow");
		//$("tr:odd").css("background-color","pink");
		for(var idx=0;idx<16;idx++){
			$("td").eq(idx).css("text-align","center");
			$("td").eq(idx).text(idx+1);
		}
		var rIdx = Math.floor(Math.random()*16);
		$("td").eq(rIdx).click(function(){
			// $(this) :현재 클릭한 객체..
			// $("td").eq(rIdx)
			$(this).css({"color":"red","background-color":"yellow", 
				"font-size":"30pt"});
			$(this).text("꽝");

		});
		$("#chBtn").click(function(){
			// :animated : 기능메서드 slideToggle에 의해 처리되고 있을 때...
			$(":animated").toggleClass("toggleCls");
		});		
		function animate01(){
			// 재귀적으로 함수에서 함수를 호출..
			$("div:odd").slideToggle("slow", animate01);
		}
		animate01(); // 정의된 기능함수를 호출..
	});
</script>
<%--
5. 10개의 div가 오른쪽으로 리스트된 화면에서 짝수 div인 것만 sliding되게 처리하고, 버튼을 클릭시 마다
    배경색상과 폭이 변경되게 처리하세요.
--%>
<body>
	<input type="button" id="chBtn" value="클릭!!"/>
	<%for(int cnt=1;cnt<=10;cnt++){%>
		<div><%=cnt%></div>
	<%}%>
	<h2 align="center"></h2>
	<table width="80%" height="400px" border align="center" class="listTable">
		<col width="25%"><col width="25%"><col width="25%"><col width="25%">
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>