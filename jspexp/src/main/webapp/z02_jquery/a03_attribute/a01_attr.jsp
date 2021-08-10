<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# 요소객체의 속성 설정
	1. 태그의 기본 속성에 대한 속성값 설정 방식은 아래와 같다.
		<img src="img01.jpg" alt="고양이이미지" width="100px" height="100px"
		img : 태그, src/alt/width/height : 속성
		1) $("선택자").attr("속성", "속성값");
		2) $("선택자").attr({속성:속성값, 속성:속성값....});
		3) $("선택자").attr("속성", function(){return "속성값"});
			=> 선택자가 다중의 요소객체로 속성을 할당하고 처리할 때 콜백함수를 사용한다.

--%>
<%

%>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		var aligns = ["left","center","right"];
		var idx = 0;
		$("h2").click(function() {
			// idx++%3 : 0, 1, 2, 0, 1, 2....
			$(this).attr("align",aligns[idx++%3]);
		});
		
		// ex) 애완동물 이미지 3개 다운로드 후 이미지변경 클릭 시 아래 img 이미지가 돌아가면서 변경되게 처리
		
		var imgs = ["chiwawa", "daebak1", "daebak2"];
		var idxImg = 0;
		$("h3").click(function() {
			$("img").attr("src", "<%=path%>/a03_attribute/img/" + imgs[idxImg++%3] + ".jpg");
		});
	});

</script>

	<h2 align="center">클릭</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<h3 align="center">이미지변경</h3>
	<table align="center" class="listTable">
		<tr><td><img src="img/chiwawa.jpg" width="200pt" height="200pt"/></td></tr>
	</table>	
	
</body>
</html>