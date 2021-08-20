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

5. 쿠키를 활용하여 영화를 예매하고, 최종 결재할 내용만 남기는 처리를 하세요.
    [영화제목][보통/3d/4d][금액][관람갯수][예매] ==> 현예매현황(최종내용현황)
    [] 영화제목 분류 금액 관람수
    []  @@@  @@  @@@ @@@
          [제외][결재]
	# cookie값을 통한 예매정보처리..
	1. cookie의 특성이 객체를 못 담기때문에, 구분자를 넘겨주어처리한다.
		각 row단위에 대한 key의 번호를 전송 :  <input type="hidden" name="no" value="<%=no+1%>"
	2. 각 쿠키값의 name/value데이터를 
		title1 : 타이탄
		kind1 : 4D 
		pay1 : 	12000
		cnt1 : 3
		title2 : 타이탄
		kind2 : 4D 
		pay2 : 	12000
		cnt2 : 3		
	3. 출력처리..
		substring, charAt, length()를 이용하여 아래와 같이 name값과 value값을 출력처리한다.
		제목     종류   금액  관객수
		title1  kind1 pay1 cnt1
		title2  kind1 pay2 cnt2
	==> 월요일까지 과제..~~		



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
		response.sendRedirect("a0820_2_show.jsp");
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