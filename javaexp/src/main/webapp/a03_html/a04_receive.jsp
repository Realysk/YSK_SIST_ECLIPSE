<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> a04_receive </title>
</head>
<body>
<!-- a04_receive.jsp?name=홍길동&age=25&loc=서울신림동 -->
	<h1> 등록 데이터 </h1>
	<h2> 이름 : ${param.name} </h2>
	<h2> 나이 : ${param.age} </h2>
	<h2> 지역 : ${param.loc} </h2>
</body>
</html>