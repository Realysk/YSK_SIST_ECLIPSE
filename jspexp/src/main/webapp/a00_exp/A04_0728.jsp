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
		document.querySelector("h3").innerText="07.28 정리 문제";
	};

</script>
</head>
<body>

	<h3 align="center"></h3>
<%--
	1. 요청값 처리에 대한 location.href 방식 form 하위 요소객체를 이용하여 처리하는 방식의 차이점을 코드로 기술하세요.
	
	--%>
		<h4> [1] 요청 값 처리 방식 </h4>
		<table>
			<tr><th> location.href </th><td> location.href="요청페이지명.jsp?요청key1="요청value1+"&요청key2="+요청value2+...; </td></tr>
			<tr><th> form </th><td> "form action=데이터를 넘길 페이지.jsp" => 태그에 데이터를 넘길 name or id or class값 부여 =>
									데이터를 받을 페이지.jsp 생성 후 String 매개변수 = request.getParameter(속성값); (이 때 매개변수가 숫자형이면 형 변환 - int 형 변환시킬 매개변수 = Integer.parseInt(속성값);) => 
									if(매개변수 = null) 매개변수 = "" =>  %=매개변수 % (VO, DAO 호출 방법도 있음) </td></tr>
		</table>	
	<%--
	
	2. 요청값이 없는 경우에 처리할 내용에 대한 기본 코드를 기술하세요.
	
	--%>
		<h4> [2] 요청 값이 없는 경우에 처리 방법 </h4>
		<table>
			<tr><th> URL </th><td> JSP URL에 요청페이지명.jsp?요청key1=요청value1&요청key2&요청value2+... </td></tr>
		</table>	
	<%--	
	
	3. form 형식으로 숫자형 데이터를 전송하여 처리하는 방식에 있어서, 반드시 처리해야 될 내용을 예제와 함께 기술하세요.
	
	--%>
		<h4> [3] form 데이터 전송 시 숫자형 처리 </h4>	
		<table>
			<tr><th> 숫자형 처리 </th><td> int 매개변수 = Integer.parseInt(형변환시킬 매개변수); </td></tr>
		</table>	
	<%--	
	
	4. 온라인 영화관 예약시스템에서 입장할 영화제목, 입장인원, 입장료, 상영시간으로 입력하여 처리결과를 확인하고자 한다. 2개 페이지로 처리하는 형식과 1개 페이지로 처리하는 형식을 구현해 보세요.
	   처리결과 : 영화제목, 상영시간, 입장인원, 총비용 출력
	
	--%>
		<h4> [4-1] 온라인 영화 예약 시스템 구현 - 2개 페이지 구현 </h4>
		<form action="A04_0728_receive.jsp">
		<table>
			<tr><th> 영화 제목 </th><th> 입장 인원 </th><th> 입장료 </th><th> 상영 시간 </th></tr>
			<tr>
				<td><input type="text" name="movie" value=""/></td>
				<td><input type="number" name="movNumS" value=""/></td>
				<td><input type="number" name="mPriceS" value=""/></td>
				<td><input type="date" name="mClockS" value=""/></td>
				<tr><td colspan="4"><input type="submit" value="조회"/></td></tr>
			</tr>
		</table>
		</form><br>
		<%
		String movie = request.getParameter("movie");
		String movNumS = request.getParameter("movNumS");
		String mPriceS = request.getParameter("mPriceS");
		String mClockS = request.getParameter("mClockS");	
		%>
		<h4> [4-2] 온라인 영화 예약 시스템 구현 - 1개 페이지 구현 </h4>
		<% if(movie == null && movNumS == null && mPriceS == null && mClockS == null) { %>
		<form id="frm01">
		<table>
			<tr><th> 영화 제목 </th><th> 입장 인원 </th><th> 입장료 </th><th> 상영 시간 </th></tr>
			<tr>
				<td><input type="text" name="movie" value=""/></td>
				<td><input type="number" name="movNumS" value=""/></td>
				<td><input type="number" name="mPriceS" value=""/></td>
				<td><input type="date" name="mClockS" value=""/></td>
				<tr><td colspan="4"><input type="submit" value="조회"/></td></tr>
			</tr>
		</table>
		</form>
		<%
		} else {
			int movNum = Integer.parseInt(movNumS);
			int mPrice = Integer.parseInt(mPriceS);	
		%>
		<form id="frm01">
		<table>
			<tr><th> 영화 제목 </th><th> 입장 인원 </th><th> 입장료 </th><th> 상영 시간 </th><th> 총계 </th></tr>
			<tr>
				<td><%=movie %></td>
				<td><%=movNum %></td>
				<td><%=mPrice %></td>
				<td><%=mClockS %></td>
				<td><%=movNum * mPrice %></td>
			</tr>
		</table>
		</form>
		<% } %>
	<%--	
	
	5. 아래와 같은 형식으로 계산기를 처리하세요.(1개 페이지)
	   [    ] [연산자select] [    ] [합산]
	   
	--%>
		<%
		String sum = request.getParameter("sum");
		String minus = request.getParameter("minus");
		String multi = request.getParameter("multi");
		String divide = request.getParameter("divide");
		String num01S = request.getParameter("num01S");
		String num02S = request.getParameter("num02S");
		%>	
		<h4> [5] 계산기 구현 - 1개 페이지 </h4>
		<% if(sum == null) { %>	

		<%
		} else {

		%>

		<% } %>		
	<%--	   
	   
 --%>
	
</body>
</html>