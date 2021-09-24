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
2021-09-23
# 일일정리문제
[하:개념]1. 스프링 MVC에서 view란 무엇인가?
	스프링에서는 Model, View, Controller으로 프로그램적으로 웹 구현에 대한 역할 분담을 하고 있고,
	그 중에 view는 최종 결과를 나타내는 부분으로 jsp, html와 같은 기본 웹 화면 출력과
	json 데이터 출력, pdf/excel파일 다운로드, 첨부파일 업로드/다운로드 등 여러가지 유형으로 처리할 수 있다. 
[하:개념]2. 스프링 컨테이너의 view처리 설정 방식을 기술하세요.
	크게 두가지로
	1. 일반적인 jsp 방식 처리 InternalResourceViewResolver
		객체로 선언하여 접두어/접미어 우선순위 메서드를 설정할 수 있다.
	2. 그 외에 추가되는 bean이름으로 설정하기 위한 view
			BeanNameViewResolver  우선순위를 최우선으로 하고 있다.
		ex)  추가되는 bean이 json처리 경우 <bean id="pageJsonReport" 
	controller의 기능 메서드의 return 값으로
		 return "pageJsonReport"; //선언된 json 뷰호출
		 return "WEB-INF\\views\\a05_mvc\\a05_deptList2.jsp" // jsp 파일 호출.
		
[하:응용]3. A01_MvcController에 추가하여 Student.java를 요청값으로 등록한 내용을 json뷰를 통해 출력처리하세요.
java\springweb\a05_mvc\a01_controller\A01_MvcController.java
WEB-INF\views\a05_mvc\a06_studentAjax.jsp
[중:응용]4. 요청값을 통해 ajax로 회원등록을 하고, 등록된 회원정보 dao통해 스프링 json 뷰로 출력하세요.
            a03_dao\A04_MemberDao.java 기능 메서드 public inserMember(Member m); 추가 db처리
            1) sql 확인
            2) vo 확인
            3) dao 등록, xxxmapper 처리
            4) service단 처리
            5) controller 화면구성
            6) view단 처리..
   webapp\WEB-INF\views\a05_mvc\a07_memberAjax.jsp
   \java\springweb\a05_mvc\a01_controller\A04_MemberController.java         

# 오늘의 목표
1. 여러가지 환경 설정값을 컨테이너로 할 수 있다.
2. 스프링을 이용하여 session 처리를 할 수 있다.
3. 스프링에서 지원하는 form 태그를 활용할 수 있다.
# 핵심키워드
1. form:form commandName="search"
2. form:select path="type" var="type"
3. @SessionAttributes
4. <context:property-placeholder location		
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