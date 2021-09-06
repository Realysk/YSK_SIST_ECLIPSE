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
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
		var xhr = new XMLHttpRequest();
		$("[name=ename], [name=job]").keyup(function(event){
			if(event.keyCode==13){
				schFun();	
			}
		});
		$("#schBtn").click(function(){
			schFun();
		});
		function schFun(){
			var enameV = $("[name=ename]").val();
			var jobV = $("[name=job]").val();
			var qstr = "ename="+enameV+"&job="+jobV;
			xhr.open("get","${path}/ajaxEmp.do?"+qstr,true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					var elist = JSON.parse(xhr.responseText);
					console.log(elist);
					var show="";
					$(elist).each(function(idx,emp){
						show+="<tr class='text-center'><td>"
								+emp.empno+"</td>";
						show+="<td>"+emp.ename+"</td>";
						show+="<td>"+emp.job+"</td>";
						show+="<td>"+emp.sal+"</td>";
						show+="<td>"+emp.deptno+"</td></tr>";
						
					});
					$("tbody").html(show);				
				}
			};
			xhr.send();			
		}
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">사원정보</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="ename" placeholder="사원명" />
	    <input class="form-control mr-sm-2" name="job" placeholder="직책명" />
	    <button class="btn btn-info" type="button" id="schBtn">Search</button>
	    
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
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책명</th>
        <th>급여</th>
        <th>부서명</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
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