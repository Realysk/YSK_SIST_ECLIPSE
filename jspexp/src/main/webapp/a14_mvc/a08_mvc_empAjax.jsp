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
	var xhr = new XMLHttpRequest();
	$(document).ready(function(){
		<%-- 
		
		--%>
		
		$("#frm01 [name=ename], #frm01 [name=job]").keyup(function(event){
			//if(event.keyCode==13){
				$(this).val($(this).val().trim().toUpperCase());
				schFun();	
			//}
		});
		$("#schBtn").click(function(){
			schFun();
		});
		function schFun(){
			var enameV = $("[name=ename]").val();
			var jobV = $("[name=job]").val();
			var qstr = "proc=sch&ename="+enameV+"&job="+jobV;
			xhr.open("get","${path}/ajaxEmp.do?"+qstr,true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					var elist = JSON.parse(xhr.responseText);
					console.log(elist);
					var show="";
					$(elist).each(function(idx,emp){
						show+="<tr class='text-center'  data-toggle='modal'"+
						" onclick='detail("+emp.empno+")' data-target='#exampleModalCenter'><td>"
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
		// script ?????? ????????? ???????????????.
		/*
		function detail(empno){
			$("#frm02 [name=ename]").val("?????????");
			//alert(empno);
			
		} */	
		// ?????? ?????? ????????? ??????..
		$("#insFrmBtn").on("click",function(){
			$("#exampleModalLongTitle").text("??????????????????");
			$("#frm02").each(function(){
				this.reset();
			});		
			$("#regBtn").text("??????");
			
		});
		$("#regBtn").on("click",function(){
			
			console.log($("#frm02").serialize());
			
			xhr.open("get","${path}/ajaxEmp.do?proc=insert&"+$("#frm02").serialize(),true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4&&xhr.status==200){
					var elist = JSON.parse(xhr.responseText);
					//console.log(elist);
					if(!confirm("?????? ??????\n?????? ?????????????????????????")){
						$("#clsBtn").click();// ?????? ????????? ?????? ????????? ?????? ?????? ??? ??????
					}
					// form??? ?????? ?????? ????????? ??????..
					$("#frm02").each(function(){
						this.reset();
					});		
					var show="";
					$(elist).each(function(idx,emp){
						show+="<tr class='list text-center' data-toggle='modal' onclick='detail("+emp.empno+")' data-target='#exampleModalCenter'><td>"
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
			
		});

	});
	function detail(empno){
		$("#exampleModalLongTitle").text("??????????????????");
		$("#regBtn").text("??????");
		xhr.open("get","${path}/ajaxEmp.do?proc=detail&empno="+empno,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				var emp = JSON.parse(xhr.responseText);
				$("#frm02 [name=empno]").val(emp.empno);
				$("#frm02 [name=ename]").val(emp.ename);
				$("#frm02 [name=job]").val(emp.job);
				$("#frm02 [name=mgr]").val(emp.mgr);

				$("#frm02 [name=hiredateS]").val(emp.hiredateS);
				$("#frm02 [name=sal]").val(emp.sal);				
				$("#frm02 [name=comm]").val(emp.comm);				
				$("#frm02 [name=deptno]").val(emp.deptno);				
			}
		};
		xhr.send();			
		
	}	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >????????????</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="ename" placeholder="?????????" />
	    <input class="form-control mr-sm-2" name="job" placeholder="?????????" />
	    <button class="btn btn-info" type="button" id="schBtn">Search</button>
	    <button class="btn btn-success" type="button" id="insFrmBtn"
	    	data-toggle='modal' data-target='#exampleModalCenter'
	    	
	    	>??????</button>
	    
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
        <th>????????????</th>
        <th>?????????</th>
        <th>?????????</th>
        <th>??????</th>
        <th>?????????</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">????????????</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="????????????(????????????????????????)" name="empno" >
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="???????????? ??????" name="deptno">
	      </div>
	     </div> 		
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="????????? ??????" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="????????? ??????" name="job">
	      </div>
	     </div> 
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="??????????????? ??????" name="mgr">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control"
				 onfocus="(this.type='date')" placeholder="????????? ??????(YYYY-MM-DD)" name="hiredateS">
	      </div>
	    </div> 
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="?????? ??????" name="sal">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="????????? ??????" name="comm">
	      </div>
	    </div> 
		</form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="regBtn">??????</button>      
        <button type="button" class="btn btn-secondary" id="clsBtn" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
</body>
</html>