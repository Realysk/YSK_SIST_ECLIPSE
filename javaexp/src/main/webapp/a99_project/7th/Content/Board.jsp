<%@page import="javaexp.com.Model.FileVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
table, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

</head>
<body>
	<table>
		<tr>
			<td>Num</td>
			<td>Title</td>
			<td>Author</td>
			<td>FileName</td>
			<td>Date</td>
		</tr>
		
		<c:forEach items="${requestScope.list}" var="i">
			<tr>
				<td>${i.num }</td>
				<td>${i.title }</td>
				<td>${i.author }</td>
				<td><a href="SelectOne?num=${i.num}">${i.file }</a></td>
				<td>${i.day }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>