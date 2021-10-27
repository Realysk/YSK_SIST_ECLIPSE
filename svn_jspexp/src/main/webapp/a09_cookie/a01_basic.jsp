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
# 쿠키(Cookie)
1. 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송된다.
2. 동작 방식
	1) 쿠키 생성 : 웹서버 ==> 브라우저(쿠키저장소) : 
		response.addCookie(new Cookie(name,value));
	2) 쿠키 저장 : 브라우저의 쿠키 저장소에 저장처리 :
	3) 쿠키 전송 : 브라우저 ==> 웹서버(요청객체를 통해서 전달) : request.getCookies();
3. 쿠키의 구성
	1) 구성요소
		- 이름 : 각각의 쿠키를 구별하는 데 사용되는 이름
		- 값 : 쿠키의 이름과 관련된 값
		- 유효시간 : 쿠키의 유지 시간
		- 도메인 : 쿠키를 전송할 도메인
		- 경로 : 쿠키를 전송할 요청 경로
	2) 쿠키 이름의 제약(특수문자와 한글 처리)
		- 쿠키의 이름은 아스키 코드의 알파벳과 숫자만을 포함할 수 있다.
		- 콤마, 세미콜롬, 공백 등의 문자는 포함할 수 없다.
		- $로 시작할 수 없다.	
		==> encoding 처리를 하여야 한다.
	3) 쿠키의 encoding과 decoding처리..
		한글과 같은 문자을 처리할 때, encoding으로 저장하고, decoding으로 불러와야 된다.
		Encoding 처리 : URLEncoder.encoder("한글데이터", "utf-8");
		Decoding 처리 : URLDecoder.decoder("한글데이터", "utf-8");
4. 쿠키값의 삭제
	1) 쿠키값은 일단 서버와 클라이언트가 끊어지면 사라진다.
		서버가 재기동 또는 클라이언트의 브라우저를 다 닫으면 서버와 연결이 끊어진다.
	2) 클라이언트 프로그램으로 삭제할 수 있지만, jsp는 서버프로그램으로 삭제 하여야 하므로
		해당 쿠키를 다시 client로 보내기 전에 유효시간을 0로 설정하여 response객체로 
		전달하여 삭제 브라우저의 저장 위치에서 삭제되게 한다.
		ex) ck.setMaxAge(0);
			response.addCookie(ck);		
--%>
<%
	// 1. 쿠키 생성하기
	Cookie cookie = new Cookie("cookie01","strawberryTaste");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	Cookie cookie2 = new Cookie(URLEncoder.encode("과일","utf-8"),
								URLEncoder.encode("복숭아", "utf-8"));
	response.addCookie(cookie2);	
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("쿠키생성!! 생성된 쿠키 확인").click(function(){
			location.href="a01_basic.jsp"; // 현재 페이지에서 쿠키 생성된 것 확인..
		});
	});
</script>
<body>
	<h2 align="center"></h2>
<%
	Cookie[] cookies = request.getCookies();
%>	
	<table  align="center" class="listTable">
		<tr><th>쿠키이름</th><th>쿠키값</th></tr>
		<%
		if(cookies!=null){
			for(Cookie ck:cookies){
		%>
		<tr><td><%=URLDecoder.decode(ck.getName(),"utf-8")%></td>
				<td><%=URLDecoder.decode(ck.getValue(),"utf-8")%></td></tr>
		<%
			}
		}
		%>
	</table>	
	
</body>
</html>