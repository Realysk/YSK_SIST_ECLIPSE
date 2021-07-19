<%@ page import="javaexp.z05_project.PICMAGINE.FILEDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일명 중복 시 자동으로 이름을 변환 해줌 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> JSP 파일 업로드 </title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100; // 최대 용량 100MB 제한
		String encoding = "UTF-8";
		MultipartRequest multipartRequest
			= new MultipartRequest(request, directory, maxSize, encoding ,new DefaultFileRenamePolicy());
		/*MultipartRequest multipartRequest
		= new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());*/
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		new FILEDAO().upload(fileName, fileRealName);
		out.write("파일명 : " + fileName + "<br>");
		out.write("실제 파일명 : " + fileRealName + "<br>");
	%>
</body>
</html>