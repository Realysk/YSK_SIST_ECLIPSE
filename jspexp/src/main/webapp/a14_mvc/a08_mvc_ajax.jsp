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
		
		--%>	
		ajaxFun("allsch");
		$("#regBtn").on("click",function(){
			ajaxFun("ins");
		});
	});
	function ajaxFun(proc){
		console.log("처리 프로세스:"+proc);
		var snd = "proc="+proc+((proc=="ins")?"&"+$("#frm01").serialize():"");
		console.log(snd);
		
		$.ajax({
			type:"post",
			url:"${path}/schMember2.do",
			data:"proc="+proc+((proc=="ins")?"&"+$("#frm01").serialize():""),
			dataType:"json",
			success:function(data){
				console.log("결과");
				console.log(data);
				var mlist = data;
				if(proc=="ins"){
					mlist = data.list;
					alert(data.result);
				}
				var show="";
				$(mlist).each(function(idx, mem){
					show+="<tr  class='text-center'><td>"+mem.id+"</td><td>"+mem.pass+"</td><td>"+
					mem.name+"</td><td>"+mem.auth+"</td><td>"+mem.point+"</td></tr>"
					
				});
				$("tbody").html(show);
			},
			error:function(err){
				console.log(err);
			}
		});

	}
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2 >회원정보</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="아이디" name="id"/>
	    <input class="form-control mr-sm-2" placeholder="패스워드" name="pass"/>
	    <input class="form-control mr-sm-2" placeholder="이름" name="name"/>
	    <input class="form-control mr-sm-2" placeholder="권한" name="auth"/>
	    <input class="form-control mr-sm-2" placeholder="포인트" name="point"/>
	    <button class="btn btn-info" type="button" id="regBtn">등록</button>
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
        <th>아이디</th>
        <th>패스워드</th>
        <th>이름</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>	
    <tbody>
    	<tr  class="text-center"><td></td><td></td><td></td><td></td><td></td></tr>
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