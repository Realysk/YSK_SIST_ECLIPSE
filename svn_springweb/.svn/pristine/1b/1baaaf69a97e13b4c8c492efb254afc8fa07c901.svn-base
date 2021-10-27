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
# 주간 정리 문제
1. 모델2와 모델1의 궁극적인 차이를 화면로딩 방식, 모델데이터의 활용, controller의 주요 기능을 통해서 기술하세요.
	0) 화면로딩 방식
		모델1은 jsp가 직접적으로 호출되어 처리된다.
		모델2는 controller단인 servlet을 거쳐서 view(jsp)가 호출되어  처리된다.
	1) 모델데이터 활용 : 
		모델1은 필요가 없는 경우가 많다.
		request.setAttribute("",);
		모델2는 controller단에서 반드시 선언하여야 한다.
	2) controller의 주요 기능 메서드..
		요청값 처리 : request.getParameter("요청키")
		모델데이터처리 : request.setAttribute("모델명", 모델객체);
		화면호출 : RequestDispatcher rd = request.getRequestDispatcher("이동할jsp");
			rd.forward(request,response);	
2. gson api의 기능 메서드를 기술하세요.
	Gson gson = new Gson();
	객체 ==> json문자열 : gson.toJson(객체)
	json문자열 ==> 객체 : gson.fromJson(json문자열, 클래스명.class);
3. MVC를 통한 ajax를 처리의 핵심 프로세스를 Controller, Service, Dao, View,
    Model의 소스를 나누어서 핵심 코드와 함께 설명하세요.
    Controller
    1) 초기화면 호출 : response.sendRedirect("호출할페이지");
    2) 요청값 처리 : request.getParameter()
    3) Service단 객체 생성 및 호출 : 요청값 service 전달
    4) 결과값 받아서 : response.getWriter().print(serivce.호출메서드);     
    Service
    1) 메서드 정의
    2) Dao단 객체 생성 및 메서드 호출
    3) Gson api를 이용하여 리턴된 객체를 json문자열로 변환 처리.
    	return gson.toJson(dao.XXXX);
    Dao
    1) 요청값을 service단에서 받아, DB 처리 결과를 service로 리턴한다.
   	View
   	1) 초기기본화면 구성
   	2) form요소객체 구성 처리화면
   	3) 이벤트 처리
   		var xhr =new XMLHttpRequest();
   		xhr.open("get/post", "${path}/컨트롤단 url?요청key=요청값", true);
   		xhr.onreadystatechange=function(){
   			if(상태값이 일치할 때-readyState, ..)
   				xhr.responseText
   		}
   	4) 받은 결과값을 JSON.parse()에 의해 js 객체로 변환하여 화면에 출력 처리한다. 
   			
    
    
4. MVC 패턴을 이용해서, 사원정보(Emp)의 조회 리스트를 ajax로 처리하세요.
	jspexp 프로젝트
	controller : A27_AjaxEmpCtrl.java (ajaxEmp.do)
	service : CommonService.java, 
	dao : jspexp.z01_database.A05_PreparedDao.java
			getPreparedEmpList(Emp sch)
	view : webapp\a14_mvc\a08_mvc_empAjax.jsp
	

5. dynamic web 개발환경에서 spring환경으로 처리하기 위한 필요한 내용을 기술하세요.
	1) 추가 - 라이브러리, maven, gradle
	2) springweb\src\main\webapp\WEB-INF\lib에 설정..
	3) web.xml : front컨트롤러 선언, 한글 요청값 encoding filter선언
	4) dispatcher-servlet.xml : 사용할 controller 등록
	
6. spring의 요청값과 모델 처리 기본 코드를 설명하세요.
	controller의 요청값 처리 부분
	@RequestMapping("호출할 url주소")
	public String form(@RequestParam("요청key") String 요청값받을 변수, Model d){
		d.addAttribute("모델명",모델값");
		
	}
	@RequestParam(속성="값",...) 속성의 종류
	value="요청key"
	defaultValue="요청키값 없을때 값"
	required=true/false  요청값의 필수여부


7. 아래 주소를 통해 내용이 처리되게 하세요.
	http://localhost:7080/springweb/requestexp04.do
	==> 이름:익명, 나이:0, 사는곳:입력필요
	http://localhost:7080/springweb/requestexp04.do?name=홍길동&age=25&loc=서울심림동
	==> 이름:홍길동, 나이:25, 사는곳:서울신림동
# 오늘 주요 학습 목표
1. jquery Event의 형식과 종류를 확인하고 기능 메서드를 처리할 수 있다.
2. jquery에서 지원하는 ajax를 처리할 수 있다.
# 오늘 핵심 개념 및 코드
1. $.ajax({type: "get",url: "calc.jsp",data: {v1: $("#v1").val()},
				dataType: "text",
				success: function( responseData, status , xhr ){},
				error:function(xhr, status, error){},
				complete:function(){}});
2. bean, property, constuctor
3. Resource rs = new ClassPathResource(),
   BeanFactory bean = new XmlBeanFactory(rs);		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>
  <h3 >요청값 처리 연습</h3>
  <h3 >이름:${name}</h3>
  <h3 >나이:${age}</h3>
  <h3 >사는곳:${loc}</h3>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
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