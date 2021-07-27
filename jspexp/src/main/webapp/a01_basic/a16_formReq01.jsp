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
		document.querySelector("h3").innerText="form 태그 전송";
	};

</script>
</head>
<body>
<%--
	# form 객체를 통한 요청 값 처리
		1. 다른 페이지 호출 , 요청 값 전달
			form
			1) 속성 action="요청할페이지"
			2) 하위 요소 객체
				<input type="text name="요청키" value="요청값"/>
				<input type="submit"/> => 이 버튼을 클릭 시 요청 페이지와 요청 값이 전달된다.
			
		2. 현재 페이지에 요청 값 전달하기
			1) 초기 화면
			2) 요청 값 전달 후 화면
 --%>

	<h3 align="center"></h3>
	<form id="frm01" action="a17_receive.jsp">
	<table>
		<tr>
			<th> 사원명 </th>
			<td><input type="text" name="ename" value=""/></td>
			<td colspan="2"><input type="submit" value="전송"/></td>
		</tr>
		<%--
			submit를 클릭하는 순간
			location.href="a17_receive.jsp?ename=홍길동"으로 처리되는 것과 같은 수행을 해준다.
			
			ex) a17_formReq.jsp를 통해서 물건명 가격 수량을 입력해서 전송하는 순간 a18_rev.jsp를 통해서 위 데이터를 전송받게 처리하세요.
		 --%>
	</table>
	</form>
	
</body>
</html>