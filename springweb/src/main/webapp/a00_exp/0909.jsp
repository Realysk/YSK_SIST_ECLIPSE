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
<title> REALYSK </title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		# 정리문제
		1. [중:응용] jquery Ajax를 활용하여 회원정보를 조회/등록처리하세요. (jspexp/a02_mvc/A27_AjaxController.java 활용)
		
			
		
		2. [하:개념정리] 스프링의 요청값 get/post방식 처리에 있어서 controller단과 화면단 form설정과의 관계를 기술하세요.
		
			# get방식/post방식으로 요청값 받아서 처리하기.
				RequestMapping : get/post방식 둘다 처리할 수 있다. 요청값 데이터 유형이 맞을 때..
			 * */	
				// 명시적으로 get방식으로 받을 때, 처리한다.
				// http://localhost:7080/springweb/requestexp05.do?name=홍길동
				@GetMapping("requestexp05.do")
				public String requestexp05(@RequestParam("name") String name) {
					return "WEB-INF\\views\\a01_basic\\a05_request.jsp";
				}
				// 명시적으로 post방식으로 받을 때, 처리한다.
				@PostMapping("requestexp06.do")
				public String requestexp06(@RequestParam("name") String name){
					return "WEB-INF\\views\\a01_basic\\a06_request.jsp";
				}	
		
		3. [중:응용] 회원가입 입력화면을 GET방식을 호출하고, 입력처리를 POST방식으로 처리하려 한다. spring 요청방식을 통해 처리하세요.
		
			
		
		4. [하:응용] 물건등록화면에서 물건등록은 요청하여 처리하되, controller단에서 요청값을 객체로 받아서 출력되게 처리하세요.
		
			
		
		5. [하:응용] DI13.java, a13.xml을 만들고 회원정보를 xml을 통해서 등록하고 등록된 내용을 DI13.java를 통해서 출력하세요.
		
			- 완료
		
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