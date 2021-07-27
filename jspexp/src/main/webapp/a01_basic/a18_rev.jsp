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
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="a17_formReq에서 받은 데이터";
	};

</script>
<%--
	# 요청 데이터에 대한 처리
		1. null : 요청 값이 없을 때 기능 메서드를 이용하거나 화면에 null로 보여지는 것을 방지해야 한다.
			1) if(요청값==null) 변수명 = default 데이터 처리
				문자열은 "", 숫자형은 "0"으로 처리
		2. 형 변환 처리
		3. 객체에 할당 처리
 --%>
<%
	String pname = request.getParameter("pname");
	if(pname==null) pname=""; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	String price = request.getParameter("price");
	if(price==null) price="0"; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	String cnt = request.getParameter("cnt");
	if(cnt==null) cnt="0"; // 기본 ""로 처리하면 nullpointer 예외나 null 출력되는 경우를 방지할 수 있다.
	
	if(pname.equals("사과")) {
		
	}
	
	/*
		ex) a19_form.jsp
			도서명 : [   ]
			저자 : [   ]
			[확인]
			=> a20.rev.jsp 도서명 : @@@, 저자 : @@@
				입력이 안 된 경우 "입력 안됨"|"익명"으로 표현하여 출력하세요.
	*/
%>
</head>
<body>

	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th> 물건명 </th><th> 가격 </th><th> 수량 </th></tr>
		<tr>
			<td><%=pname%></td>
			<td><%=price%></td>
			<td><%=cnt%></td>
		</tr>
	</table>
	</form>
	
</body>
</html>