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
# 요소객체의 속성설정..
1. 태그의 기본 속성에 대한 속성값 설정 방식을 아래와 같다.
	<img src="img01.jpg" alt="고양이이미지" width="100px" height="100px"
	img :태그, src/alt/width/height : 속성
		cf) var img01 = document.querySelector("img");
			img01.속성 = 속성값;
	
	
	1) $("선택자").attr("속성","속성값");
	2) $("선택자").attr({속성:속성값,속성:속성값....});
	3) $("선택자").attr("속성",function(index){ return "속성값"});
		==> 선택자가 다중의 요소객체로 속성을 할당하고 처리할 때, *콜백함수를 사용한다.
		cf) jquery에서는 여러 개의 선택자를 한번에 동일한 속성으로 설정하는 것은 반복문을 활용하지
			않아도 된다.  $("h2, h3, h6").attr("align","center");
			다수의 h2에 대한 정렬 속성을 중앙으로 처리..
	4) $("선택자").attr({속성1:function(idx){ return "속성값"}},
					   {속성2:function(idx){ return "속성값"} }...)
					   		
2. css 속성 설정.
	1) $("선택자").css("속성","속성값");		
	2) $("선택자").css({"속성":"속성값","속성":"속성값");		
	3) $("선택자").css("속성",function(idx){ return "속성값"});	
	4) $("선택자").css({속성1:function(idx){ return "속성값"}},
					   {속성2:function(idx){ return "속성값"} }...)		
ex) table 3X3 테이블을 만들고, 각 td의 글자 색상을 빨/주/노/초/파/남/보/빨/주 
	로 설정하세요.. 2,3조 전체(손들기)	     td{color:red;}
--%>
<%

%>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var aligns = ["left","center","right"];
		var idx=0;
		$("h2").click(function(){
			// idx++%3 : 0, 1, 2, 0, 1, 2....
			$(this).attr("align",aligns[idx++%3]);
		});
		// ex)  애완동물 이미지 3개 다운받으셔서, 이미지변경 클릭시, 아래 img
		//     이미지가 돌아가면서 변경되게 하세요.. 2조(제출), 전체(손들기)
		var imgs = ["img01","img02","img03"];
		var idxImg= 0;
		$("h3").click(function(){
			$("img").attr("src","<%=path%>/z01_img/"+imgs[idxImg++%3]+".PNG");
		});
		
	});
</script>
	<h2 align="center">클릭 클릭!!</h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<h3 align="center">이미지변경</h3>
	<table  align="center" class="listTable">
		<tr><td><img src="" width="200pt" heigth="200pt"/></td></tr>
	</table>	
	<h4 align="center">여러 이미지 설정</h4>
	<table  align="center" class="listTable">
		<tr><td>
			<img class="imgCls" src="" width="200pt" heigth="200pt"/>
			<img class="imgCls" src="" width="200pt" heigth="200pt"/>
			<img class="imgCls" src="" width="200pt" heigth="200pt"/>
			</td>
		</tr>
	</table>	
	<h5 align="center">왼쪽</h5>
	<h5 align="center">중앙</h5>
	<h5 align="center">오른쪽</h5>
	<script type="text/javascript">
		var imgs = ["img01","img02","img03"];
		$("h4").click(function(){
			// $("배열선택자").attr("속성"function(idx){
			//     	idx:배열의 index값, return "해당단위객체의 속성값 선언"
			//})
			$(".imgCls").attr("src",function(idx){
				console.log(idx);
				return "<%=path%>/z01_img/"+imgs[idx]+".PNG";
			});
		});
		// ex) h5를 3개를 만들고 정렬을 왼쪽 중앙 오른쪽을 위 콜백함수(위 return함수)를 활용하여
		//     출력하세요..  2조 전체(손들기)
		var aligns = ["left","center","right"];
		$("h5").attr("align",function(idx){
			return aligns[idx];
		})
		
	</script>	
	<style>td{text-align:center;}</style>
	<table id="tab01" width="50%" height="300px" align="center" 
		class="listTable">
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>		
	<script type="text/javascript">
		var colors=["red","orange","yellow","green",
			"blue","navy","purple","red","orange"];
		$("#tab01 td").css("color",function(idx){
			$(this).text(idx+1); // 번호 처리
			$(this).css("background","pink"); // 배경색상처리..
			return colors[idx];
		});
	</script>
</body>
</html>