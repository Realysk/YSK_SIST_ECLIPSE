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
		
		--%>
		$("#schBtn").click(function() {
			procAjax("memberListAjax.do", "#frm01");
		});
		$("#frm01 [name=name], #frm01 [name=auth]").keyup(function(e) {
			if(e.keyCode==13) { // 입력 시 enter
				procAjax("memberListAjax.do", "#frm01");
			}
		});
	});
	function procAjax(url, form) { // 조회리스트와 등록을 동시에 처리하기 위한 AJAX 함수
		$.ajax({
			type:"post",
			url:"${path}/"+url,
			data:$(form).serialize(),
			dataType:"json",
			success:function(data) {
				console.log(data);
				console.log(data.memList);
				var list = data.memList;
				var show = "";
				$(list).each(function(idx, mem) {
					show += "<tr class='text-center'><td>" + mem.id + "</td><td>" + mem.pass + "</td><td>" + mem.name + "</td><td>" + mem.auth + "</td><td>" + mem.point + "</td></tr>"
				});
				$("tbody").html(show);
			},
			error:function(err) {
				console.log(err);
			}
		});
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>회원 정보</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="name" placeholder="이름"/>
	    <input class="form-control mr-sm-2" name="auth" placeholder="권한"/>
	    <button class="btn btn-info" type="button" id="schBtn">검색</button>
	    <button class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" type="button" id="regBtn">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
    <thead>
    
      <tr class="table-success text-center">
        <th>ID</th>
        <th>PASS</th>
        <th>NAME</th>
        <th>AUTH</th>
        <th>POINT</th>
      </tr>
    </thead>	
    <tbody>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form" method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="ID" name="id">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="PASS" name="pass">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="NAME" name="name">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="AUTH" name="auth">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="POINT" name="point">
	      </div>
	      	      
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="regMemberBtn" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>