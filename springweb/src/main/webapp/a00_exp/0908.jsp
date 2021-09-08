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
<style type="text/css">
	td{text-align:center;font-size:30pt;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
# 일일정리
[중:이벤트응용]1. 3X3 테이블에서 중앙에 노랑색 배경색상이 있고, 키보드의 방향키에 따라서 해당 방향으로 배경색상이 변경되고, 
           기존 td는 초기값으로 변경되게 처리하세요.
--%>
		$("#tab01 td").each(function(idx, el){
			$(el).text(idx);
			//$(el).css("background","yellow");
		});
		$("#tab01 td").eq(4).css("background","yellow");
		// $(this) : $(document) 즉, 현재 화면 전체에 대한 이벤트 인식 특히, 화면전체 key이벤트 처리시 활용
		$(this).on({"keydown":function(event){
				$("#tab01 td").css("background","");//전체 배경색상 초기로 돌리고
				//$("#scode").text(event.keyCode); 화살표 코드값 확인
				if(event.keyCode==37) $("#tab01 td").eq(3).css("background","yellow");
				//if(event.keyCode==37 && event.keyCode==38) $("#tab01 td").eq(0).css("background","yellow");
				if(event.keyCode==38) $("#tab01 td").eq(1).css("background","yellow");
				if(event.keyCode==39) $("#tab01 td").eq(5).css("background","yellow");
				if(event.keyCode==40) $("#tab01 td").eq(7).css("background","yellow");
			},"keyup":function(){
				$("#tab01 td").css("background","");
				$("#tab01 td").eq(4).css("background","yellow");
			}
		});		

<%--
[하:개념정리]2. 앞으로 추가할 요소객체에 대한 이벤트 처리의 기본형식을 기술하세요.
	앞으로 추가할 요소객체 : 이벤트에 의해서 현재화면에는 없지만 새로 생성될 요소객체, 바로 이벤트를 처리하는 것은 수행이 되지 않는다.
	$("화면에있는상위객체").on("이벤트명","추가할요소객체",function(){ 이벤트 핸들러 함수 내용...});

[상]3. 전날 진행한 부트스트랩 등록화면 모달을 활용하여, 리스트된 row 사원정보를 클릭시, 
      상세화면을 ajax로 출력되게 하세요.(기존controller/serivce,dao활용)
      모달 처리 해당 이벤트 요소 : <tr data-toggle="modal" data-target="#exampleModalCenter">
      사원정보를 처리 : <tr onclick='detail("+empno+")'
      ajax 처리함수 지정..
      	function detail(empno){
      		요청값 empno, 
      		ajax 처리 
      		결과 var emp = JSON.parse(xhr.responseText);
      		$("#form02 [name=empno]").val(emp.empno);
      		
      	}
            
[하:개념정리]4. 사용자정의 이벤트를 지정하여, 해당 이벤트를 강제 수행하는 기본형식을 기술하세요.
	$("요소객체").on("사용자정의이벤트", 이벤트핸들러);
	$("호출객체").on("이벤트",function(){
		$(this).trigger("사용자정의이벤트");
	});

[중:응용]5. h4로 무지개 색을 영문을 출력하고, 사용자 정의에 의해 해당 내용을 클릭시, 배경색상이 변경되게 하세요.
--%>
$("h4").on("userEvent",function(){
	$(this).css("background",$(this).text());
});
$("h4").on("click",function(){
	$(this).trigger("userEvent");
})
<%--
[하:개념정리]6. jquery ajax의 속성을 기술하세요.
	$("선택자").load();
	$.ajax({속성:속성값,...});
	1) 속성
	url : 요청 주소
	type : get/post
	data : 요청값을 선언한다. query string(key=value&key2=value2), 객체형식({key:value,key2:value2})
	dataType : 응답 결과로 반환되는 데이터 종류.
		xml, html(jsp, html), json, text
	success:function(data){}
		응답 결과로 반환되는 실제 데이터.
	error:function(err){}
		상태 에러 코드
[중:응용]7. 전날 jquery ajax를 활용하여 jspexp\src\main\webapp\z03_ajax\z11_data.jsp의 요청값을 전달하고,
        화면을 출력하세요.
--%>
<%--        
# 오늘의 목표
1. 스프링의 객체를 활용한 요청값을 처리하고, 공통 모델의 개념을 알고 처리할 수 있다.
2. 스프링의 DI 개념을 알고, 기본 환경을 설정하고 처리할 수 있다.
3. DI의 생성자와 프로퍼티를 활용 할 수 있다.
4. DI의 객체 참조와 List형 객체를 활용 할 수 있다.
# 핵심키워드
1. IOC, DI
2. constructor-arg, property, ref bean
		--%>
		$("#callAjax").click(function(){
			$.ajax({
				url:"z11_data.jsp",
				type:"post",
				data:$("#frm01").serialize(),
				dataType:"html",
				success:function(data){
					$("#show03").html(data);
				},
				error:function(err){
					console.log(err);
				}
				
			});
			
			
		});

	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  	<h2 data-toggle="modal" data-target="#exampleModalCenter">연습문제</h2>
  	<h3>ajax 데이터 호출</h3>

   	<h1 id="scode"></h1>
   	<h4>red</h4>
   	<h4>orange</h4>
   	<h4>yellow</h4>
   	<h4>green</h4>
   	<h4>blue</h4>
   	<h4>navy</h4>
   	<h4>purple</h4>
</div>
<div class="container">   
   <table id="tab01" class="table table-hover table-striped" height="300pt">
   	<col width="33%"><col width="33%"><col width="33%">
    <thead>
    <tbody>
    	<tr><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td></tr>
    </tbody>
	</table>  
	

    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="물건명" name="name" />
	    <input class="form-control mr-sm-2" placeholder="가격" name="price"  />
	    <input class="form-control mr-sm-2" placeholder="갯수" name="cnt" />
	    <button class="btn btn-info" type="button" id="callAjax">ajax 호출</button>
 	</nav>
	</form>
	<div id="show03">
	
	</div>
  
    
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