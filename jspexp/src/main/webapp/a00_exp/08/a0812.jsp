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
# 정리문제
1. form객체의 요청값 submit 버튼 전송처리할 때, js로 submit처리하는 방식의 장점을 기본코드와 함께 기술하세요.
	<form><input type="submit"/> : 요청값을 바로 전송하여 처리한다.
	<form><input type="button" id="funBtn"/>
	$("#funBtn").click(function(){ : 
		요청값을 js로 전송하기 전에 
		1) 유효성 check
		2) hidden을 활용하여 조건에 따라 특정요청값을 변경처리..
		3) $("form").attr("action","호출할 controller/페이지") : 
			조건에 따라 다른 controller단이나 페이지를 요청할 수 있다.
		$("form").submit();
	});
2. form하위 객체의 checkbox와 radio의 요청값 전송시의 차이점을 기본코드로 기술하세요.
	type="radio"인 경우 name 속성이 같으면 단일 선택으로 요청값도 단일로 전송 ?key=value
	ex) 성별 :<input type="radio" name="gender" value="남자"/>남자
			 <input type="radio" name="gender" value="여자"/>여자
	type="checkbox"인 경우 name 속성이 같으면 다중 선택으로 요청값이 checked가 된 것은 다중으로 전송
		?key=value1&key=value2....
	ex) 취미 :<input type="checkbox" name="hobby" value="낚시" checked/>낚시	
			 <input type="checkbox" name="hobby" value="등산"/>등산	
			 <input type="checkbox" name="hobby" value="음악감상" checked/>음악감상
3. type=hidden을 사용하는 경우를 기술하세요.
	화면에 요청값으로 보이지 않게 처리하면서, 전송되어야 할 값을 주로 사용된다.
	처리프로세스에 있어서, 등록, 수정, 삭제 등 버튼으로 처리프로세스가 있는 경우 활용을 많이 한다.

4. 아래와 상품 등록을 처리하세요.
    상품명:[    ] 구분 :()도매()소매 배송지 :[]서울[]경기[]강원[]충청[]전라[]경상[]제주
    [배송]
5. 아래와 같이 list된 장바구니 제품 중에 []로 선택하여, 아래 기능에 의해 출력되게 하세요.
    [] 물건명    
    [] @@@
    [] @@@
    [] @@@
   [선택][제거] ==> 선택시 요청값으로 선택 물건만, 제거시 제거된 값 이외 물건만 출력하세요.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("정리문제");
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>상품명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구분</th>
		<td>
			<input type="radio" name="divSell" value="도매" checked/>도매
			<input type="radio" name="divSell" value="소매" />소매
		</td></tr>
		<tr><th>배송지</th>
		<td>
			<input type="checkbox" name="loc" value="서울" />서울
			<input type="checkbox" name="loc" value="경기" />경기
			<input type="checkbox" name="loc" value="강원" />강원
			<input type="checkbox" name="loc" value="충청" />충청
			<input type="checkbox" name="loc" value="경상" />경상
			<input type="checkbox" name="loc" value="전라" />전라
			<input type="checkbox" name="loc" value="제주" />제주
		</td></tr>		
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="배송"/></td></tr>
	</table>	
	</form>
	<%
	String pname = request.getParameter("pname");
	String divSell = request.getParameter("divSell");
	String locs[] = request.getParameterValues("loc");
	if(pname!=null){
	%>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><%=pname%></td></tr>
		<tr><th>구분</th><td><%=divSell%></td></tr>
		<%for(int idx=0;idx<locs.length;idx++){ %>
		<tr><th>배송지[<%=idx+1%>]</th><td><%=locs[idx]%></td></tr>
		<%}%>
	</table>	
	<%
	} 
	%>
	
</body>
</html>