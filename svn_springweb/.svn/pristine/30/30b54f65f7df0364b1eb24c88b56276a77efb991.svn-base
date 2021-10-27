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

2021-09-10
# 일일정리문제
[하:개념정리]1. 스프링 개발 환경에 사용하는 lib 설정 형식 3가지를 기술하세요.
	dynamic web 프로젝트 : WEB-INF 하위 lib에 @@.jar 선언한 파일 설정..
	maven : pom.xml를 지정된 xml형식으로 온라인으로 lib파일들을 받아서 설정 처리..
	gradle : gradle 파일로 지정된 온라인으로 lib파일을 다운 받아서 처리한다.	

[하:개념정리]2. 스프링에서 aop란 무엇인가? 개념을 찾아보고 기술하세요
 	AOP : Aspect Oriented Progamming의 약자로 관점 지향 프로그램을 말한다.
 	컨테이너 기반으로 객체가 로딩된 상황에서 특정한 프로그램이 시행되는 시점을 기준으로
 	처리할 때 사용된다.
[하:개념정리]3. 스프링 컨테이너의 구조체 선언 3가지 방식에 대하여 예제를 통해서 기술하세요.
	# 컨테이너 호출 방식
		1. xml컨테이너 호출(구전젼)
		Resource rs = new ClassPathResource("diexp\\di10\\a11.xml");
		BeanFactory bean = new XmlBeanFactory(rs);
		2. xml컨테이너 호출방식
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di10\\a10.xml");
		Object obj2 = ctx1.getBean("obj", Object.class);
		3. 객체로된 컨테이너 호출방식
		AnnotationConfigApplicationContext ctx2 = 
		    new AnnotationConfigApplicationContext(Con18.class);
		Person p01 = ctx2.getBean("메서드명", Person.class);
		==> springboot : 파일에서 바로 선언하여 사용.
	# 컨테이너내에 구조체(Collections)
		List	: <list>
		Set	: <set>
		Map<key,value> <map>
		Properties	<prop>
	
[하:응용]4. Bus클래스에 Set<String>버스번호 Properties를 통해 시작/종점을 처리하게 하고, 
container에 설정하여 처리하세요.main\java\diexp\Con10.java(자바형태컨테이너)를 설정해서 처리되게 하세요
 	<bean id="bus" class="diexp.vo.Bus">
		<property name="numbers">
			<set>
				<value>3003</value>
				<value>7700</value>
				<value>7650</value>
			</set>
		</property>
		<property name="section">
			<props>
				<prop key="3003">서울~수원</prop>
				<prop key="7700">서울~인천</prop>
				<prop key="7650">부평~강남</prop>
			</props>
		</property>           
		Bus bus = ctx1.getBean("bus",Bus.class);
		System.out.println(bus);


[하:개념정리]5. 컨테이너의 namespace 선언방식을 생성자와 property를 나누어 설명하고, 물건정보를 
		기본 예제로 처리해보세요. 
	xmlns:p="http://www.springframework.org/schema/p"
	xmlns:c="http://www.springframework.org/schema/c"

	<bean c:매개변수명="데이터할당" (생성자)
		  c:_0="데이터할당"  (생성자)
		  p:프로퍼티명="데이터할당" (set프로퍼티명(할당데이터)메서드)
 	<!-- Product prod2 = new Product("바나나",3000,3); --> 
	<bean id="prod2" class="diexp.vo.Product"	c:_0="바나나" c:_1="3000" c:_2="3"/>
	<bean id="prod3" class="diexp.vo.Product"	p:name="오렌지" p:price="2000" 
		p:cnt="2"/>
				
		
[중:응용]6. OnSchool클래스 학교명, Map<Integer, Student> stus로 <번호,학생정보>를 설정하여 
	컨테이너에 의해 데이터를 할당하여, 해당 학교, 번호, 학생정보를 출력하세요. 
[하:개념 및 확인예제]7. autowire란 무엇인가? 개념을 정리하고, Note와 Pencil을 기준으로 처리해보세요..
	autowire는 컨테이너에서 객체와 객체간의 연관관계 할당 메서드가 있을 때,
	자동으로 설정에의해서 할당 처리되게 하는 것을 말한다.

# 오늘의 목표
0. 스프링의 특정한 메모리에 객체들이 로딩된다면 이 객체들 간에 할당처리를 어떻게 하면 효과적인가를 생각할 수 있다
1. autowire의 여러가지 속성값을 활용하고, 소스단위 autowiring 처리 방법을 알고 활용 할 수 있다.
2. 자동 패키지 단위 객체 등록을 컨테이너 단위로 설정할  수 있다.
3. annotation을 활용한 객체간 의존 자동 설정을 할 수 있다.
4. 컨트롤에서 ModelAttribute의 여러가지 용도를 파악하고, 처리할 수 있다.
5. ModelAndView개념을 이해하고 활용 할 수 있다.
# 핵심키워드
1. autowire, byName, byType, constuctor
2. @Autowired, @Qualifier, Required, @Resource(name="num1")
3. @ModelAttribute, ModelAndView

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
	});
</script>
</head>

<body>
<%-- 
		
--%>	
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