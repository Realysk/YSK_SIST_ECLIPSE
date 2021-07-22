<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
	import="com.oreilly.servlet.MultipartRequest"
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PICMAGINE : 업로드 완료 </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="PICMAGINE : 업로드 완료";
	};
	
	uploadForm.encoding = "multipart/form-data";

</script>
</head>
<body>

	<%--
		// 파일 업로드 관련 객체...
		MultipartRequest multi = null;
		String savePath = "/uploaded_file"; // 저장할 경로
		int sizeLimit = 5 * 1024 * 1024; // 용량 제한 (5MB)
		
		try{ // req, request에서 오류..
			multi = new MultipartRequest(req, savePath, sizeLimit, "UTF-8"); 
			// 업로드
			} catch (Exception e) {
			e.printStackTrace();
			// 예외처리
			} 
		
		String gCategory1 = multi.getParameter("gCategory1");
		String gName = multi.getParameter("gName");
		String gContent = multi.getParameter("gContent");
	--%>
 
	<h3></h3>
	<table>
		<tr><th> 제목 </th><th> 내용 </th><th> 첨부파일 </th><th> 태그 </th></tr>
		<tr>
			<td>${param.title}</td>
			<td>${param.contents}</td>
			<td>${param.upload}</td>
			<td>${param.tag}</td>
		</tr>
		<%--
		<tr><td><img src="./uploaded_file/<%=gCategory1 %>"></td></tr>
		<tr><td><img src="./uploaded_file/<%=gName %>"></td></tr>
		<tr><td><img src="./uploaded_file/<%=gContent %>"></td></tr>
		 --%>
	</table>

</body>
</html>