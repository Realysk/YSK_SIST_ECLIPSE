<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> J-STUDY Ŀ�´�Ƽ : QUIZ ������ ��� �Ϸ� </title>
</head>
<body>
	<h2> # J-STUDY Ŀ�´�Ƽ : QUIZ ������ ����� �Ϸ�Ǿ����ϴ�! # </h2>
	<h3> # ���� : <% String quest = request.getParameter("quest"); %> </h3>
	<h3> # ���� ��� : <% String usrAns = request.getParameter("usrAns"); %> </h3>
	<h3> # ���� : <% String answer = request.getParameter("answer"); %> </h3>
</body>
</html>