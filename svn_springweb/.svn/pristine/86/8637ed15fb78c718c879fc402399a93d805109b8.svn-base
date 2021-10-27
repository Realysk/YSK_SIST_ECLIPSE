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
2021-10-05
# 일일정리문제
[하:개념]1. 페이징 처리시, 각 속성값의 처리 방법을 간단하게 기술하세요.
	  count(총건수) - DB, 
	  pageSize(페이지크기) - 요청값(<select name="pageSize")
	  pageCount(총페이지수) - service로직(총건수/페이지크기-올림처리)
	  curPage(현재페이지번호) - 요청값(<input name="curPage"> <a href="goPage(번호)"> 
      start(시작번호), end(마지막번호) - service로직(페이지크기*현재페이지번호)
      ==> 최종적으로
      DB  처리  where rownum between #{start} and #{end}
      
[하:기본코드]2. 하단 페이지 처리시, << 1 2 3 4 5 >> 각 내용을 클릭시, 처리되는 내용을 기술하세요.
	<a class="page-link" 
	  	href="javascript:goPage(${boardSch.startBlock-1})">Previous</a>
	이전 페이지블럭은 시작하는 블럭 페이지번호-1로 처리   	
	  	
	<c:forEach var="cnt" begin="${boardSch.startBlock}" end="${boardSch.endBlock}">
	반복을 통해 페이지의 시작블럭과 마지막블럭 범위로 처리
	
	<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
	클릭했을 때, 해당하는 페이지 번호를 함수에 의해 호출하여 curPage를 처리한다.

	 <li class="page-item"><a class="page-link" 
	   href="javascript:goPage(${boardSch.endBlock+1})">Next</a></li>
	마지막 페이지블럭은 현재 표시되는 블럭의 마지막 페이지번호 + 1로 호출하여 처리한다.   
[하:기본코드]3. fullcalendar 환경 설정 방법을 기술하세요.
	1) fullcalendar api 다운로드 및 webapp에 해당 폴드 복사하여 화면확인.
	2) controller과 연결된 jsp 파일 만들기.
    3) 주로 사용되는 lib webapp\a00_com에 설정.
    4) jsp상단에 호출되는 부분 선언 처리..
       <link href='${path}/a00_com/lib/main.css' rel='stylesheet' />
	   <script src='${path}/a00_com/lib/main.js'></script>
	


# 오늘의 목표/주요일과
1. fullcandar를 ajax를 통해서 데이터의 리스트/등록/수정/삭제를 처리 할 수 있다.
2. fullcalendar의 각 이벤트의 특성을 이해하고 활용할 수 있다.
3. 능력단위평가 : 화면구현 포트폴리오 제출(17:00) - 조별로 취합 전달부탁드립니다
    답안항목에 "증빙자료제출"로 표기부탁드려요
    http://lms1.sist.co.kr/
    파일은 다음 이름으로 @@@_화면구현_평가.ppt 첨부해주세요.
# 궁금해하기 및 핵심키워드
1. 플러그인의 다양한 이벤트는 어떤 작용을 하며, 서버 데이터와 어떤 역할을 하는가?
    eventClick, eventDrop,eventResize,select
    events: function(info, successCallback, failureCallback){


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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)"}
		});	
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
    <h2 align='center'>{{msg}}</h2>
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