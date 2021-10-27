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
# 일일정리
[하:프로세스정리]1. MVC 패턴을 리스트, 입력, 수정, 삭제를 할려고 한다. view단과 controller단에 처리할 내용과 조건 프로세스를
    정리해보자.
    MVC패턴을 활용한 데이터처리..
    1. 하나의 controller를 통해서 조회, 입력, 수정, 삭제를 처리할려면, controller단에서는
    	process로 요청값을 통해서 처리하여야 한다. 
    	ex) proc : list(전체조회리스트), insFrm(등록처리화면), insert(DB등록처리), 
    		detail(상세화면,상세정보DB), update(수정DB처리), delete(삭제DB처리)
    	String proc = request.getParameter("proc");
    2. view단에서 위에 proc를 기능처리시, 위 proc 내용을 요청값을 전달하여야 한다.
    	<input type="hidden" name="proc"/>
    	$("기능버튼").click(function(){ 
    		$("[name=proc]").val("기능proc");
    		$("form").submit(); 
    	});
    3. proc별로 조건 처리(controller처리)
    	null/list 일 때, 초기list화면 model 데이터는 list dao/service호출 처리
    	insFrm 일 때, 등록 화면 호출, model (X), service(X)
    	insert 일 때, 등록 dao, service 처리, 등록 화면 호출
    	datail 일 때, 단위 dao호출, service, model(o), 상세 화면 호출
    	update 일 때, 수정 dao호출, 상세 dao호출, service(수정/상세), model, 상세 화면 호출
    	delete 일 때, 삭제 dao호출, 상세 화면 호출
    # 진행 단계
    1. 프로세스 정리
    2. 핵심 코드 정리
   	3. 실제 코드 작성
   	4. 에러 트래킹 및 완성
    
[하:키워드조회]2. 전날 MVC ajax로 만들어진 사원정보리스트에서 key입력시, 대문자로 변환 및 바로 조회가 되게 처리하세요.
	if(event.keyCode==13) // 주석처리, $(this).val( $(this).val().toUpperCase());
[상]3. 현재 부트스트랩 템플릿은 타이틀을 클릭시, 모달창이 뜨게 된다. 이것을 이용해서 등록버튼은 만들어 사원정보 
        등록 화면을 만들고, ajax로 등록되게 하세요.(기존controller/serivce,dao활용)
[하:키워드]4. 한 요소객체에 여러 개의 이벤트를 적용할려고 한다. 기본 형식을 정리하세요.
	$("선택자").on({
		"이벤트1":function(){ 이벤트1일 때, 처리할 내용...},
		"이벤트2":function(){},
		"이벤트3":function(){},
		"이벤트4":function(){}
	});

[하]5. h1을 클릭시 배경색상이 변하고, 더블클릭시 alert()창이 뜨게 처리하세요.
--%>
	$("h1").on({
		"click":function(){	$(this).css("background","yellow"); },
		"dblclick":function(){ alert("더블 클릭!!"); $(this).css("background","");}
	})
<%--
[하:키워드]6. 마우스관련 이벤트를 정리하세요
	$("요소객체").on("mousedown",function(){});
	mousedown : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고, 마우스 버튼을 눌렀을 때 발생
	mouseup : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고, 마우스 버튼을 놓을 때 발생
	mousemove : 모든 엘리먼트, 마우스 포인터가 엘리머트 내부에서 움직일 때 발생
	mouseover : 모든 엘리먼트, 마우스 포인터가 엘리먼트 안으로 이동할 때 발생
	mouseout : 모든 엘리먼트, 마우스 포인터가 엘리먼트에서 벗어날 때 발생.

[중]7. 숫자1~9까지 있는 3X3 테이블만들고,  해당 셀을 클릭시, 글자가 커지고, 마우스커서가 위치시켰을 때 배경색상이 바뀌고,
    마우스커서가 해당 셀을 벗어날때 원래 색상으로 돌아오게 처리하세요.
--%>
	$("#tab3 td").each(function(idx,ele){
		$(ele).text(idx+1);
	});
	$("#tab3 td").on({
		"click":function(){ console.log("처리"); $(this).css("font-size","30pt") },
		"mouseover":function(){	$(this).css("background","pink") },
		"mouseout":function(){ $(this).css("background","");$(this).css("font-size","");}
	});
<%--    
[중]8. 전날 마지막예제 좋아요/싫어요 처리 소스를 확인하고, 숫자를 ♥의 갯수로 표현하세요.z02_jquery\a05_event\a01_basic.jsp
# 오늘의 목표
1. jquery의 여러가지 이벤트를 실습을 통해, 정확하게 기능을 파악하고 활용할 수 있다.
2. jquery를 활용한 ajax의 주요 속성을 알고, mvc를 통해 처리할 수 있다.
3. 스프링의 객체를 활용한 요청값을 처리하고, 공통 모델의 개념을 알고 처리할 수 있다.
4. 스프링의 DI 개념을 알고, 기본 환경을 설정하고 처리할 수 있다.
# 핵심키워드
1. hover, toggleClass, trigger
2. $.ajax({속성:속성값}), type, url, data, dataType, success, error,complete
3. IOC, DI




		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>
  <h1>click/double click</h1> 
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" type="button">등록</button>
 	</nav>
	</form>
	
	<table id="tab3" class="table">
		<tr class="text-center"><td></td><td></td><td></td></tr>
		<tr class="text-center"><td></td><td></td><td></td></tr>
		<tr class="text-center"><td></td><td></td><td></td></tr>
	</table>
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
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" id="id" placeholder="아이디 입력" name="id">
	      </div>
	      <div class="col">
	        <input type="password" class="form-control" placeholder="이름 입력" name="name">
	      </div>
	    </div> 
	    <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
	      </div>
	      <div class="col">
	        <input type="password" class="form-control" placeholder="Enter password" name="pswd">
	      </div>
	    </div>

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