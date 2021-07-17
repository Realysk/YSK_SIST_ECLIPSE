<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<td>번호</td>
			<td>${requestScope.vo.num}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${requestScope.vo.title}</td>
		</tr>
		<tr>
			<td>작가</td>
			<td>${requestScope.vo.author}</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${requestScope.vo.day}</td>
		</tr>
		<tr>
			<td colspan="2"><img src="Upload/${requestScope.vo.file}"></td>
		</tr>
	</table>
	
</body>
</html>