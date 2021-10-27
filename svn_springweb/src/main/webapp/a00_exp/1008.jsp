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



# 일일정리문제
[하:개념]1. plugin 프로그램을 이용하여 json데이터를 controller단을 통해서 
	가져올 수 있는 백앤드단  처리 내용을 기술하세요
	sql ==> dao ==> mappper
	json데이터 처리 방식 1) RestController 2) view pageJsonReport 활용.
	ex) @RestController 활용
		@RequestMapping("calList.do")
		public List<Calendar> calList() {
			return calservice.calList();
[하:기본코드]2. fullcanlendar api에서 사용되는 json 데이터와 주요이벤트에 대하여 기술하세요.
		 	# json데이터 서버에서 가져오는 부분.
			events: function(info,successCallback, failureCallback){
			1. 서버와 ajax를 통해서 화면에 일정 데이터를 json으로 가져오는 부분.
			2. successCallback : 결과화면에 데이터를 전달할 함수는 매개변수로 전달 된 부분.
				successCallback(실제데이터);
    	  		$.ajax({
    		  		url:"${path}/calList.do",
    		  		success:function(data){
    		  			// 1. RestController 사용시.
    		  			successCallback(data);
    		  			// 2. view pageJsonReport 활용.
    		  			successCallback(data.모델명);
    		  		}	
    		# 주요이벤트..
    		select: function(arg) : 클릭, 스크롤로 선택시로 일정이 없는 곳에 해당 
    			이벤트를 했을 때, 등록이 되게 처리한다.	  	
    		eventClick: function(arg) { : 등록된 특정한 일정을 클릭시, 처리되는 내용.
    				

[하:기본코드]3. 데이터를 가져올 때, 사용되는 속성과 매개변수와 ajax 처리 형식을 기술하세요.
	eventClick: function(arg)
		arg.event

	allDay: true
	allow: null
	backgroundColor: "#0099cc"
	borderColor: (...)
	classNames: (...)
	constraint: (...)
	display: (...)
	durationEditable: (...)
	end: (...)
	endStr: (...)
	extendedProps: (...) : 기본 api에서 확장된 일정을 처리할 때, 사용된다. content
	groupId: (...)
	id: (...)
	overlap: (...)
	source: (...)
	start: (...)
	startEditable: (...)
	startStr: (...)
	textColor: (...)
	title: (...)
	url: (...)
	
	$.ajax({
    	type:"post",
    	url:"${path}/calendarInsert.do",
    	data:$("form").serialize(), // 등록할 요청값을 전달.
    	success:function(data){	
    		서버에서 온 데이터 처리..
[하:기본코드]4. 등록시, 모달창로딩 처리방법과 특정 일정 클릭시, 받는 매개변수를 기술하세요.
	모달창 선언 div
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	모달창 호출 : 아래 속성이 있는 대상 객체를 클릭시, 호출.. 
		<h2 data-toggle="modal" data-target="#exampleModalCenter"></h2>  
	js로 강제 click이벤트 수행..
		이벤트별로 강제 실행. $("h2").click();		
	등록된 특정 일정 클릭시, 받는 매개변수 처리.
		eventClick: function(arg)
			arg.event
	

# 오늘의 목표/주요일과
1. fullcandar를 ajax를 통해서 데이터의 상세내용/수정/삭제를 처리 할 수 있다.
2. spring에서 처리하는 메일 프로세스를 이해하고, 메일을 전송처리하는 프로그램을 만들 수 있다.
3. 프로젝트 진행 처리이슈
	역할 분담과 포트폴리오 면접..
	- pms **일정(gant,프로젝트관리,내작업목록)



# 궁금해하기 및 핵심키워드
1. 어떠한 이벤트를 통해서 효과적인 화면 처리를 할 수 있는가?
eventClick:function(info,element)
eventDrop:function(info)
eventDragStop:function(info)
eventResize:function(info)
2. 선택시 매개변수로 받는 데이터는 어떤 것이 있으면 이것을 통해 상세/수정/삭제에 어떻게 활용되는가?
eventClick:function(info,element)

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
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

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