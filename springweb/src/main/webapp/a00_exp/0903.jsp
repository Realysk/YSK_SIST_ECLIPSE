<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
/*aquamarine bisque*/
	.input-group-text{width:100%;
		text-align:center;background-color:#cfffdf;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("h2").click(function(){
			$("#dialog").dialog("open");
		});	
		$( "#dialog" ).dialog({
			autoOpen:false,
			modal:true,
			buttons:{
				"기능버튼":function(){
					alert("버튼클릭!");
				}
			}
		});				
	});
</script>
</head>
<%-- 
# 
# 정리문제
1. $("form").serialize()는 어떤 역할을 하는지 기술하세요.
   form객체의 내용을 ajax에서 요청값으로 처리할 때, 보다 효과적으로 key=value형식을 처리하기위한 메서드..
   form 하위에 있는 모든 요소들의 name, value 속성을 한글 encoding까지 처리하여 key=value&key=value
   형식을 만들어주는 메서드이다.
2. ajax로 하나의 프로그램을 처리(등록,수정,삭제)할 때, 필요한 내용을 js단, controller, service, dao단을 나누어
    설명하세요
    기능버튼을 통한 처리..
    1) 클릭시,(js처리)
    	- $("[name=proc]").val("등록/수정,삭제 구분값 설정");
    	- ajax를 위한 XMLHttpRequest 객체 생성.
    	- xhr.open("get/post","${path}/컨트롤단호출?요청키=요청값..",true);
    	- xhr.send();
    	- xhr.onreadystatechanage=function(){
    		  상태조건 결과 xhr.responseText
    	  }
    2) controller(호출 uri(@@@.do))
    	- 요청값 처리 (request.getParameter("요청키"))
    		여러기능일 때, 요청 proc를 받아온다.
    	- proc의 조건에 따라서 service단의 메서드 호출
    3) service단  ==> dao단 호출
    	- 요청값을 받아서, dao 호출.
    	- dao의 결과메서드 객체 gson 객체에 의해서 json데이터로 변환 return값 처리..
    4) controller(서비스단 return된 json데이터)
    	- response.getWriter().print(service.기능메서드()); - json데이터 client에 전달.
    5) view단..
    	-  xhr.responseText 위의 	out.print("json데이터")를 문자열로 받아서,
    	-  var obj = JSON.parse(xhr.responseText);
    	객체를 받아서 화면에 DOM에 입력 처리한다.	
    	
    
    
    
3. 기본 스프링 개발환경을 설정할 때, 필요한 부분을 기술하세요.
	1) 추가 lib 추가 - maven(pom.xml), gradle은 온라인 상으로 받아서 처리할 수 있게 한다.
		- springweb\src\main\webapp\WEB-INF\lib에 추가하여 사용.
	2) web.xml : 스프링 기본 구조 선언
		(컨테이너,  front controller 호출 방식)
		ex) @@@.do로 끝나면 지정한 front controller인 dispatcherservlet을 
			호출하겠다. 컨테이너(@@@.xml)을 선언
				


4. 스프링에서 front controller란 무엇을 말하는가?    
	1) 스프링에서 모든 요청페이지가 호출되면 처리되는 컨테이너(dispatcher-servlet.xml)과
		연결되어 있는 컨트롤러를 말한다.
	2) 요청값이나 세션, 모델처리등을 효과적으로 처리할 수 있게 spring 프레임웍크에서 지원하고 있다.
		org.springframework.web.servlet.DispatcherServlet
		
	3) web.xml에서 선언하고, url 패턴 방식이나 컨테이너를 호출할 수 있게 한다.
	# 주의 
	front controller 단에서 servlet이 실행되기에, 일반 정의된 controller에서
	실행을 해서 화면을 호출할 수 없다. 다만 url을 통해서 호출이 가능하다.
	// http://localhost:7080/springweb/start.do
	@GetMapping("start.do")	
	

5. http://localhost:7080/springweb/call.do
    1) 7080 : 어디에서 설정하는 내용인가? tomcat서버의 http/1.1 port 설정부분과 동일하여야 한다.
    2) springweb : 어떤 기준을 통해서 설정되는가? 프로젝트명으로 context명으로 설정된 것을 말한다.
    	server.xml에서 자동 설정되어 있는 경우가 많다.
    	<Context docBase="springweb" path="/springweb" reloadable="true" source="org.eclipse.jst.jee.server:springweb"/></Host>
    3) call.do 와 연결되는 부분을 controller, view가 처리되는 과정을 
    web.xml, dispatcher-servlet.xml, 컨트롤러.java, 화면view.jsp를 활용하여 기술하세요.
    	web.xml : 	<servlet-mapping>
					<servlet-name>dispatcher</servlet-name>
					<url-pattern>*.do</url-pattern>
				.do로 끝나는 url은 front 컨트롤단으로 처리되고,
				dispatcher-servlet.xml에 등록된 해당 패턴의 컨트롤러의 메서드를 찾는다.
		dispatcher-servlet.xml
			일단 컨트롤러 클래스가 패키지명과 클래스명으로 등록되어 있어야 한다. 
			==> tomcat이 로딩이 되고, 해당 url을 호출하는 순간 등록된 모든 클래스는 메모리에 로딩되어
			객체가 생성된 상태에서 시작한다.	
			==> 추후에는 자동등록 설정값으로 특정 패키지와 @(어노테이션) 패턴으로 등록이 된다. 	
		controller 클래스와 메서드
			@Controller로 되어 있고,
			각 메서드의 상단에 해당 url패턴이 설정되어 있어야지, 해당 기능 메서드를 찾아간다.
			@GetMapping("call.do")
			public String call(Model d){
				d.addAttribute("모델명", 객체);
				return "화면jsp를 호출"; // forward방식으로 특정 view를 호출한다.
			}
				
    
    
6. springweb2로 다이나믹 웹프로젝트를 만들고, 
    http://localhost:7080/springweb2/restart.do로 모델데이터가 출력되는 스프링환경의 화면을 구현하세요.
# 주요 목표
1. 스프링 MVC화면에서 요청값과 모델 데이터를 처리할 수 있다.
2. 스프링 MVC의 DI패턴을 설정하고 해당 개념에 의해 객체를 생성하고 property를 사용할 수 있다.
# 주요 개념 및 코드
1. IOC, DI, 
2. Resource rs = new ClassPathResource()
3. BeanFactory bean = new XmlBeanFactory(rs);
4. @RequestMapping, Model, addAttribute(), ModelAndView
--%>
<%

%>
<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>
</div>
<div class="container">
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
</body>
</html>