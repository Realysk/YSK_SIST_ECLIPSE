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
2021-09-13
# 일일정리문제
[중:응용]1. OnEmp클래스 사원명, Map<Integer, Emp> <사원번호,사원정보>를 설정하여 컨테이너에 의해 데이터를
	출력하세요.
	<bean id="onEmp" class="diexp.vo.OnEmp" c:_0="it회사">
		<property name="map">
			<map>
				<entry key="7000" value-ref="emp01"/>
				<entry key="7001" value-ref="emp02"/>
				<entry key="7002" value-ref="emp03"/>
			</map>
		</property>
	</bean>
public class OnEmp {
	private String comName;
	private Map<Integer, Emp> map;
	public void showOnEmp() {
		System.out.println("회사명:"+comName);
		System.out.println("사원정보:"+map);
		for(int empno : map.keySet()) {
			Emp emp = map.get(empno); // key를 통해서 연결된 학생정보를 가져온다.
			System.out.print(empno+"\t");
			System.out.print(emp.getEname()+"\t");
			System.out.print(emp.getJob()+"\t");
			System.out.print(emp.getSal()+"\n");
		}		
	}		
[하:개념정리]2. autowire의 속성값을 선언하고, 각각의 내용의 차이점을 기술하세요..
	autowire : 컨테이너 내부 객체를 메모리의 연관관계를 자동을 처리하는 것을 말한다.
	1) byType : 메서드의 parameter값으로 할당되어 type이 같을 때, 자동으로 할당.
	2) byName : 메서드의 매개변수에 해당 타입으로 할당하고,  property 기준으로 이름이 같을 때, 할당된다.
	3) constructor : 생성자가 해당 type으로 할당된 것이 있을 때, 자동으로 할당.
	4) autodetect : 생성자나 메서드가 해당 type이 있을 때, 자동으로 할당.

[하:응용]3. Bus와 Driver(운전기사)를 1:1관계로 설정하고 해당 객체를 생성자를 통해서 할당할 때, autowire
        처리를 통해 설정하세요.
	public Bus(String number, Driver driver) {
		super();
		this.number = number;
		this.driver = driver;
	}    
	<bean id="driver" class="diexp.vo.Driver" c:_0="홍길동" c:_1="대형버스기사"/>
	<bean id="bus" class="diexp.vo.Bus" p:number="8000" autowire="constructor"/>
	<bean id="bus1" class="diexp.vo.Bus" c:number="8000" autowire="constructor"/>
		    
[하:개념정리]4. 컨테이너에 특정 패키지를 기준으로 객체 로딩 설정형식을 기술하세요
	<context:component-scan base-package="지정한패키지">
	1. 특정패키지기준으로 객체가 메모리 로딩되게 한다.
		- default 각 클래스마다 @Component 로 선언하면 객체가 컨테이너 메모리에 로딩이된다.
		- type을 지정하면 해당 type의 성격에 따라 객체를 컨테이너 메모리에 로딩을 해준다.
	2. context:include-filter : 필터 기준으로 포함될 내용
	   context:exclude-filter : 필터 기준으로 배제할 내용
	3. expression : 실제 쓰이는 대상이 되는 클래스 ex) Controller, Service, Repository
	
	
# 오늘의 목표
1. annotation을 활용한 객체간 의존 자동 설정을 소스 상 처리하는 것을 활용할 수 있다.
2. 컨트롤에서 ModelAttribute의 여러가지 용도를 파악하고, 처리할 수 있다.
3. ModelAndView개념을 이해하고 활용 할 수 있다.
# 핵심키워드
1. autowire, byName, byType, constuctor
2. @Autowired, @Qualifier, Required, @Resource(name="num1")
3. @ModelAttribute, ModelAndView

		
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