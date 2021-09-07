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
<title> REALYSK'S PAGE </title>
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
<!-- 
# 일일정리
	1. [하:프로세스정리] MVC 패턴을 리스트, 입력, 수정, 삭제를 하려고 한다. view단과 controller단에 처리할 내용과 조건 프로세스를 정리해보자
	
		Controller : 해당 view단에 넘길 요청값들을 선언, 
		Service : 해당 기능을 동작하게 할 메서드 선언
		DAO : 등록, 수정, 삭제에 대한 기능 메서드 선언
		View : 화면단 처리
	
	2. [하:키워드조회] 전날 MVC ajax로 만들어진 사원정보리스트에서 key 입력시 대문자로 변환 및 바로 조회가 되게 처리하세요.
	
	
	
	3. [상] 현재 부트스트랩 템플릿은 타이틀을 클릭 시, 모달창이 뜨게 된다. 이것을 이용해서 등록버튼을 만들어 사원정보 등록 화면을 만들고 ajax로 등록되게 하세요. (기존 controller/service, dao활용)
	
	
	
	4. [하:키워드] 한 요소객체에 여러 개의 이벤트를 적용하려고 한다. 기본 형식을 정리하세요.
	
		$("변수명").on({
			'이벤트명':function(){
				$(this).val('').css({'속성':'속성값','속성':'속성값'});
			},
			'이벤트명':function(){
				$(변수).text($(this).val());
				$(this).val("");
			}
		});	
	
	5. [하] h1을 클릭 시 배경색상이 변하고 더블클릭시 alert창이 뜨게 처리하세요.
	
		
	
	6. [하:키워드] 마우스관련 이벤트를 정리하세요.
	
		mousedown : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고, 마우스 버튼을 눌렀을 때 발생
		mouseup : 모든 엘리먼트, 엘리먼트 위에 마우스 포인터가 위치되어 있고, 마우스 버튼을 놓을 때 발생
		mousemove : 모든 엘리먼트, 마우스 포인터가 엘리먼트 내부에서 움직일 때 발생
		mouseover : 모든 엘리먼트, 마우스 포인터가 엘리먼트 안으로 이동할 때 발생
		mouseout : 모든 엘리먼트, 마우스 포인터가 엘리먼트에서 벗어날 때 발생		
	
	7. [중] 숫자 1~9까지 있는 3X3 테이블을 만들고 해당 셀을 클릭 시 클자가 커지고 마우스커서가 위치시켰을 때 배경색상이 바뀌고 마우스커서가 해당 셀을 벗어날 때 원래 색상으로 돌아오게 처리하세요.
	
	
	
	8. [중] 전날 마지막예제 좋아요/싫어요 처리 소스를 확인하고 숫자를 ♥의 갯수로 표현하세요. z02_jquery\a05_event\a01_basic.jsp
	
	
	
 -->
<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>
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
<div id="dialog" title="Basic dialog">
  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>
</body>
</html>