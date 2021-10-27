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
# 일일정리문제
[하:개념정리]1. IOC란 무엇이면, 가상으로 컨테이너 설정하기위해 처리할 부분을 기술하세요.
	1) Inversion of control이라는 말로 제어의 역전 즉, 인스턴스의 생성부터 소멸까지의 생명주기관리를
	개발자의 코드가 아닌 컨테이너가 대신 해준다는 뜻이다. 
		- 컨테이너 역할을 해주는 프레임워크에서 제어하는 권한을 넘겨서 개발자가 코드에서 공통이 아닌부분을 처리할 수 있어서
		개발에 대한 부담을 줄이고자 한다.
		- IOC컨테이너는 객체의 생성을 책임지고, 의존성을 관리한다. ==> autowire
	2) 컨테이너 설정을 위한 부분
		web.xml ==> dispatcherservlet 공통 front 컨트롤러 선언.
			 dispatcher-servlet.xml로 컨터이터 파일 선언.
			 필요한 lib 파일을 pom.xml(메이븐)/gradle로 받아서 설정하든지,
			 springweb\src\main\webapp\WEB-INF\lib에 위치지정

[하:응용]2. 컨테이너의 property, constructor의 차이를 기술하세요
	컨테이너의 bean 객체 생성을 위하여 선언하고, 데이터를 할당할 때,
	property는 set메서드명으로 데이터를 저장하기 위하여 사용하고,
	consturctor는 클래스에 선언한 생성자에 데이터를 할당하여, 초기값을 설정할 때 사용한다.
	
[하:응용]3. Note와 Pencil 클래스를 선언하고, 1:1관계의 내용을 a18.xml, D18.java를 통해서 설정하여 출력하세요.
	<bean id="pc" class="diexp.vo.Pencil">
		<property name="kind" value="4B연필"/>
	</bean>
	<bean id="note" class="diexp.vo.Note">
		<constructor-arg value="스케치용 노트"/>
		<property name="pc" ref="pc"/> <!-- note.setPc(pc); -->
	</bean>
[중:응용]4. Computer와 PartDevice(컴퓨터부품(추상클래스) 하위 상속 Ram, Hdd, Cpu) 클래스를 선언하고, 
            1:다관계의 내용을 a18.xml, D18.java를 통해서 설정하여 출력하세요.
     다형성 처리 PartDivice pd = new Ram();       
     다형성 처리 PartDivice pd = new Hdd();
     plist.add(new Ram());       
     plist.add(new Hdd());       
     plist.add(new Cpu());
            
     class Computer
     	ArrayList<PartDevice> plist;
     abstract PartDevice class{
     	private String device;
     	PartDevice(String device){
     		this.device = device;
     	}
     	public void showDice(){
     		System.out.println("부품종류:"+device);
     	}
     }
     class Ram extends PartDevice{
     	  Ram(){
     	  	super("램");
     	  }
     }
     
     	       

# 오늘의 목표
1. collection 객체 컨테이너 설정 방법을 처리할 수 있다
2. 여러가지 namespace로 컨테이너에서 객체를 활용할 수 있다.
3. autowire의 설정과 여러가지 속성값을 활용 할 수 있다.
4. 자동 패키지 단위 객체 등록을 컨테이너 단위로 설정할  수 있다.
5. annotation을 활용한 객체간 의존 자동 설정을 할 수 있다.
# 핵심키워드
1. autowire, byType, byName, constructor, autodetect
2. context:component-scan base-package, annotation, assignable, regex, aspectj
3. @Autowired, @Qualifier, 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

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