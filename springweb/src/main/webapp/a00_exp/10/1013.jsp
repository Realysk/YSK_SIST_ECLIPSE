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
	# 정리문제
		1. 메일 전송에 필요로 하는 환경을 알고 있고 스프링에서 설정 부분을 알고 있는가?
		
			- 네		
		
		2. 기본 메일 전송 시 필요로 하는 컨테이너 설정 부분은 어떤 것이 있는가?
		
			해당 프로세스는 구글 계정을 기준으로 진행
		
			- dispatcher-servlet.xml
				<!-- 
					# 메일 전송을 위한 서버 연동 설정
						1. Host
						2. Port
						3. 계정 : username/password
							등록한 메일주소와 패스워드
						4. 보안 설정 관련 선언
				 -->
				<bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
					<property name="host" value="smtp.gmail.com"/>
					<property name="port" value="587"/>
					<property name="username" value="${mail_user}"/><!-- 본인 정보 등록 info @@@.gmail.com -->
					<property name="password" value="${mail_pass}"/>
					<!-- 보안 관련 설정 -->
					<property name="javaMailProperties">
						<props>
							<prop key="mail.smtp.auth">true</prop>
							<prop key="mail.smtp.starttls.enable">true</prop>
						</props>
					</property>
				</bean>
			
			- info (mail_user, mail_pass)
				mail_user=XXXXX@gmail.com
				mail_pass=해당 계정의 패스워드			
		
		3. 메일 전송 시 주요 처리 내용을 생각해보자
		
			- [2]번처럼 컨테이너 설정
			
			- activation-1.1.jar 라이브러리 설치
				
			- 메일 전송 폼을 화면으로 구성
				
			- 메일 전송에 필요한 VO 작성
				private String receiver; // 수신자
				private String subject; // 제목
				private String content; // 내용			
			
			- 화면을 이동할 Ctrl 구현
				
				
			- 메일 기능의 중추적인 역할인 Serv 구현
				private JavaMailSender sender; // 메일 전송을 지원하는 객체 선언
				
				public void sendMail(Mail mail) {
					// 1. 멀티미디어형(파일/동영상등) 메일 데이터 전송 객체 생성
					MimeMessage msg = sender.createMimeMessage();
					// 2. 제목 설정
					try {
						msg.setSubject(mail.getSubject());
						// 3. 수신자 설정
						msg.setRecipient(RecipientType.TO, new InternetAddress(mail.getReceiver()));
						System.out.println("수신자 : " + mail.getReceiver());
						System.out.println("======================================== [Serv] 수신자 입력 완료 ========================================");
						// 4. 내용 설정
						msg.setText(mail.getContent());
						System.out.println("내용 : " + mail.getContent());
						System.out.println("======================================== [Serv] 내용 입력 완료 ========================================");
						// 5. 발송 처리
						sender.send(msg);
						System.out.println("======================================== [Serv] 메일 발송 ========================================");
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("메일 발송 예외 : " + e.getMessage());
					} catch (Exception e) {
						System.out.println("기타 예외 : " + e.getMessage());
					}
				}			
		
		4. 메일 전송의 여러가지 활용에 대하여 생각해 보았는가?

			- 다중에게 메일 전송 및 첨부파일 추가 가능


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