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
<style>
	.input-group-text{width:100%;background-color:#cfffdf;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
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
		$(".fileInfo").click(function(){
			var fname=$(this).val();
			if(confirm("다운로드하시겠습니까?")){
				$(location).attr("href",
					"${path}/board.do?method=download&fname="+fname);	
			}
			
		});
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/board.do?method=update");
				$("form").submit();
			}
		});
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var no = $("input[name=no]").val();
				$(location).attr("href","${path}/board.do?method=delete&no="+no);					
			}
		});
		$("#reBtn").click(function(){
			if(confirm("답글을 달겠습니다!")){
				$("[name=refno]").val($("[name=no]").val());
				$("[name=subject]").val("RE:"+$("[name=subject]").val());
				$("[name=content]").val(
						"\n\n\n\n\n========<<이전 글>>=========\n"+
						$("[name=content]").val());
				$("form").attr("action",
						"${path}/board.do?method=insertForm");
				$("form").submit();
			}
		});
		$("#fname").click(function() {
			location.href="${path}/download.do?fname="+$(this).val();
		});
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h1>게시판 상세화면.</h1>
</div>
<div class="container">
	<form method="post"  >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text ">글번호</span>
		</div>
		<input name="no" class="form-control" 
			value="${board.no}"/>	
		<div class="input-group-prepend">
			<span class="input-group-text">상위글번호</span>
		</div>
		<input name="refno" class="form-control" 
			 value="${board.refno}" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">작 성 자</span>
		</div>
		<input name="writer" class="form-control" 
			value="${board.writer}" 
			placeholder="작성자입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">조회수</span>
		</div>
		<input  class="form-control" 
			 value="${board.readcnt}" />	
	</div>		
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="subject" class="form-control"
			value="${board.subject}"  
			placeholder="제목입력하세요" />	
		<div class="input-group-prepend">
			<span class="input-group-text">첨부파일</span>
		</div>
		<input class="form-control" id="fname"
			value="${board.fname}"/>			 
	</div>  	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text">등록일</span>
		</div>
		<input class="form-control" 
			value="<fmt:formatDate type='both' value='${board.regdte }'/>"/>	
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" 
			value="<fmt:formatDate type='both' value='${board.uptdte }'/>" />	
	</div>			
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="content" rows="10" 
			class="form-control" 
			placeholder="내용입력하세요" >${board.content}</textarea>		 
	</div> 
	<div style="text-align:right;">
		<input type="button" class="btn btn-info"
			value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger"
			value="삭제" id="delBtn"/>		
		<input type="button" class="btn btn-warning"
			value="답글" id="reBtn"/>					
		<input type="button" class="btn btn-success"
			value="조회 화면으로" id="goMain"/>
	</div>
	</form>
</div>	
</body>
</html>