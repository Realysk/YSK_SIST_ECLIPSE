<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="Project_SIST.Java.A05_Picmagine.upload.*"
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
	
	<%
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> upllist = dao.getUplList();
	%>
 
	<h3></h3>
	<table>
		<tr><th> 제목 </th><th> 내용 </th><th> 첨부파일 </th><th> 태그 </th><th> [스토리] 제목 </th><th> [스토리] 설명 </th><th> [스토리] 주제 </th></tr>
		<%for(UPLDTO u:upllist) { %>
		<tr>
			<td><%=u.getTitle() %></td>
			<td><%=u.getContents() %></td>
			<td><%=u.getPic_file() %></td>
			<td><%=u.getTag() %></td>
			<td><%=u.getStoryname() %></td>
			<td><%=u.getStorycontents() %></td>
			<td><%=u.getStroytitle() %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>