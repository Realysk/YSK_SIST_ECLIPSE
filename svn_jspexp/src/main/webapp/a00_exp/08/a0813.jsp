<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"  
    buffer="8kb"  
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
1. session scope의 4가지 범위를 기술하세요.
	page(pageContext) : 해당 페이지에서만 데이터 유지
	request : forward를 통해서 요청값을 전달할 경우에 데이터 유지
	session : 브라우저와 서버간에 연결된 경우에만 데이터 유지
	application : 동일한 서버가 기동된 상황까지 데이터 유지.
2. out 객체를 이용하여 buffer 메모리 8kb를 설정하고, 화면에 로그인 인증여부의 결과를 out객체를 활용하여
   처리하되, buffer의 정보(크기,남은크기)도 함께 출력하세요.
3. request 범위로 활용하여, 배달물건의 가격에 따른 등급(등급범위는 임의)이 다른 페이지(물건명,가격 요청값 표기)로
    이동하게 처리하세요.
    입력 : 물건명, 가격  페이지1(1등급), 페이지2(2등급), 페이지3(3등급)
4. session 범위로 활용하여 초기페이지(세션값1000설정), 이동페이지2(세션값10차감), 이동페이지3(세션값20차감)
    회원의 페이지마다 물건을 구매하는 부분을 간단하게 처리하는 부분으로 초기페이지에서 세션값을 설정한 후,
    이동페이지2, 이동페이지3을 서로 이동하면서 계속 세션값이 차감되어 출력되게 하세요.
5. application 범위로 web.xml에 이미지파일경로와 다운로드파일경로를 설정한 후, 해당 경로를 jsp페이지에서 
    호출하여, 출력하게 하세요.

z01_img
z03_download

--%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("정리문제");
	});
</script>
<body>
	<h2 align="center"></h2>
	<%--
	   
  	z01_img  : IMG_PATH
  	z03_download : DOWN_PATH
   
	 --%>
	 <%
	 String imgPath= application.getInitParameter("IMG_PATH");
	 String dwnPath= application.getInitParameter("DOWN_PATH");
	 %>
	<h3 align="center">이미지경로:<%=path+imgPath%> </h3>
	<h3 align="center">파일다운로드경로:<%=path+dwnPath%> </h3>
	<img src="<%=path+imgPath%>img01.PNG" width="200px" height="200px"/>
	<a href="<%=path+dwnPath%>Screenshots_0812.zip">파일 다운로드</a>
	
	
	
	<h3 align="center">세션 설정!</h3>

	<%
	session.setAttribute("point", 1000);
	%>
	<h3 align="center" onclick="location.href='a0813_buy1.jsp'">구매페이지1</h3>
	
	
	<h3 align="center">buffer의 크기:<%=out.getBufferSize()%></h3>
	<h3 align="center">buffer의 남은 크기:<%=out.getRemaining()%></h3>
	<%
	if(id!=null){
		if(id.equals("himan")&&pass.equals("7777")){
			out.print("<h3 align='center'>로그인 성공</h3>");
		}else{
			out.print("<h3 align='center'>로그인 실패</h3>");
		}
	}else{
		out.print("<h3 align='center'>요청값을 입력해 주세요(?id=himan&pass=7777)</h3>");
	}
	
	// request.getParameter
	// 는 request 객체안에 있는 요청 매개변수이기에 request범위로 처리된 페이지에서는
	// 데이터가 유지된다.
	RequestDispatcher rd=null;
	String priceS = request.getParameter("price");
	if(priceS!=null){
		int price = Integer.parseInt(priceS);
		if(price>=100000){
			rd = request.getRequestDispatcher("a0813_1.jsp");
			rd.forward(request, response);
			//out.print("<jsp:forward page='a0813_1.jsp'/>");	
		}else if(price>=50000){
			rd = request.getRequestDispatcher("a0813_2.jsp");
			rd.forward(request, response);			
			//out.print("<jsp:forward page='a0813_2.jsp'/>");	
		}else{
			rd = request.getRequestDispatcher("a0813_3.jsp");
			rd.forward(request, response);				
			//out.print("<jsp:forward page='a0813_3.jsp'/>");	
		}
	}
	%>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="pname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등급페이지이동"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>