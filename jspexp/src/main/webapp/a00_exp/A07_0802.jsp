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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="08.02 정리 문제";
	}
</script>
</head>
	<h3 align="center"></h3>
<%-- 
# 주간 정리문제
	1. go.jsp에 요청값(name=홍길동)를 단계별로 아래와 같이 처리할 때, 사용 코드를 기술하세요.
	    1) a href
	    2) h2로 클릭시 
	    3) form객체 get방식 2페이지 처리
	    4) form객체 post방식 1페이지 처리
	
		--%>
			<form id="frm01" method="post">
			<table>
				<tr><th colspan="2"> [1] 'go.jsp'에 요청 값 (name=홍길동)을 전송할 때의 방법 기술 </th></tr>
				<tr><th> a href </th><td> 'go.jsp' 만든 후 요청값을 보내려는 페이지에 a href="go.jsp?name="+홍길동; </td></tr>
				<tr><th> h2 onclick </th><td> onclick 함수 만든 후 location.href="go.jsp"로 코딩 후 go.jsp에는 변수로 name을 할당하여 서로 연결되게 링크 </td></tr>
				<tr><th> form get방식 (2페이지) </th><td> </td></tr>
				<tr><th> form post방식 (1페이지) </th><td> </td></tr>
			</table><br><hr>
			</form>
		<%--
	
	2. 요청값에 대한, null값과 숫자값 처리를 간단한 예제로 기술하세요
	
		--%>
			<form id="frm01" method="post">
			<table>
				<tr><th colspan="2"> [2] 요청 값에 대한 null과 숫자 값 처리 방법 </th></tr>
				<tr><th> null </th><td> if(변수명 == null) 변수명 = "" OR (숫자형일 경우 형 변환 후) 변수명 = "0" </td></tr>
				<tr><th> 숫자 값 </th><td> 문자열 변수명 = Integer.parseInt("숫자형으로 변환할 변수명") </td></tr>
			</table><br><hr>
			</form>
		<%--	
	
	3. 요청값의 1페이지로 아래와 같은 내용을 처리하세요.
	    놀이공원입장료 :50000
	    나이 :[   ] (나이에 따른 할인율계산)
	    인원 :[   ]
	    [입장료계산]
	
		--%>
			<%
				String ageS = request.getParameter("age");
				String cntS = request.getParameter("cnt");
				double discount=0.0;
				int tot=0;
				int age = 0; if(ageS==null) age = Integer.parseInt(ageS);
				int cnt = 0; if(cntS==null) cnt = Integer.parseInt(cntS);
				if(age>5 || age>=65) {
					discount=1.0;
				} else if (age<=18) {
					discount=0.5;
				}
				tot=50000*cnt;
				tot=(int)(tot-(tot*discount));
			%>
			<form id="frm01" method="post">
			<table class="listTable">
				<tr><th colspan="2"> [3] 놀이공원 입장 프로그램 </th></tr>
				<tr><th> 나이 </th><td><input type="text" name="age" value="<%=age%>"/></td></tr>
				<tr><th> 인원 </th><td><input type="text" name="cnt" value="<%=cnt%>"/></td></tr>
				<tr><td colspan="2"><input type="submit" value="입장료계산"/></td></tr>
			</table><br><hr>
			</form>
			<% if(ageS!=null) { %>
			<h2 align="center"> 할인율 : <%=(int)(discount*100)%>%, 최종 입장료 : <%=tot%> </h2>
			<% } %>
		<%--	
	
	4. 물건정보 테이블을 만들고, 물건리스트 처리하는 화면과 등록/상세조회/수정/삭제 구현 처리하세요.
 
		--%>
			<form id="frm01" method="post">
			<table>
				<tr><th colspan="2"> [1] 리스트 된 화면의 특정 KEY를 통해 상세 화면에 전송하는 JS 기술 </th></tr>
				<tr><th> JS </th><td> location.href="요청KEY페이지명.jsp?변수명=<%="변수명"%>"; </td></tr>
			</table><br><hr>
			</form>
		<%--

--%>
<body>
	
</body>
</html>