<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> A06_loginReceive </title>
</head>
<body>
	<!--
		A06_loginReceive.jsp?id=himan&pass7777
		ex) location.href="A06_loginReceive.jsp?id=himan&pass7777";
			<a href="A06_loginReceive.jsp?id=himan&pass7777"</a>
			이동처리 (데이터전송
	 -->
	 <h2> ID : ${param.id} </h2>
	 <h2> PW : ${param.pass} </h2>
</body>
</html>