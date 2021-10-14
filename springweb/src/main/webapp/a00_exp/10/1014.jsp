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
	# 일일문제
		1. 웹에서 채팅을 수행하기 위해 서버와 클라이언트는 어떤 처리를 하는지 아는가?
		
			- 웹 소켓 서버에 대한 이해
				- 메세지나 여러가지 멀티미디어 데이터를 실시간으로 서어베 전달하면 해당 서버는 웹 소켓 서버에 접속한 클라이언트에게 PUSH 방식으로 전송을 한다.
				- 이 때, 각 클라이언트는 서버에 핸들러 기능메서드와 동기적으로 JS를 통해서 특정한 메시지를 처리해준다.			
		
		2. 채팅을 위한 컨테이너는 어떤 설정을 하는가?
		
			<!-- 
				웹 소켓 통신을 위한 선언
				1. 핸들러 선언을 위한 처리
			 -->
			 <bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping"/>
			 <bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter"/>
			 <mvc:default-servlet-handler/>
			 <!-- 
			 	2. Client단에서 JS와 연동되는 Handler를 URL로 Mapping
			  -->
			  <websocket:handlers>
				<websocket:mapping handler="chatHandler" path="/chat-ws.do"/>		  
			  </websocket:handlers>
		
		3. 채팅 처리를 위해 back/frontend단을 구분하여 각 기능을 알고 있는가?
		
		handler								js
		afterConnectionEstablished			onopen
		handleTextMessage					send("전송될 메세지") : 메세지를 전송할 때
		sendMessage (클라이언트에 보낼 메세지)		onmessage : 메세지가 서버로부터 왔을 때
		afterConnectionClosed				onclose			
		
		4. socket 통신을 활용하여 다양한 응용을 할 수 있는가?
		
			
		
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>REALYSK</title>
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