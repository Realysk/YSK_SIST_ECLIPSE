<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일명 중복 시 자동으로 이름을 변환 해줌 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Upload </title>
</head>
<body>
	<%
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = upload.parseRequest(request);
		String name = item.getFieldName();
		String value = item.getString("UTF-8");
		File file = new File(c:\\upload_files);
		item.write(file);
		String path = item.getName();
		Boolean bool = item.isFormField();
	 %>
</body>
</html>