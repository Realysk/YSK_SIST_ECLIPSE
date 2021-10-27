<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import = "jspexp.a01_start.A01_Movie"    
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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="최신영화!!";
	};

</script>
</head>
<body>
<%
A01_Movie m = new A01_Movie("블랙위도우",2289583,"2021.07.07");
// ex) A02_Entertainer 클래스를 생성하고, 연예인이름 생년월일 분야  속성설정하고,
// a05_with_vo.jsp에 출력하세요 4조. ~14:28 풀이 하신데까지 올려주세요.
%>
	<h3></h3>
	<table>
		<tr><th>제목</th><td><%=m.getTitle()%></td></tr>
		<tr><th>관객수</th><td><%=m.getVisitCnt()%></td></tr>
		<tr><th>개봉일</th><td><%=m.getOpenDate()%></td></tr>
	</table>
</body>
</html>