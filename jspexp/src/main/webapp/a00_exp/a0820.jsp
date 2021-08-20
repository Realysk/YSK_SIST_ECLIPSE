<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"    
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
# 정리문제
1. jsp에서 web.xml에 예외클래스 등록을 처리하는 순서과 코드를 정리 하세요.
	1) 예외클래스발생에 대한 예외 처리 jsp파일 작성..
	2) web.xml
		<exception-type>예외클래스
		<location>예외처리 jsp파일 위치
	3) 강제 예외 발생 테스트..	 
2. 쿠키의 처리구조를 설명하고, 브라우저와 서버간에 처리코드를 기술하세요.
	클라이언트(브라우저) <==> 서버(톰캣)
		저장소(쿠키)        쿠키
	1) 서버단에 쿠키를 생성해서 response객체로 전달 : response.addCookie(new Cookie(이름,값));
	2) 브라우저에 특정 저장소에 저장.
	3) 요청객체(request)로 서버에 전달 : request.getCookies();
	
3. 쿠키의 한글처리시 사용하는 코드를 기술하세요.
	저장시, encoding - URLEncoder.encode("쿠키의 이름/값","utf-8")
	호출시, decoding - URLDecoder.decode("쿠키의 이름/값","utf-8");

4. 쿠키값 삭제 2가지 방법을 기술하세요.
	1) 서버와 클라이언트가 접속이 종료시(브라우저를 다 종료, 서버를 종료)
	2) 지정된 쿠키의 생명주기를 0로 처리하여 response.addCookie로 보낸다.
		cookie.setMaxAge(0);
		response.addCookie(cookie);	


5. 쿠키를 활용하여 영화를 예매하고, 최종 결재할 내용만 남기는 처리를 하세요.
    [영화제목][보통/3d/4d][금액][관람갯수][예매] ==> 현예매현황(최종내용현황)
    [] 영화제목 분류 금액 관람수
    []  @@@  @@  @@@ @@@
          [제외][결재]

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("영화 예약 시스템");
	});
</script>
<body>
<%
	String no= request.getParameter("no");
	//if(no==null) no="0";
	String title= request.getParameter("title");
	String kind= request.getParameter("kind");
	String pay= request.getParameter("pay");
	String cnt= request.getParameter("cnt");
	// 1단계 제목과 관람인원수로 처리..
	if(title!=null){
		response.addCookie(new Cookie(URLEncoder.encode(title,"utf-8"), cnt));
		response.sendRedirect("a0820_show.jsp");
	}
%>
	<h2 align="center"></h2>
	<form id="frm01">
		<%--<input type="hidden" name="no" value="<%=no+1%>"/> --%>
	<table align="center" class="listTable">
		<tr><th>영화제목</th><td><input type="text" name="title" value=""/></td></tr>
		<tr><th>분류</th><td>
			<select name="kind" style="width:100%;">
				<option>일반</option>
				<option>3D</option>
				<option>4D</option>
			</select>
		</td></tr>
		<tr><th>금액</th><td><input type="text" name="pay" value=""/></td></tr>
		<tr><th>인원</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="예매"/></td></tr>
	</table>	
	</form>
</body>
</html>