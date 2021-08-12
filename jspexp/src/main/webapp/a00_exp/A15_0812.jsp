<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%

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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("0812 정리문제");
	});

</script>
<%-- 
# 정리문제
	1. form 객체의 요청값 submit 버튼 전송처리할 때, js로 submit 처리하는 방식의 장점을 기본코드와 함께 기술하세요.
	
		$("[type=button]").click(function() {
			if($(this).val()=="value값") $("[name=name값]").val(숫자or인덱스);
			$("form").submit();
		});
		
		- JQuery로 처리하면 일괄적으로 한꺼번에 처리가 가능하다.	
	
	2. form 하위 객체의 checkbox와 radio의 요청값 전송시의 차이점을 기본코드로 기술하세요.
	
		type이 서로 다르다.
		이외에 나머지 요청 값 전송이나 코딩방식은 전부 비슷하다.
	
	3. type=hidden을 사용하는 경우를 기술하세요.
	
		숨겨진 입력 필드는 폼 제출 시 사용자가 변경해서는 안되는 데이터를 함께 보낼 때 유용하게 사용된다.
	
	4. 아래와 상품 등록을 처리하세요.
	    상품명:[    ] 구분 :()도매()소매 배송지 :[]서울[]경기[]강원[]충청[]전라[]제주
	    [배송]
	
		--%>
			<form id="frm01" method="post">
			<table align="center" style="text-align:center" class="listTable">
				<tr><th>상품명</th><td><input type="text" name="pname" value=""/></td></tr>
				<tr><th>구분</th>
					<td>
						<input type="radio" name="type" value="도매"/>도매
						<input type="radio" name="type" value="소매"/>소매
					</td>
				</tr>
				<tr><th>배송지</th>
					<td>
						<input type="checkbox" name="loc" value="서울"/>서울
						<input type="checkbox" name="loc" value="경기"/>경기
						<input type="checkbox" name="loc" value="강원"/>강원
						<input type="checkbox" name="loc" value="충청"/>충청
						<input type="checkbox" name="loc" value="전라"/>전라
						<input type="checkbox" name="loc" value="제주"/>제주
					</td>
				</tr>
				<tr><td colspan="3"><input type="submit" value="배송"/></td></tr>
			</table>	
			</form>
			<%
				String pname = request.getParameter("pname");
				String type[] = request.getParameterValues("type");
				String loc[] = request.getParameterValues("loc");
			%>
			<% if(pname!=null) { %>
			<table align="center" class="listTable">
				<tr><th>상품명</th><td><%=pname %></td></tr>
				<% for(int idx=0; idx<type.length; idx++) { %>
				<tr><th>구분</th><td><%=type[idx] %></td></tr>
				<% } %>
				<% for(int idx=0; idx<loc.length; idx++) { %>
				<tr><th>배송지 <%=idx+1 %></th><td><%=loc[idx] %></td></tr>
				<% } %>
			</table>
			<% } %>	
		<%--
	
	5. 아래와 같이 list된 장바구니 제품 중에 []로 선택하여, 아래 기능에 의해 출력되게 하세요.
	    [] 물건명
	    [] @@@
	    [] @@@
	    [] @@@
	   [선택][제거] ==> 선택시 요청값으로 선택 물건만, 제거시 제거된 값 이외 물건만 출력하세요. 
	   
		--%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("[type=button]").click(function() {
					if($(this).val()=="선택") $("[name=proc]").val("select");
					if($(this).val()=="제거") $("[name=proc]").val("delete");
					$("form").submit();
				});			
			});
		
		</script>
		<form id="frm01" method="post">
			<input type="hidden" name="proc"/>
		<table align="center" style="text-align:center" class="listTable">
			<tr><th>물건리스트</th>
				<td>
					<input type="checkbox" name="prod" value="사과"/>사과
					<input type="checkbox" name="prod" value="딸기"/>딸기
					<input type="checkbox" name="prod" value="바나나"/>바나나
					<input type="checkbox" name="prod" value="오렌지"/>오렌지
				</td>
			</tr>
			<tr><td colspan="2">
					<input type="button" value="선택"/>
					<input type="button" value="제거"/>
				</td>
			</tr>
		</table>
		</form>
		<%
			String proc = request.getParameter("proc");
			String prodIdxS = request.getParameter("prod");
			String[] prod = {"사과", "딸기", "바나나", "오렌지"};
			List<String> plist = new ArrayList<String>();
			Arrays.asList(prod);
			
			if(proc != null) {

		%>
			<table align="center" class="listTable">
				<tr><th>물건 리스트 조회</th><td><%=proc %></td></tr>
				<% for(int idx=0; idx<prod.length; idx++) { %>
				<tr><th>선택한 상품 <%=idx+1 %></th><td><%=prod[idx] %></td></tr>
				<% } %>
				<% for(int idx=0; idx<prod.length; idx++) { %>
				<tr><th>제거 후 상품 <%=idx+1 %></th><td><%=prod[idx] %></td></tr>
				<% } %>	
			</table>
		<% } %>

		<%--
	   
--%>
<%

%>
<body>

	<h2 align="center"></h2>

</body>
</html>