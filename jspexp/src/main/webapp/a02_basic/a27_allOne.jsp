<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
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
<%-- <link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css"> --%>
<style>
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="한 화면에서 form과 요청 값";
	};

</script>
</head>
<body>

	<%--
		ex) '초기화면' 구구단 문제를 임의로 출력
			[ 4 ] X [ 5 ]	<input type="text" name="num01" value="4" readonly/>
			정답 입력 : [   ] [확인] => 다음 화면에 4 X 5 = 20 정답/오답 출력
			
			1) 초기화면과 요청 값을 받았을 때 화면을 구현한다.
			2) 요청 값을 받았을 때 처리를 조건 로직을 구별하여 화면을 구현 한다.
			3) 세부 사항
				1) 데이터 처리
					- 초기화면 데이터 처리
				2) 요청 값과 비교
	--%>
	<h3></h3>
	<%
		// 요청 값
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num02");
		String replyS = request.getParameter("reply");
		if(num01S == null) {
			int ranNum1 = (int)(Math.random() * 8 + 2);
			int ranNum2 = (int)(Math.random() * 9 + 1);
	%>
	<%-- 초기화면 처리 --%>
	<form id="frm01"> <%-- action의 속성값을 지정하지 않으면 현재 화면으로 호출 --%>
		<input type="text" name="num01" value="<%=ranNum1 %>" size="2" readonly/> X 
		<input type="text" name="num02" value="<%=ranNum2 %>" size="2" readonly/> =
		<input type="text" name="reply" value="" size="2"/><br>
		<input type="submit" name="reply" value="정답확인"/>
	</form>
	<%} else {
		int num01 = Integer.parseInt(num01S);
		int num02 = Integer.parseInt(num02S);
		int reply = Integer.parseInt(replyS);
	%>
	<%-- 요청 값을 받았을 때 --%>
	<h2> <%=num01 %> X <%=num02 %> = <%=reply %> </h2>
	<h2> <%=num01*num02==reply?"정답":"오답"%> </h2>
	<% } %>
	
</body>
</html>