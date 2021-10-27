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
		$("[name=ename],[name=job]").on("keyup",function(){
			// jquery ajax처리
			$.ajax({
				type:"post",
				url:"${path}/empListAjax.do",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(data){
					// data.모델명
					var list = data.empList;
					var show="";
					$(list).each(function(idx, emp){
						show+="<tr class='text-center'>";
						show+="	<td>"+emp.empno+"</td>";
						show+="	<td>"+emp.ename+"</td>";
						show+="	<td>"+emp.job+"</td>";
						show+="	<td>"+emp.mgr+"</td>";
						var dt = new Date(emp.hiredate);
						show+="	<td>"+dt.toLocaleDateString()+"</td>";
						show+="	<td>"+emp.sal+"</td>";
						show+="	<td>"+emp.comm+"</td>";
						show+="	<td>"+emp.deptno+"</td></tr>";
					});
					$("#tab tbody").html(show);
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
<%-- 
		
--%>	
<div class="jumbotron text-center">
  <h2>사원정보</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="ename"  placeholder="사원명" />
	    <input class="form-control mr-sm-2" name="job"  placeholder="직책명" />
	    <button class="btn btn-info" id="schBtn" type="button">Search</button>
 	</nav>
	</form>
   <table id="tab" class="table table-hover table-striped">

    <thead>
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책명</th>
        <th>관리자번호</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
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