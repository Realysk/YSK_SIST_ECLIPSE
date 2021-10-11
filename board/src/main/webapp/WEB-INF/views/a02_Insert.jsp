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
		var isInsert = "${board.subject}";
		if(isInsert!=""){
			if(confirm("등록되었습니다!\n계속등록하시겠습니까?")){
				$(":input").val("");
				$("[name=refno]").val(0);
				$("[name=no]").val(0);
			}else{
				$("#list").submit();
			}
		}
			
		$("#goMain").click(function(){
			$(location).attr("href","${path}/board.do?method=list");	
		});
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#board").submit();
			}
		});	
		// custom-file-input custom-file-label
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>게시판 등록</h2>
</div>
<div class="container">
	<form id="list"  action="${path}/board.do?method=list" method="post">
		<input type="hidden" name="curPage" value="1"></form>
	<!-- 등록 후, 현재 페이지 번호를 변경 처리 ==> session값에 영향. -->	
	<form id="board" enctype="multipart/form-data" action="${path}/board.do?method=insert" method="post">
		<input type="hidden" name="no" value="0"/>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="text-center input-group-text">제 목</span>
			</div>
			<input name="subject" class="form-control" 
				value="${board.subject}" placeholder="제목입력하세요" />	
		</div>  
		<div class="input-group mb-3">	
			<div class="input-group-prepend">
				<span class="input-group-text">작 성 자</span>
			</div>
			<input name="writer" class="form-control" placeholder="작성자입력하세요" />	
			<div class="input-group-prepend">
				<span class="input-group-text">상위글번호</span>
			</div>
			<input name="refno" class="form-control" 
				placeholder="상위글번호" value="${board.refno}" readonly/>	
		</div>		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text text-right">내 용</span>
			</div>
			<textarea name="content" rows="10" 
				class="form-control" 
				placeholder="내용입력하세요" >${board.content}</textarea>		 
		</div>
		<div class="input-group mb-3">	
			<div class="input-group-prepend">
				<span class="input-group-text">첨부 파일</span>
			</div>
			<div class="custom-file"> 
				<input type="file" name="report" class="custom-file-input" id="file01">
				<label class="custom-file-label" for="file01">
					파일을 선택하세요!
				</label>
			</div>
			
		</div>			 
		<div class="text-right">
			<button type="button"  id="regBtn"  class="btn btn-info">등록</button>
			<button type="button"  id="goMain"  class="btn btn-success">조회 화면으로</button>
		</div>
	</form>
</div>
</body>
</html>