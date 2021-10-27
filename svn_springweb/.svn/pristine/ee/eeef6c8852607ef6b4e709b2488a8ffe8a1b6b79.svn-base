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
		
		--%>	
	});
</script>
</head>

<body>
<%-- 
# 일일정리문제
[하:용용]1. component-scan의  base-package vo8을 다른 속성설정 없이 객체를 호출처리하세요.
<context:component-scan base-package="diexp.vo8"/>
default 객체 호출로 Component를 annotation으로 설정하면 된다.
@Component("p01")
public class Person {}
 
[하:용용]2. component-scan의  base-package vo9을 Buyer와 Product의 1:1 
          autowiring 처리하여 출력하세요
@Controller
public class Buyer {
	private String name;
	@Autowired
	private Product product;
<context:component-scan base-package="diexp.vo9">
	<context:include-filter type="annotation" 
		expression="org.springframework.stereotype.Controller"/>
	          
          
[중:용용]3. component-scan의  base-package vo9에 소스상의 autowiring 처리를 할려고 한다.
    ZergUser(이름), Larba(추상클래스) -(상속) Dron, Zerggling, Hydra 구조를 만들고,
    Autowiring 처리하세요.    
	@Controller
	public class ZergUser {
		private String userName;
		@Autowired
		@Qualifier("hydra")
		private Larba unit;
	
	    
[하:개념 및 응용]4. @ModelAttribute는 어떤 역할을 하는지 기술하고, Member 등록화면과 
     등록된 내용을 출력하세요.
	@ModelAttribute
	1) 요청값과 모델을 같이 처리한다.
	2) controller의 공통 모델을 선언하여, 활용할 수 있게 한다.
	// http://localhost:7080/springweb/memberReg.do
	@RequestMapping("memberReg.do")
	public String memberReg(@ModelAttribute("mem") Member m) {
		return "WEB-INF\\views\\a01_basic\\a11_modelAttr.jsp";
	}
    <tr><td>${mem.id}</td><td>${mem.name}</td>
    		<td>${mem.auth}</td><td>${mem.point}</td></tr>		
	
# 오늘의 목표
1. ModelAndView를 개념을 알고, 처리할 수 있다.
2. spring에서 redirect와 forward를 구분할 수 있다.
3. 데이터베이스 연동을 위한 컨테이너 환경을 알고, 처리할 수 있다.
4. Mybatis의 Dao단과 XXXMapper.xml의 연동 규칙을 알고, 활용할 수 있다.
# 핵심키워드
1. BasicDataSource, driverClassName, ur, username, password
2. MapperScannerConfigurer
3. typeAlias alias="emp" type=""
4. resultMap type="emp"		
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