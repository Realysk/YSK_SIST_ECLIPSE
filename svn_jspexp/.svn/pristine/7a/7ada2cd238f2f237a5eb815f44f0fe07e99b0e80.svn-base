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
# 

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
# jquery를 통한 ajax 처리..
1. 서버의 데이터를 대상 엘리먼트를 삽입하기.
	$("대상객체").load("서버의 주소");	
	$("대상객체").load("서버의 주소","요청값");	
	$("대상객체").load("서버의 주소","요청값",fuction(data){ 결과 처리 콜백함수});
	
2. $.ajax({옵션});
	요청의 생성 방법과 통보 받을 콜백을 제어하고자 전달된 options를 사용하여
	ajax요청을 전송한다. 반환값는 xhr인스턴스이다.
	1) 옵션
	url : 요청 주소, ex) {"url":"${path}/emp.do"}
	type : get/post 방식을 선언
	data : 요청값을 선언한다. query string 형식과 객체형식으로 선언이 가능하다.
		ex){"data":"name=홍길동&age=25"}		
		ex){"data":{name:"홍길동",age:25}}		
		ex){"data":$("form").serialize()}
	dataType : 응답의 결과로 반환되는 데이터의 종류를 선언하는 부분.
		xml : xml 문서
		html : jsp나 html의 내용을 가져올 때, 활용
		json : json 객체 형식으로 가져올 때, 사용된다. JSON.parse()를 쓰지 않아도
			객체로 바로 사용이 가능하다.
		text : 응답 텍스트형식을 말한다.
	success:function(){}
		응답이 성공 상태 코드를 반호나하면, 호출되는 함수, 응답 본문은 이 함수의 
		첫번째 매개변수로 전달되면, dataType 프로퍼티에 명시한 형태로 구성된다.
		두 번째 매개변수는 상태 값을 나타내는 문자열이며, 이번 경우에는 항상 success다.
	 error:function(){}
	 	응답이 에러 상태 코드를 반환하면 호출되는 함수, 매개변수가 세개 전달되는데,
	 	각각 xhr인스턴스, 상태 값이 항상 error인 메시지 문자열, 선택사항으로 xhr
	 	인스턴스가 반환한 예외 객체이다.			
		--%>
	 	$("[name=ename],[name=job]").keyup(function(){
	 		// 1. jsp 호출'
	 		$.ajax({
	 			url:"${path}/z03_ajax/z13_data.jsp",
	 			type:"post",
	 			data:$("#frm01").serialize(),
	 			dataType:"html",
	 			success:function(data){// 상태값 4, http응답코드 200
	 				//alert(data);
	 				$("#show").html(data);
	 			},
	 			error:function(err){
	 				console.log(err); //
	 			}
	 			
	 		});
	 	});
	 	// EX) z03_ajax\z12_data.jsp를 활용하여 $.ajax로 id와 패스워드 입력 후,
	 	// 결과를 출력하세요  5조..
	 	$("[name=id],[name=pass]").keyup(function(event){
	 		// 1. jsp 호출'
	 		if(event.keyCode==13){
		 		$.ajax({
		 			url:"${path}/z03_ajax/z12_data.jsp",
		 			type:"post",
		 			data:$("#frm02").serialize(),
		 			dataType:"html",
		 			success:function(data){
		 				$("#show2").html(data);
		 			},
		 			error:function(err){
		 				console.log(err); 
		 			}	 			
		 		});
	 		}
	 	});	 	
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm02" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="id" placeholder="아이디" />
	    <input class="form-control mr-sm-2" type="password" 
	    	name="pass" placeholder="패스워드" />
	    <button class="btn btn-info" type="button">Search</button>
 	</nav>
	</form>    
  	<div id="show2">
	</div>  
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="ename" placeholder="사원명" />
	    <input class="form-control mr-sm-2" name="job" placeholder="직책명" />
	    <button class="btn btn-info" type="button">Search</button>
 	</nav>
	</form>
	<div id="show">
	</div>
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