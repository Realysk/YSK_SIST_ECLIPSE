<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
		$("#goMain").click(function(){
			$(location).attr("href","${path}/board.do?method=list");	
		});
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#board").submit();
			}
		});		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>게시판 등록</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="board" class="form-inline" action="${path}/board.do?method=insert" method="post">
		<input type="hidden" name="no" value="0"/>
		<input type="hidden" name="refno" value="0"/>
	<table  class="table table-hover">
		<col width="50%">
		<col width="50%">
			<tr><th>제목</th><td>
				<input name="subject"  class="form-control" /></td></tr>
			<tr><th>작성자</th><td>
				<input name="writer" class="form-control" /></td></tr>
			<tr><th>내용</th><td>
				<textarea name="content"  rows="10" class="form-control"></textarea></td></tr>
			<tr><td colspan="2" style="text-align:right">
				<input type="button" id="regBtn" value="등록" class="btn btn-info"/>
				<input type="button" id="goMain" value="메인화면으로" class="btn btn-primary"/>	
			</td></tr>				
	</table>							

	</form>
</div>
</body>
</html>