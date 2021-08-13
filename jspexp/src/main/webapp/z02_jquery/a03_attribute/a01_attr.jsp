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
		3) $("선택자").attr("속성", function(index){return "속성값"});
			=> 선택자가 다중의 요소객체로 속성을 할당하고 처리할 때 콜백함수를 사용한다.
			
	2. CSS 속성 설정
		1) $("선택자").css("속성","속성값");
		2) $("선택자").css({"속성":"속성값"}, {"속성":"속성값"});
		3) $("선택자").css("속성", function(idx){return "속성값"});
		
	ex) 3X3 table을 만들고 각 td의 글자 색상을 빨/주/노/초/파/남/보/빨/주로 설정하세요.

--%>

<table align="center" class="listTable">
	<col width="33%"><col width="33%"><col width="33%">
	<tr><td>.</td><td>.</td><td>.</td></tr>
	<tr><td>.</td><td>.</td><td>.</td></tr>
	<tr><td>.</td><td>.</td><td>.</td></tr>
</table>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("td").css({"background-color":"red"},
					{"background-color":"orange"}, 
					{"background-color":"yellow"}, 
					{"background-color":"green"}, 
					{"background-color":"blue"}, 
					{"background-color":"navy"}, 
					{"background-color":"purple"}, 
					{"background-color":"red"}, 
					{"background-color":"orange"}
				);
	});	
</script>
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
		
		var imgs = ["img01", "img02", "img03"];
		var idxImg = 0;
		$("h3").click(function() {
			$("img").attr("src", "<%=path%>/a03_attribute/img/" + imgs[idxImg++%3] + ".PNG");
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
	<h4 align="center">여러 이미지 설정</h4>
	<table align="center" class="listTable">
		<tr><td>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
			<img class="imgCls" src="" width="200pt" height="200pt"/>
		</td></tr>
	</table>
	
	<h5 align="center">왼쪽</h5>
	<h5 align="center">중앙</h5>
	<h5 align="center">오른쪽</h5>
	
	<script type="text/javascript">

		var imgs = ["img01", "img02", "img03"];
		$("h4").click(function() {
			// $("배열선택자").attr("속성" function(idx) {
			//		idx:배열의 index값, return "해당단위객체의 속성값 선언"	
			//	});
			$(".imgCls").attr("src", function(idx) {
				console.log(idx);
				return "<%=path%>/z01_img/" + imgs[idx] + ".PNG";
			});
		});
		
		// ex) h5를 3개를 만들고 정렬을 왼쪽 중앙 오른쪽을 위 콜백함수(위 return함수)를 활용하여 출력하세요.
		
		var aligns = ["left", "center", "right"];
		$("h5").attr("align", function(idx) {
			return aligns[idx];
		});

	</script>
	
</body>
</html>