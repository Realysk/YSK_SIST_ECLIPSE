<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.upload.UPLDAO"
	import="Project_SIST.Java.A05_Picmagine.upload.UPLDTO"
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
		document.querySelector("h3").innerText="PICMAGINE : 게시물 등록이 완료되었습니다!";
	};
</script>
</head>
<body>

	<%
		String artno = request.getParameter("artno");
		if(artno==null) artno = "";
		String artcategory = request.getParameter("artcategory");
		if(artcategory==null) artcategory = "";
		String artimgtitle = request.getParameter("artimgtitle");
		if(artimgtitle==null) artimgtitle = "";
		String arttitle = request.getParameter("arttitle");
		if(arttitle==null) arttitle = "";
		String artcontent = request.getParameter("artcontent");
		if(artcontent==null) artcontent = "";
		String tag = request.getParameter("tag");
		if(tag==null) tag = "";
		String artdate = request.getParameter("artdate");
		if(artdate==null) artdate = "";
		String artpicauth = request.getParameter("artpicauth");
		if(artpicauth==null) artpicauth = "";
	
		UPLDTO upload = new UPLDTO(artno, artcategory, arttitle, artcontent, artimgtitle, tag, artdate, artpicauth);
		
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> upllist = dao.uploadList();
		dao.Uploaded(new UPLDTO());
	%>
 
	<h3></h3>
	<table>
		<h4 align="center"> * 게시물 등록 정보 * </h4>
		<tr><th> NO. </th><th> CATEGORY </th><th> TITLE </th><th> CONTENTS </th><th> FILE </th><th> TAG </th><th> DATE </th><th> AUTH </th></tr>
		<tr>
			<td><%=upload.getArtno() %></td>
			<td><%=upload.getArtcategory() %></td>
			<td><%=upload.getArttitle() %></td>
			<td><%=upload.getArtcontent() %></td>
			<td><%=upload.getArtimgtitle() %></td>
			<td><%=upload.getTag() %></td>
			<td><%=upload.getArtdate() %></td>
			<td><%=upload.getArtpicauth() %></td>
		</tr>
	</table><br>
	<table>
		<h4 align="center"> * 게시물 정보 리스트 * </h4>
		<tr><th> NO. </th><th> CATEGORY </th><th> TITLE </th><th> CONTENTS </th><th> FILE </th><th> TAG </th><th> DATE </th><th> AUTH </th></tr>
		<%for(UPLDTO u:upllist) { %>
		<tr>
			<td><%=u.getArtno() %></td>
			<td><%=u.getArtcategory() %></td>
			<td><%=u.getArttitle() %></td>
			<td><%=u.getArtcontent() %></td>
			<td><%=u.getArtimgtitle() %></td>
			<td><%=u.getTag() %></td>
			<td><%=u.getArtdate() %></td>
			<td><%=u.getArtpicauth() %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>