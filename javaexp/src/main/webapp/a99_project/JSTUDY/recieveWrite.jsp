<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> J-STUDY 커뮤니티 : 게시물 작성 완료 </title>
</head>
<body align="center">
	<h2> # J-STUDY 커뮤니티 : 게시물 등록이 완료되었습니다! # </h2>
	<h3> # 게시물 제목 : <% String headline = request.getParameter("headline"); %> </h3>
	<h3> # 게시물 내용 : <% String contents = request.getParameter("contents"); %> </h3>
	<h3> # 이미지 업로드 : <% String imgUpload = request.getParameter("imageUpload"); %> </h3>
	<h3> # 파일 업로드 : <% String fileUpload = request.getParameter("fileUpload"); %> </h3>
</body>
</html>