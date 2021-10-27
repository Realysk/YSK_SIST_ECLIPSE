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
2021-10-12
# 지난시간 주요 내용 점검
1. 메일 전송에 필요로 하는 환경을 알고 있고, 스프링에서 설정 부분을 알고 있는가?
	메일 서버 구축(SMTP-발송서버)
	웹에서 form전송 부분(client) ==> **스프링웹서버(SMTP서버 연동 설정) 
	==> 메일 서버 ==> 수신 계정에 전송 
	스프링 컨테이너 : 메일관련 lib를 추가, 객체로 mailsender 선언..
	각 메일서버(gmail, naver, daum)의 SMTP 설정 처리.. 확인 - 보안
2. 기본 메일 전송 시, 필요로 하는 컨테이너 설정 부분은 어떤 것이 있는가?
	컨테이너에 특정한 메일서버에 계정으로 접근하여 처리할 수 있게 하고,
	메일 form내용을 전송시, 해당 service에서 Autowired로 객체의 여러가지 속성을 활용하여,
	제목/전송대상/내용 기타 속성을 선언하여 처리할 수 있다.
	<bean id="mailSender" 
		class="org.springframework.mail.javamail.JavaMailSenderImpl">
		<property name="host" value="smtp.gmail.com"/>
		<property name="port" value="587"/>
		<property name="username" value="${mail_user}"/><!-- 본인 정보 등록 info @@@.gmail.com -->
		<property name="password" value="${mail_pass}"/>
		<!-- 보안 관련 설정 -->
		<property name="javaMailProperties" >
			<props>
				<prop key="mail.smtp.auth">true</prop>
				<prop key="mail.smtp.starttls.enable">true</prop>			
			</props>
		</property>
	</bean> 	
3. 메일 전송시 주요 처리 내용을 생각해보자.
	1) 초기 화면 form 호출 controller 생성
	2) 초기 화면 form view 구성
	3) 전송 시, controller 선언
	4) 전송된 내용 service단에서 컨테이너에서 선언한 객체 autowiring으로 호출하여,
		속성으로 요청받을 값을 VO로 mapping하여 처리한다.
4. 메일 전송의 여러가지 활용에 대하여 생각해 보았는가?
	ex) 회사 계정 생성시, 관리자가 초기 등록 계정과 임시비밀번호 전송
	비밀번호나 계정명 잊어버렸을 때, 해당 메일로 발송 처리..
	다중 메밀 발송 처리 등..
	

# 오늘의 목표/주요일과
1. spring에서 처리하는 채팅을 위한 websocket을 이해하고, 처리 프로세스를 이해한다.
2. 채팅을 위한 서버단 처리와 클라이언트단 처리 내용을 구분하여 처리할 수 있다.

# 궁금해하기 및 핵심키워드
1. 채팅을 위한 socket 서버와 클라이언트는 어떤 기능을 제공하는가?



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