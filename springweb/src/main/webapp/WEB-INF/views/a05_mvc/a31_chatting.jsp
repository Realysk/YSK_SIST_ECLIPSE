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
<style type="text/css">
	.input-group-text{width:100%;background-color:linen;color:black;
		font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var wsocket;
		$("#enterBtn").click(function(){
			var idVal = $("#id").val();
			if(idVal==""){
				alert("아이디를 입력하세요");
				return;
			}
			if( confirm(idVal+"님 채팅방 접속합니다.") ){
				wsocket = new WebSocket("ws://localhost:7080/${path}/chat-ws.do"); // 프로젝트에는 공유 IP로 입력
				wsocket.onopen=function(evt){
					console.log(evt)
					wsocket.send("msg:"+idVal+"님 접속하셨습니다");
				};
				wsocket.onmessage=function(evt){ 
					// 서버에서 온 메시지는 받는 부분.
					receiveMsg(evt.data);
				}
			}
		});
		$("#msg").keyup(function(e){
			if(e.keyCode==13){
				wsocket.send("msg:"+ $("#id").val()+":"+$(this).val());
			}
		});
	});
	// 받은 메시지는 하단에 #chatMessageArea에 처리..
	function receiveMsg(revMsg){
		$("#chatMessageArea").append(revMsg+"<br>");
		// 입력시, 최하단으로 자동 스크롤 처리
		var mx = parseInt($("#chatMessageArea").height());
		$("#chatArea").scrollTop(mx);
		
	}
	
	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>채팅</h2>

</div>
<div class="container">
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">아이디</span>
    </div>
    <input type="text" class="form-control" id="id" placeholder="접속할 아이디 입력">
    <input type="button" class="btn btn-info" id="enterBtn" value="채팅방입장">
    <input type="button" class="btn btn-success" id="exitBtn" value="나가기">
  </div>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">메시지</span>
    </div>
    <input type="text" class="form-control" id="msg" placeholder="메시지 입력">
    <input type="button" class="btn btn-info" id="sndBtn" value="전송">
  </div>  
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">내용</span>
    </div>
    <!-- 채팅박스 -->
    <div id="chatArea" class="input-group=append">
    	<div id="chatMessageArea"></div>
    </div>
  </div>    
</div>
</body>
</html>