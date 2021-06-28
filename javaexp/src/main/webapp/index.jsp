<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="javaexp.z01_vo.Food" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> index </title>
<style type="text/css">
	h3{background-color:blue; color:yellow;}
</style>
</head>
<%
	// java + html ==> 최종적으로 html 파일을 만들어 client(브라우저) Stream을 이용하여 전달한다.
	Food f = new Food("사과",2000,"청과물가게");
%>

<%--
화면단(front end)
html/css
javascript ==> jquery

===> ajax(비동기 프로그래밍) : front end와 back end연결

내부처리프로그램(back end)
java
데이터베이스
jsp
springframework

 --%>
<body>
	<h2>웹 프로그램 시작!! (180.66.208.113)</h2>
	<h3>http://180.66.208.113</h3>
	<h3>물건명 : <%=f.getName()%></h3>
	<h3>가격 : <%=f.getPrice()%></h3>
	<h3>파는 곳 : <%=f.getLoc()%></h3>
</body>
<script type="text/javascript">
	var h2 = document.querySelector("h2");
	h2.onclick=function() {
		alert("클릭했습니다!!");
		this.style.color="orange";
	}
</script>
</html>