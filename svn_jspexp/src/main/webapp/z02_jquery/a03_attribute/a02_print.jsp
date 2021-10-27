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
# jquery의 출력과 value
1. .html() : html로 랜더링할 내용과 html코드를 가져온다.
2. .text() : 글자 그대로 html코드 그대로 가져온다.
3. .val() : 속성의 value값 처리 및 가져올 때 사용한다.
# callback함수형태
$("선택자").기능메서드(function(idx){ return "설정할값"}); 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("출력처리 관련 속성");
		$("div").eq(0).text("<h2>안녕하세요</h2>");//저장
		$("div").eq(1).html("<h2>안녕하세요</h2>");//저장
		$("div").eq(2).text( $("form").html() );//호출
		$("div").eq(3).css("border","1px solid blue").text(
				$("form").text() ); 
			// form안에는 문자열로 의미있는 내용을 추출하여 가져온다. 태그에 포함된 내용을 삭제된다.
		$("[name=ename]").val("홍길동");
		$("h2").text("저장된 값 가져오기:"+$("[name=ename]").val());
		$("input").val("데이터1");
		$("input").eq(1).val("^^");
		$("h3").text(function(idx){
			return idx+" 안녕하세요!";
		});
		$("div").html(function(idx){
			return "<h"+(idx+1)+">반갑습니다!!</h"+(idx+1)+">";
		});
/*
$("다중의요소").html(function(idx){ return """}); 
$("다중의요소").css("속성",function(idx){ return """}); 
 
 
 */		
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<h3></h3>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>
	<input type="text"/>
	<div></div>
	<div></div>	
	<div></div>	
	<div></div>	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th>
			<td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
		<input type="submit" value="검색"/></td></tr>
	</table>	
	</form>

		
	
</body>
</html>