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
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
	});

</script>
</head>
<%-- 
# 요청 값 처리 메서드
	1. get/post 방식에 의해 전달해 온 요청 값을 처리하는 메서드들
	
	2. 요청 값 형식
		페이지?key1=value1&key2=value2&key3=value3
	
	3. 지원 메서드
		1) request.getParameter("요청key");
			String value1 = request.getParameter("key1");
			System.out.println("요청 값 : " + value1);
		2) String reqs[] = request.getParameterValues("동일한이름요청key");
			페이지?buyProd=사과&buyProd=바나나&buyProd=딸기
			String prods[] = request.getParameterValues("buyProd");
			for(String prod:prods) {
				System.out.println(prod);
			}
		3) form 요소객체의 특성에 따른 요청 값 전달.
			<input type="text" name="요청이름1/>
			<input type="text" name="요청이름1/>
			<input type="text" name="요청이름1/>
			# input type="text"인 경우는 name의 설정값이 1개일 때는 request.getParameter("단일요청");
			# input type="text"인 경우는 name의 설정값이 다중일 때는 request.getParameter("다중요청");
			
			<input type="radio" name="요청이름1" value="값1"/>
			<input type="radio" name="요청이름1" value="값2"/>
			<input type="radio" name="요청이름1" value="값3"/>
			# input type="radio"는 같은 name값으로는 checked가 한 개만 선택되어지기 때문에 여러 객체가 radio로 나열되어 있어 요청 값은 하나만 처리된다. 그러므로 request.getParameter("단일요청")을 활용한다.
			
			<input type="checkbox" name="요청이름1" value="값1"/>
			<input type="checkbox" name="요청이름1" value="값2"/>
			<input type="checkbox" name="요청이름1" value="값3"/>
			# input type="checkbox" 동일한 요청 이름으로 여러 개의 데이터를 전송할 수 있는데 ***checked가 된 것만 요청 값의 배열로 전송이 된다. String[] cks = request.getParameterValues("다중요청");
			
			<input type="hidden" name="proc"/>
			# 요청 값으로 화면에는 보이지 않게 해야 하나, JS로 요청 값을 전송할 때 반드시 처리할 내용은 type="hidden"으로 하고 JS/JQuery에 의해 처리된다.
			
			cf) form 데이터 전송 관련 JS/JQuery 처리 부분
				1) <input type="submit"/> : 해당 버튼을 클릭 시, form 하위 요소객체의 데이터를 전송해준다.
				2) 전송 전 유효성 check를 하기 위한 데이터 처리
					<input type="submit"/> => <input type="button" id="funBtn"/>
					$("#funBtn").click(function() {
						if($("[name=요청키]").val()=="") { // 공백에 대한 유효성 체크
							return; // 전송 프로세스 중단
						}
						if($("[name=요청키]").val().length>8) { // 입력 할 데이터의 크기 유효성 체크
							return; // 전송 프로세스 중단
						}
						// hidden 데이터 처리
						$("[name=proc]").val("수정");
						// form의 조건에 따른 요청 controller/jsp 페이지 처리
						if($($("[name=proc]").val()=="수정") {
							$("form").attr("action", "<%=path%>/calUpdate.do");
						}
						if($($("[name=proc]").val()=="삭제") {
							$("form").attr("action", "<%=path%>/calDelete.do");
						}
						$("form").submit();
					});
--%>
<%

%>
<body>

	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><input type="text" name="buyer" value=""/></td></tr>
		<tr><th>구매물건1</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건2</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>구매물건3</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>단일선택1</th><td><input type="radio" name="kind" value="신제품"/>신제품</td></tr>
		<tr><th>단일선택2</th><td><input type="radio" name="kind" value=중고/>중고</td></tr>
		<tr><th>단일선택3</th><td><input type="radio" name="kind" value="전시제품"/>전시제품</td></tr>
		<tr><th>다중선택1</th><td><input type="checkbox" name="calMsg" value="기본출력"/>계산서출력</td></tr>
		<tr><th>다중선택2</th><td><input type="checkbox" name="calMsg" value="메일"/>계산서메일발송</td></tr>
		<tr><th>다중선택3</th><td><input type="checkbox" name="calMsg" value="메시지"/>계산서메시지발송</td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	<%
		String buyer = request.getParameter("buyer");
		String kind = request.getParameter("kind");
		String pnames[] = request.getParameterValues("pname");
		String calMsgs[] = request.getParameterValues("calMsg");
	%>
	<% if(buyer!=null) { %>
	<table align="center" class="listTable">
		<tr><th>구매자명</th><td><%=buyer %></td></tr>
		<tr><th>물건구분</th><td><%=kind %></td></tr>
		<% for(int idx=0; idx<pnames.length; idx++) { %>
		<tr><th>구매물건 <%=idx+1 %></th><td><%=pnames[idx] %></td></tr>
		<% } %>
		<% for(int idx=0; idx<calMsgs.length; idx++) { %>
		<tr><th>계산서처리 <%=idx+1 %></th><td><%=calMsgs[idx] %></td></tr>
		<% } %>
	</table>
	<% } %>
	
</body>
</html>