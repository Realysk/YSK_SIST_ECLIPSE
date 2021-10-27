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
# 만들어질 동직인 요소객체에 대한 이벤트 처리.
1. $("상위객체").on("이벤트","만들어질요소객체",function(){이벤트 핸들러 함수..});		
		--%>	
		$("#createBtn").on("click",function(){
			$("#show").append("<button type='button' class='nBtn'>생성된 버튼</button>")
		});
		// 생성된 버튼에 대한 이벤트 처리.. 
		$("body").on("click",".nBtn",function(){
			$(this).css("background","yellow");
		});
		// ex) h3를 선언하고, 클릭시, div id="show"에  h4가 추가하여 @@번째 안녕하세요 출력되고,
		//   해당 h4를 클릭시, 배경색상과 글자 색상이 변경되게 처리하세요 2조..
		var cnt=1;
		$("h3").on("click", function() {
	         $("#show").append("<h4 class='nTxt'>"+(cnt++)+" 번째 안녕하세요.</h4>")
		});
	    $("#show").on("click", ".nTxt", function() {
	         $(this).css({'background':'black', 'color':'yellow'});
	    });
		$("[name=message]").on("focus",function(){
			$(this).val(""); /// focus를 했을 때, 공백으로 처리..
		});
		// 1. 사용자 정의 이벤트..
		// $("요소객체").on("사용자정의이벤트명",function(){ 이벤트 처리시, 나타날 내용!!})
		$("[name=message]").on("myCustom",function(){
			$(this).val("메시지를 입력하세요!!");
			$(this).css("background","yellow");
		});
		// 2. 이벤트 강제 수행.. 
		// $(요소객체).trigger("이벤트명")
		$("#btn01").on("click",function(){
			$("[name=message]").trigger("myCustom");
		});
		// ex) #h01 에 사용자 정의 이벤트  myEvent01을 정의하고, 배경색상과 글자크기를 변경시키는 것을 정의하고,
		//     #h02를 클릭시, 위 myEvent01를 수행하게 처리하세요.. 3조
	    $("#h01").on("myEvent",function(){
	        $(this).css({"background":"red","color":"pink"});
	    });
	    $("#h02").on("click",function(){
	          $("#h01").trigger("myEvent");
	    });		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>
  <h1 id="h01">이벤트 대상 !!!</h1>
  <h2 id="h02">이벤트 실행 !!!</h2>  
  
  <input type="text" name="message" id="message" value="입력하세요"><br>
  <button type="button" id="btn01">입력</button>
  
  
  <h3>안녕하세요</h3>
  <button id="createBtn" type="button">생성</button>
  <div id="show"></div>
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