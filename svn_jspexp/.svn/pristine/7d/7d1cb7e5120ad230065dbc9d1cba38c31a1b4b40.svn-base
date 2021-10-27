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
<title>Insert title here</title>
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<%--<link rel="stylesheet" 
href="<%=path%>/a00_com/a00_com.css">
 --%>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="한 화면에서 form과 요청값";
	}
</script>
</head>
<body>
	<%--
	ex) 초기화면 구구단 문제을 임의로 출력 
		 [ 4  ] X [ 5 ] 	<input name="num01" value="4"/>
		 정답입력 :[    ][확인] ==> 다음 페이지에  4 X 5 = 20  정답/오답 출력..
		 5조
	1. 초기화면과 요청값 받았을 때, 화면을 구현한다.
	2. 요청값을 받았을 때, 처리를 조건 로직을 구별하여 화면을 구현.
	3. 세부적사항
		1) 데이터 처리.
			초기화면 데이터 처리..
		
		2) 요청화면 데이터 처리..
		
	 --%>
	<h3></h3>
	<%
	// 요청값..
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	String replyS = request.getParameter("reply");

	if(num01S==null){
		int ranNum1 = (int)(Math.random()*8+2);
		int ranNum2 = (int)(Math.random()*9+1);
	%>
	<%--초기 처리 --%>
	<form id="frm01"><%-- action의 속성값을 지정하지 않으면 현재 화면으로 호출 --%>
	<input type="text" name="num01" value="<%=ranNum1 %>" size="2"/>X
	<input type="text" name="num02" value="<%=ranNum2 %>" size="2"/><br>
	정답<input type="text" name="reply" value="" size="2"/><br>
	<input type="submit" value="정답확인"/>
	</form>
	<%}else{
		int num01 = Integer.parseInt(num01S);
		int num02 = Integer.parseInt(num02S);
		int reply = Integer.parseInt(replyS);
	%>
	<%--요청값을 받았을 때 --%>
	<h2><%=num01 %> X <%=num02 %> = <%=reply%></h2>
	<h2><%=num01*num02==reply?"정답":"오답" %></h2>
	<%}%>
</body>
</html>