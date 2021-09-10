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
		1. [하:개념정리] IOC란 무엇이며 가상으로 컨테이너를 설정하기 위해 처리할 부분을 기술하세요.
		
			1) Inversion of Control라는 말로 제어의 역전 즉 인스턴스생서부터 소멸까지의 인스턴스 생명주기 관리를 개발자가 아닌 컨테이너가 대신 해준다라는 뜻이다.
			2) 컨테이너 역할을 해주는 프레임워크에서 제어하는 권한을 넘겨서 개발자가 코드를 신경 쓰는 부분을 줄이는 전략이다.
			3) IOC 컨테이너는 객체의 생성을 책임지고, 의존성을 관리한다.
			4) 스프링은 IOC 기반으로 메인 컨테이너(dispatcher-servlet.xml)에 의해 설정되어 진다.
				1) WAS가 시작되면, IOC기반의 컨터이너안에 선언된 객체가 생성되어 메모리에 로딩이 되고,
				2) 이 객체들 간에 연관 관계를 setXXX()에 의해 선언되면, 자동 할당(autowire)가 처리된다.
				3) MVC의 controller, service, dao는 이러한 컨테이너 기반으로 처리되기에,
					따로 new XXXX()로 생성자를 호출할 필요가 없어진다.			
		
		2. [하:응용] 컨테이너의 property, constructor의 차이를 기술하세요.
		
			constructor-args: 의존하는 객체를 생성자를 통해 전달(주입)받는다.
			property: setter라는 메소드를 이용하여 의존하는 객체를 주입한다.
			* 결국 주입하는 대상이 생성자냐, 메소드냐의 차이이다.
		
		3. [하:응용] Note와 Pencil 클래스를 선언하고 1:1 관계의 내용을 a18.xml, DI18.java를 통해서 설정하여 출력하세요.
		
			
		
		4. [중:응용] Computer와 PartDevice(컴퓨터부품(추상클래스) 하위 상속 Ram, Hdd, Cpu) 클래스를 선언하고, 1:다 관계의 내용을 a18.xml, DI18.java를 통해 설정하여 출력하세요.
		
			
		
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