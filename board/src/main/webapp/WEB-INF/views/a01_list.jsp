<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		// 등록버턴으로 등록 화면 로딩..
		$("#regBtn").click(function(){
			//alert("등록버튼 클릭!!");
			// 등록화면이 나타나는 controller 호출..
			// controller의 상단에 board.do
			// 각 메서드마다.method=insertForm 호출.. 
			$(location).attr("href","${path}/board.do?method=insertForm");
			
		});
		$("[name=pageSize]").val("${boardSch.pageSize}");
		$("[name=pageSize]").change(function() {
			$("[name=curPage]").val(1);
			$("form").submit();
		});
	});
	function go(no){		
		$(location).attr("href",
				"${path}/board.do?method=detail&no="+no);
	}
	function goPage(no) {
		$("[name=curPage]").val(no);
		$("form").submit();
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>답변형 게시판</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
    <form:form modelAttribute="boardSch" class="form" method="post">
		<input type="hidden" name="curPage" value="1"/>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  		<form:input path="subject" class="form-control mr-sm-2" placeholder="제목"/>
  		<form:input path="writer" class="form-control mr-sm-2" placeholder="작성자"/>
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" id="regBtn" type="button">등록</button>
 	</nav>
 	<div class="input-group lb-3">
 		<div class="input-group-prepend">
 			<span class="input-group-text">총 : ${boardSch.count} 건</span>
 		</div>
 		
 		<div class="input-group-append">
 			<span class="input-group-text">페이지 크기:</span>
 			<select name="pageSize" class="form-control">
 				<option>3</option>
 				<option>5</option>
 				<option>10</option>
 				<option>20</option>
 				<option>30</option>
 			</select>
 		</div>
 	</div>
	</form:form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="bd" items="${list}">
    	<tr class="text-center" ondblclick="javascript:go(${bd.no})">
    		<td>${bd.cnt}</td>
    		<td  class="text-left">${bd.subject}</td><td>${bd.writer}</td>
    		<td><fmt:formatDate value="${bd.regdte}"/>
    		
    		</td><td>${bd.readcnt}</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
	<ul class="pagination justify-content-center">
		
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.startBlock-1})">Previous</a></li>
		  <c:forEach var="cnt" begin="${boardSch.startBlock}" end="${boardSch.endBlock}">
		  	<li class="page-item ${boardSch.curPage==cnt?'active':''}"><a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>	  
		  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.endBlock+1})">Next</a></li>
	</ul>  
</div>
</body>
</html>