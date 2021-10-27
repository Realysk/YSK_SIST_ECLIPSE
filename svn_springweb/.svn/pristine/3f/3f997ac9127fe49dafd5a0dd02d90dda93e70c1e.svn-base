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
# 양방향 directive
1. 입력형식의 태그 :form의 하위 객체 input, select, textarea
	에 속성을 v-model로 설정하여 모델명과 mapping하면,
	모델데이터에 입력된 데이터가 동기화가 된다.
	
	입력값 ==> 모델 데이터 ==> 모델데이터를 통한 출력.
	
2. model과 연결된 요소객체는 영향을 받아, 해당 모델데이터로 
	출력되기 때문에 양방향으로 입력값이 출력 처리된다.	

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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		var model = {msg:"",num01:0,num02:0};
		var vm = new Vue({
			el:".container",
			data:model
		});
		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>양방향 디렉티브</h2>
</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  		<!--  입력형식의 form 하위 객체  v-model="모델명" -->
	    <input class="form-control mr-sm-2" v-model="msg" placeholder="메시지입력.." />
	    <input class="form-control mr-sm-2" v-model="num01" placeholder="숫자1" />
	    <input class="form-control mr-sm-2" v-model="num02" placeholder="숫자2" />
 	</nav>
	</form>
   <table class="table table-hover table-striped">
    <thead>
      <tr class="table-success text-center">
        <th>메시지</th><th>연산</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td>{{msg}}</td><td>{{num01}} + {{num02}} = 
    			{{parseInt(num01) + parseInt(num02) }}</td></tr>
    </tbody>
	</table>    
    	<%-- 
		var model = {msg:"",num01:0,num02:0};
		var vm = new Vue({
			el:".container",
			data:model
		});		
		a05_biDirect.html
			입력값을 물건명:[   ] 가격:[   ] 갯수[   ]
			하단에 입력과 동시에 결과를 출력 
				구매정보 : @@@을 @@개 구매하여 총 @@@ 원..
				
		--%>
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