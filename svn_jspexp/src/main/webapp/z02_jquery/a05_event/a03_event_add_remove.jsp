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
# 이벤트의 추가와 삭제 처리..
1. 이벤트 정의 
	1) $("대상객체").on("이벤트명",핸들러함수);
	2) $("대상객체").이벤트명(핸들러함수);
	3) $("대상객체").bind("이벤트명",핸들러함수);
2. 이벤트 삭제 : 정의된 이벤트를 삭제 처리.
	1) $("대상객체").off("이벤트");
	2) $("대상객체").unbind("이벤트명",핸들러함수);
		--%>	
		$("h3").on("click",function(){
			$("#show").append("<span>[이벤트발생]</span>");
		});
		$("h4").on("click",function(){
			$("h3").off("click"); // 이벤트 삭제
			alert("이벤트 삭제 완료!!");
		});
		// ex) 구매버튼 클릭시, 이벤트에 의해 구매갯수 1++, 단가 1200에 의해 총계가 출력이 되다가
		//     구매완료 클릭시, 더이상 구매버튼을 클릭하여도 갯수와 총계가 변경되지 않게 처리하세요 4조.
		var cnt=0;
		var price=1200;
		$("#buyBtn").bind("click",function(){
			cnt++;
			$("#show").html("<h3>구매갯수:"+cnt+", 총계:"+(price*cnt)+"</h3>")
		});
		$("#endBtn").on("click",function(){
			$("#buyBtn").unbind("click");
			alert("구매 확정!!");
		});
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">이벤트 처리 연습</h2>
  <button type="button" id="buyBtn">구매</button>
  <button type="button" id="endBtn">구매완료</button>
  <div id="show"></div>	
  <h3>이벤트 처리</h3>
  <h4>이벤트 삭제</h4>
  
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
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
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>