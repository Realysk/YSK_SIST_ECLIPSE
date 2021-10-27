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
2021-09-27
# 일일정리문제
[하:개념]1. 스프링 스프링에서 dao/mapper처리 연동 부분 매커니즘을  기술하세요
2. XXXMapper.xml VS XXXDao.java의 관계
	1) 인터페이스를 통해서 MYBATIS를 통해 실제 상속받은 클래스를 통해 실제 객체를 
		만들어 주는 관계에 있기에 특정한 코드는 연동이 가능하게 선언하여야 한다.
	2) 연동 규칙 
		xxxDao.java							XXXMapper.xml
		interface EmpDao					<mapper namespace="패키지명.EmpDao">
		public ArrayList<Emp> empList(Emp sch)	<select 속성=속성값
		1)	ArrayList<Emp>							resultType="emp"
		2) 	empList									id="empList"
		3) 	(Emp sch)								parameterType="emp"
	ex) public Emp getEmp(int empno)		<select id="getEmp"	
												resultType="emp"
												parameterType="int"
	ex) public void insertEmp(Emp ins) 		<insert id="insertEmp
												parameterType="emp"


[하:개념]2. 스프링 화면처리 MVC 패턴 구조에 대하여 기술하세요.
	1) url을 통해서 페이지명과 요청값을 전달 및 해당 하는 메서드 호출
		// url.do?name=사과&price=2500&cnt=5
		@RequestMapping("url.do")
		public String call(Product d){
						   @RequestParam("name") String name,
		
		}
	2) 호출된 메서드의 Model 매개변수에 
		d.add("모델명", "모델값");
	3) 메서드 마지막에  return 결과로 jsp/기타뷰를 호출.
		return "@@@.jsp"
	4) 화면단 호출..
		jsp 화면호출에서 el을 통해 출력 처리..	
[하:응용]3. 전날 게시판 기본 조회 화면을 구현하세요.
	1) dao/mapper 처리
	2) service단 호출
	3) controller
		모델데이터 mapping
	4) 뷰단(jsp)
		jstl과 el을 통한 출력 처리
[하:개념]4. 답변형 게시판의 주요 기능을 기술하세요.
	1) 게시물리스트
		계층형 sql을 활용한 하단의 페이지별 리스트 처리.
	2) 게시물 등록
		파일업로드
	3) 게시물 상세
		파일다운로드
		수정
		삭제
	


 
[중:응용]5. 게시판 board테이블의 기본적인 등록,수정,삭제를 처리하자. 

# 오늘의 목표
1. 스프링을 활용하여 게시판을 만드는 기본 프로세스를 정리할 수 있다.
2. 답변형 게시판에서 사용되는 핵심 기술을 기본적인 코드를 알고 활용할 수 있다.
3. vue의 환경설정을 할 수 있고, 기본 directive를 사용할 수 있다.
# 핵심키워드
1. form:form commandName="search"
2. form:select path="type" var="type"
3. CommonsMultipartResolver

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