<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> J-STUDY 커뮤니티 : QUIZ 데이터 등록 완료 </title>
</head>
<body>
	<h2> # J-STUDY 커뮤니티 : QUIZ 데이터 등록이 완료되었습니다! # </h2>
	<h3> # 문제 : <% String quest = request.getParameter("quest"); %> </h3>
	<h3> # 유저 답안 : <% String usrAns = request.getParameter("usrAns"); %> </h3>
	<h3> # 정답 : <% String answer = request.getParameter("answer"); %> </h3>
</body>
</html>