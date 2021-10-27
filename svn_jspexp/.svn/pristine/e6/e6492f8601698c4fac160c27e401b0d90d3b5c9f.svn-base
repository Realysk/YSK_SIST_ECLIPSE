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
		$("h2").text("시작");
		$("#regBtn").click(function(){
			var passVal = $("input[name=pass]").val();
			var passFrmVal = $("input[name=passFrm]").val();
			if(passVal!=passFrmVal){
				alert("패스워드와 패스워드확인이 같지 않습니다.\n 확인해주세요");
				// 유효성 check해서 더 이상 진행되지 못하게 한다.
				return;
			}
			$("#frm01").submit();
		});
	});
</script>
</head>
<%-- 
# 정리문제
1. jquery에서 CDN 방식 lib 로딩이란 무엇인가?
	Content delivery network 방식으로 서버에서 바로 주소값을 통해서 lib를 사용한다.
	따로, 현재 서버 안에 lib가 필요없지만, 인터넷이 되어 있어야 하는 단점도 포함하고 있다.
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
2. jquery의 계층 구조 선택자의 형식을 기본 예제를 통해서 기술하세요.
	계층 구조 : 요소객체가 상/하위, 형제로 구조화 되어 있는 것을 말한다.
	$("상위요소1 하위요소2") : 계층 레벨에 상관없이 상위요소를 가진 하위요소에 대한 선택을 할 때..
	 ex) $("table input[name=id]") : 테이블 구조 안에 td 안에 있는 input name="id"에 대한 선택..
	$("부모요소 > 자식요소") : 바로 위 부모 요소객체를 가진 자속요소에 대한 선택.
	 ex) $("ul.ch01 > li") : 바로 위 부로가 클래스명은 ch01인 ul 태그의 하위 li에 대한 선택..  
	 	<ul class="ch01">
	 		<li>
	 		<li>	 
	$("형제1 + 형제2") : 같은 부모를 가진 같은 level의 요소객체에서 형제1요소를 앞에 두 형제2요소 객체에 대한 선택.
		<tr>					$("td.cls01 + td") : class cls01로 된 td를 앞에 둔, 다음의 td(한개만)
			<td class="cls01"
			*<td>
			<td class="cls01">
			*<td> 
	$("형제1 ~ 형제2") : 같은 부로를 가진 같은 level의 요소객체 형제1을 앞에 둔 모든 형제2요소를 선택..(여러개)		 	

3. jquery 선택자를 활용해서 password와 password 확인 항목에 대한 일치여부 유효성 체크를 하세요.
4. [js] 전날한 생성자 class를 선언하고, 객체를 생성하는 형식을 활용하여, 장바구니에 담은 상품을 누적처리하세요.
    물건 매장
    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
5. [jsp]위 내용을 jsp로 요청값으로 넘기고, session에 누적처리하는 프로그램을 작성하고,
    [장바구니확인하러가기] 를 통해 현재 담기 session 객체를 리스트 확인하세요.

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><th>비밀번호 확인</th><td><input type="password" name="passFrm" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" id="regBtn" value="등록"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>