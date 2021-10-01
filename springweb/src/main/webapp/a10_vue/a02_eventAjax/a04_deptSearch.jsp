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
	EX) a04_deptSearch.jsp로 부서정보를 vue로 출력하세요.
		http://localhost:7080/springweb/deptAjax.do
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
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)",dname:"",loc:"",deptList:[]},
			methods:{
				search1:function(e){
					if(e.keyCode==13){
						console.log("enter키 입력");
						this.fetchList();
					}
				},
				search2:function(){
					console.log("버튼 클릭");
					this.fetchList();

				},				
				fetchList:function(){
					this.deptList=[]; // 초기화 처리..
					var url = "${path}/deptAjax.do?dname="+this.dname+"&loc="+this.loc;
					// this : 현재 Vue 객체를 지정하는데, fetch api를 쓰면 this가 fetch api 객체를 지정하기에 
					// Vue 객체를 지칭하는 변수를 따로 선언.
					var vm = this;
					fetch(url).then(function(response){
						console.log("#서버에서 온 response#");
						console.log(response);						
						return response.json();
					}).then(function(json){
						console.log("#서버에서 온 json 데이터#");
						console.log(json);
						// 서버에서 온 데이터를 모델데이터로 할당
						vm.deptList = json.deptList;
						
					}).catch(function(err){
						console.log(err);
					});
				}
			}
		}); 	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >부서정보검색(vue)</h2>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" @keyup="search1" v-model="dname" placeholder="부서명"/>
	    <input class="form-control mr-sm-2" @keyup="search1" v-model="loc" placeholder="부서지역"/>
	    <button class="btn btn-info" type="button" @click="search2">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
    <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>부서지역</th>
      </tr>
    </thead>	
    <tbody>
    	<tr class="text-center" v-for="dept in deptList">
    		<td>{{dept.deptno}}</td><td>{{dept.dname}}</td><td>{{dept.loc}}</td>
    	</tr>
    </tbody>
	</table>    
</div>
</body>
</html>