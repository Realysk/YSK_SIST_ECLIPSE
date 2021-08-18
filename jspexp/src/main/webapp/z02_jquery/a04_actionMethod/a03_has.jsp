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
# has("선택자") 
1. 해당 객체의 선택자가 있으면 처리하는 기능 메서드.
# slice(시작, 마지막)
1. 특정한 요소객체의 시작과 마지막 부분을 선택해준다.
2. event.target : 이벤트가 일어난 대상 객체..
   .is("선택자") : 위 이벤트의 대상객체가 선택자에 해당하는 여부를 boolean값을 가져온다.
# find("선택자")
1. 하위 요소객체를 찾아서 해당 요소객체에 대한 메서드를 처리한다.   
# children("선택자")
1. 바로 및 하위 계층구조의 요소객체를 찾아서 선택처리하는 것을 말한다.
	ex) 부모자식관계에서 자식만 찾아서 처리..   
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("여러가지 기능메서드(클릭)").click(function(){
			// 아이디가 ul01이고 바로 하위자식에 ul을 포함하고 있으면 배경색상을 pink 로 처리
			$("#ul01>li").has("ul").css("background","pink");
			$("#ul02>li").slice(2,4).css("background","purple");
		});
		$("#ul02").click(function(event){ // 이벤트에 일어난 내용..
			console.log(event.target);
			$(event.target).css("background",'orange');
		}); 
		$("h3").text("h3 객체!!");
		$("#addBtn").click(function(){
			$("div").html($("div").html()+"<h4> 추가됩니다!!</h4>");
		});
		// ex) event.target을 활용하여  div의 클릭하여 하위에 여러개의 h3를 만들어 클릭시, 배경색상으로 노랑색으로 출력처리하세요 
		//     2조  전체(손들기)
		$("#div02").click(function(event){
			// 현재 화면에는 없지만, 앞으로 만들어진 객체에 대한 이벤트처리는 상위객체를 기준으로 이벤트를 선언하고,
			// event.target을 통해서 이벤트가 일어나는 대상객체를 지정하고,
			// .is("h3")를 통해서 하위객체를 선택자를 지정...
			if($(event.target).is("h3")) $(event.target).css("background","yellow").text("클릭1!!");
			if($(event.target).is("h4")) $(event.target).css("background","pink").text("클릭2!!");
		});
		// ex1) 버튼을 만들고, 추가를 클릭했을 때, #div01에 h4로 컴퓨터 부품이 추가되게 하고, 해당 컴퓨터부분을 클릭시,
		//      배경색상과 글자색상이 변경되게 하세요.. 3조  전체(손들기)
		var parts = ["CPU","RAM","HDD","그래픽카드"];
		$("#addPartBtn").click(function(){
			// $("선택자").append("추가 객체|html태그") : 기존에 있는 태그나 요소객체의 내용에서 더 추가되는 내용을 처리..
			var rIdx = Math.floor(Math.random()*parts.length);
			$("#div01").append("<h4>"+parts[rIdx]+"</h4>");
		});
		$("#div01").click(function(event){
			if($(event.target).is("h4")) $(event.target).css({"color":"yellow","background":"navy"});
		});
		$("#findBtn").click(function(){
			$("#div03").append("<p>안녕하세요!</p>");
			$("#div03").find("p").css("border","1px solid blue");
			$("#div03").find("span").css("color","green");
			$("#div03").children("span").css("background","pink");
			
		});
		// ex) # 3X3 table을 만들고, 테이블을 클릭시, find를 활용하여 td의 배경색상을 노랑색으로 처리하세요..
		//      4조,  전체(손들기)
		$("td").text(function(idx){ return idx+1;});
		$("table").click(function(event){
			$(this).find("td").css("background","yellow");
			//$(this).find("td.center").css("background","yellow");
			//$(event.target).css("color","blue");
		});		
	});
</script>
<body>
	<h2></h2>
	<table width="50%" height="50%" border>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td class="center"></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>
	
	
	<input type="button" value="find기능처리" id="findBtn"/>
	<div id="div03">
		<span>홍길동</span>
		div...
		<p>p.....
			<span>마길동</span>
			<span>오길동</span>
		</p>
		<span>김길동</span>
	</div>
	
	
	<input type="button" value="컴퓨터부품추가" id="addPartBtn"/>
	<div id="div01">
	</div>	
	<input type="button" value="추가" id="addBtn"/>
	<div id="div02">
		<h3></h3>
		<h3></h3>
		<h3></h3>
		<h3></h3>
		<h3></h3>
	</div>
	<ul id="ul02">
		<li>아이템1</li>
		<li>아이템2</li>	
		<li>아이템3</li>	
		<li>아이템4</li>	
		<li>아이템5</li>
	</ul>		
	<ul id="ul01">
		<li>아이템1</li>
		<li>아이템2</li>
		<li>아이템3
			<ul>
				<li>아이템3-1 </li>
				<li>아이템3-2 </li>
				<li>아이템3-3 </li>
			</ul>
		</li>
		<li>아이템4</li>
		<li>아이템5</li>
	</ul>
	
	
	
</body>
</html>