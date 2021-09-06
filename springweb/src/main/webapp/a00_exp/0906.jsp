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

<body>
<!-- 
# 정리문제
	1. 모델2와 모델1의 궁극적인 차이를 화면로딩 방식, 모델데이터 활용, controller의 주요 기능을 통해서 기술하세요.
	
		
	
	2. gson api의 기능 메서드를 기술하세요.
	
		
	
	3. MVC를 통한 ajax를 처리의 핵심 프로세스를 Controller, Service, Dao, View, Model의 소스를 나누어서 핵심 코드와 함께 설명하세요.
	
		
	
	4. MVC 패턴을 이용해서 사원정보(Emp)의 조회 리스트를 ajax로 처리하세요.
	
		
	
	5. dynamic web 개발환경에서 spring환경으로 처리하기 위한 필요한 내용을 기술하세요.
	
		
	
	6. spring의 요청값과 모델 처리 기본 코드를 설명하세요.
	
		
	
	7. 아래 주소를 통해 내용이 처리되게 하세요.
		http://localhost:7080/springweb/requestexp04.do
		=> 이름:익명, 나이:0, 사는곳:입력필요
		http://localhost:7080/springweb/requestexp04.do?name=홍길동&age=25&loc=서울신림동
		=> 이름:홍길동, 나이:25, 사는곳:서울신림동
		
		
		
 -->
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