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
[중:응용]1. jquery Ajax를 활용하여 회원정보를 조회/등록처리하세요.
	(jspexp\a02_mvc\A27_AjaxController.java 활용)

[하:개념정리]2. 스프링의 요청값 get/post방식처리에 있어서 controller단와 화면단 form설정과의 관계를 기술하세요.
	1) controller단 
		@RequestMapping("url매핑") : get/post 둘다 처리, 매개변수로 구분 가능..
		@GetMapping("url매핑") : get방식 처리
		@PostMapping("url매핑") : get방식 처리
	2) 화면단 form 처리
		<form 속성>
		1. 속성으로 method에 속성값으로 get방식/post방식 선언.
			선언되지 않으면 default로 get방식으로 전송된다.
		2. 속성 action으로  "url매핑"를 선언할 수 있다.
			선언하지 않으면 현재 화면을 호출한 jsp나 controller의 url매핑주소로 호출된다.
			ex) login.jsp ==> result.jsp  default action은 	login.jsp
			ex) call.do ==> result.jsp default action으로는 call.do
		***3. 만약에 get방식으로 요청값을 가지고 호출되었다면 
			다시 호출될 때, post방식으로 요청하더라도 주소에 ?key=value가 남아 있는 경우가
			있다. 이 때, 원하는 post방식으로 처리할려면 action값 명시적으로 지정하여야 한다.

[중:응용]3. 회원가입입력화면을 GET방식을 호출하고, 입력처리를 POST방식으로 처리할려고 한다. spring요청방식을 통해 처리하세요.
			@GetMapping("regmember.do")
				0909.jsp
			@PostMapping("regmember.do")
				0909_1.jsp
	// http://localhost:7080/springweb/regmember.do	
	@GetMapping("regmember.do")
	public String regmemberGet() {
		return "a00_exp\\0909.jsp";
	}
	@PostMapping("regmember.do")
	public String regmemberPost() {
		return "a00_exp\\0909_1.jsp";
	}	
	
[하:응용]4. 물건등록화면에서 물건등록은 요청하여 처리하되, controller단에서 요청값을 객체로 받아서 출력되게 처리되게 하세요.
	
[하:응용]5. DI13.java, a13.xml을 만들고, 회원정보를 xml을 통해서 등록하고, 등록된 내용을 DI13.java를 통해서 출력하세요.
==> 할 수 있는 데까지 진행하시고, 전날 내용 중, 자세한 설명이 필요한 부분 제출과 함께 메시지 보내주세요.
# 오늘의 목표
1. DI의 개념을 확인하고, 생성자를 활용 할 수 있다.
2. DI의 객체 참조와 List형 객체를 활용 할 수 있다.
3. autowire의 설정과 여러가지 속성값을 활용 할 수 있다.
4. 자동 패키지 단위 객체 등록을 컨테이너 단위로 설정할  수 있다.
# 핵심키워드
1. IOC, DI
2. constructor-arg, property, ref bean
3. autowire, byType, byName, constructor, autodetect		
		--%>	
	});
</script>
</head>

<body><div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">연습예제</h2>
</div>
<div class="container">
    <h2 align='center'>물건등록처리</h2> <%-- 물건 등록 처리 controller에 객체로 요청값 전달.. --%>
	<form id="frm01" class="form-inline" action="${path}/regProduct.do" method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="물건명" name="name"/>  	
	    <input class="form-control mr-sm-2" placeholder="가격" name="price"/>  	
	    <input class="form-control mr-sm-2" placeholder="갯수" name="cnt"/>  	
	    <button class="btn btn-info" type="submit">물건 등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
      <tr class="text-center">
        <th class="table-success">물건명</th><td>${prod.name}</td>
        <th class="table-success">가격</th><td>${prod.price}</td>
        <th class="table-success">갯수</th><td>${prod.cnt}</td>
      </tr>
	</table> 
    <h2 align='center'>회원가입(get방식에 의해 호출)</h2>
	<form id="frm01" class="form-inline" action="${path}/regmember.do" method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <button class="btn btn-info" type="submit">포스트방식 호출</button>
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