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
# 정리문제
1. [jquery]parent(), children()의 차이를 기본예제를 통해서 기술하세요.
	parent() : 대상 객체의 바로 위 부모 계층의 요소를 선택
	children() : 대상 객체가 포함하는 바로 하위 자식 계층의 요소를 선택..
2. [jquery]이벤트를 처리할 때, event.target는 어떤 용도로 쓰이며, .is("선택자")는 어떻게 활용되는가?
3. [jquery]아래와 같은 화면을 처리하세요.(위 event.target, find() 활용)
    물건명 [  ] 가격 [  ] [등록] ==> 등록시 아래에 추가가 되고
    번호 물건명 가격
    ##  ###  ## ==> 추가된 항목을 클릭시, 배경색상이 변경된다.           
    ##  ###  ##          
4. [jquery]계층 구조관련 기능 action 메서드를 기술하세요.
	children("선택자") : 자식객체
	parents("선택자") : 상위 계층 객체
	parent() : 부모객체
	next() : 형제 객체에서 현재 객체 다음 객체
	prev() : 형제 객체에서 현제 이전 객체
	siblings() : 형재요소객체들 전체 
5. [jquery]아래의 화면을 내용을 처리하세요.
    []서울[]대구[]부산[]광주 ==> check시, 바로옆레이블 배경색변경
6. [jsp]서버 404에러발생시, 예외 처리 페이지 지정 방식을 기술하세요.
		1) 예외발생시, 처리할 페이지 구현
		2) web.xml에 http 코드 에러 등록 및 페이지 등록..
		3) 해당 서버내에 에러내용 확인..
7. [jsp]session과 cookie의 가장 큰 차이점을 기술하세요.
	session은 서버와 클라이언트간 연결 정보에 대한 임시 데이터를 서버에 저장	
	cookie은 서버와 클라이언트간 연결 정보에 대한 임시 데이터를 브라우저에 저장	
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
	//1. [jquery]parent(), children()의 차이를 기본예제를 통해서 기술하세요.
	//	parent() : 대상 객체의 바로 위 부모 계층의 요소를 선택
	//	children() : 대상 객체가 포함하는 바로 하위 자식 계층의 요소를 선택..
		$("h2").text("연습예제(클릭)");
		$("#div01").click(function(){
			$(this).children("h3").css("font-size","10px");
			$(this).parent().css("height","150px");
		});		
	//2. [jquery]이벤트를 처리할 때, event.target는 어떤 용도로 쓰이며, .is("선택자")는 어떻게 활용되는가?
/*		$("대상객체").이벤트(function(event){
			// 익명이벤트핸들러
			// event : 이벤트 정보를 처리하는 객체..
			// event.target : 이벤트의 대상 객체를 지칭, 
			// event.keyCode : 키이벤트일 경우, 키코드를 가져온다.
			$(event.target).is("선택자") : 이벤트의 대상 선택자인지 여부를 가져온다..
				하위 계층의 각각의 대상 이벤트를 따로 선택자로 처리할 때, 활용된다. 
		})
  
 
 */			
	//3. [jquery]아래와 같은 화면을 처리하세요.(위 event.target, find() 활용)
	//    물건명 [  ] 가격 [  ] [등록] ==> 등록시 아래에 추가가 되고
	//    번호 물건명 가격
	//    ##  ###  ## ==> 추가된 항목을 클릭시, 배경색상이 변경된다.           
	//    ##  ###  ##          
	//4. [jquery]계층 구조관련 기능 action 메서드를 기술하세요.
	//5. [jquery]아래의 화면을 내용을 처리하세요.
	//    []서울[]대구[]부산[]광주 ==> check시, 바로옆레이블 배경색변경
		var cnt=1;
		$("#regBtn").click(function(){
			var name = $("[name=name]").val();
			var price = $("[name=price]").val();
			$("#listTab tbody").append("<tr><td>"+cnt+++"</td><td>"+name+"</td><td>"+price+"</td></tr>");
			$("[name=price]").val("");
			$("[name=name]").val("").focus();
		});	
		$("#listTab tbody").click(function(event){
			console.log(event.target);
			//console.log($(event.target).is("td"));
			// 1. 이벤트가 일어나는 하위 객체 확인..
			// 2. css 적용된 계층의 상위 부분 선택자 선택 : .parent() :tr
			// 3. 필요한 속성 적용..
			//if($(event.target).is("td")) $(event.target).parent().css("background","yellow");
			// 
			$(this).find( $(event.target) ).parent().css("background","yellow");
			//  $(this) : 이벤트가 처리되는 객체 .. - #listTab tbody
			//  find("대상객체") : 하위에 특정한 객체를 찾음..
			//  find( $(event.target) ) : 이벤트가 일어나는 대상 객체 td
			//  .parent() : 대상 객체 td의 부모객체 tr을 지칭.

			
		});
		//$("[name=loc]:checked").next().css("background","pink");
		// 해당 내용을 클릭시,
		$("[name=loc]").click(function(){
			console.log($("[name=loc]:checked").length);
			// css로 기본적인 설정을 default로 처리..(unchecked 되었을 때)
			$("[name=loc]").next().css("background","");
			// checked의 .next() : 다름 형제객체..
			$("[name=loc]:checked").next().css("background","pink");
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<p align="center">
		<input type="checkbox" name="loc" /><span>서울</span>
		<input type="checkbox" name="loc" /><span>대구</span>
		<input type="checkbox" name="loc" /><span>부산</span>
		<input type="checkbox" name="loc" /><span>광주</span>
	</p>
	
	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" id="regBtn" value="등록"/></td></tr>
	</table>	
	</form>
	<table id="listTab" align="center"  border>
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th></tr></thead>
		<tbody></tbody>
	</table>		
	
	<div style="background:pink;height:100px;">
		<div id="div01" style="border:1px solid blue;" >
			<h3  style="border:1px solid red;">안녕</h3>
		</div>
		
	</div>
	

	
</body>
</html>