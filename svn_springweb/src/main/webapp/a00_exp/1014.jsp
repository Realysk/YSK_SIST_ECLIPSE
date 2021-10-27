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
2021-10-14
# 지난시간 주요 내용 점검
1. 웹에서 채팅을 수행하기 위해, 서버와 클라이언트는 어떤 처리를 하는지 아는가?
	client  <=========>	socket 통신 server
	1) 일반적인 웹서비스는 요청했을 때, 해당 요청의 결과로 페이지를 처리해준다.
	2) 웹 소켓통신은 하나의 클라이언트 특정한 데이터를 보내었을 때,
		접속한 모든 클라이언트에게 push방식으로 데이터를 전송해준다.

2. 채팅을 위한 컨테이너는 어떤 설정을 하는가?
	view단에 event를 통해서 push방식을 처리할 수 있게끔, 
	handler와 adapter가 선언되어 있어야 한다.
	<!-- 웹 소켓 통신을 위한 선언 
	1. 핸들러 선언을 위한 처리 -->
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping"/>
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter"/>
	<mvc:default-servlet-handler/>
	<!-- 
	2. client단에서 js와 연동되는 handler를 url로 mapping
	 -->
	<websocket:handlers>
		<websocket:mapping handler="chatHandler" path="/chat-ws.do"/>
	</websocket:handlers> 	
	front단에서 backend단의 handler와 연동이 되게 선언..
	wsocket = new WebSocket("ws://아이피주소입력(원격처리시):7080/${path}/chat-ws.do");
	
3. 채팅 처리를 위하여 backend/frontend단을 구분하여 각 기능을 알고 있는가?
                
	handler(backend의 핸들러 클래스)	js(frontend의 js 기능메서드.)
	afterConnectionEstablished		onopen
	handleTextMessage
		TextMessage message			send("전송될 메시지") :메시지를 전송할 때. 
		sendMessage(클라이언트보낼메시지)onmessage : 메시지가 서버 왔을 때
	afterConnectionClosed			onclose
	

4. socket 통신을 활용하여 다양한 응용을 할 수 있는가?
	# push방식의 웹서비스를 활용할 수 있다.
	ex) 접속한 모든 사람에게 특정한 공지 메시지/긴급 메시지를 보낼 때,
	상단에 "메시지가 왔습니다."를 표기할 때도 활용할 수 있다.


# 오늘의 목표/주요일과
1. 웹 화면에서 다국어란 어떤 기능인지 알고, 스프링을 통하여 다국어를 처리할 수 있다.
2. spring form 태그란 어떤 기능인지 알고, 이를 활용하여 보다 효과적으로 화면 구현을 할 수 있다.


# 궁금해하기 및 핵심키워드
1. 효과적인 모델과 요청객체를 처리할 수 있는 방법은 없을까?
2. 메시지를 이용하여 화면의 여러가지 텍스트를 언어에 따라 구현하는 방법이 없을까?

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