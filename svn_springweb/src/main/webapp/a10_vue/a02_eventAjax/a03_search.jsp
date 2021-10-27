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
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)",ename:"",job:"",empList:[]},
			methods:{
				search1:function(e){
					this.ename = this.ename.toUpperCase();
					this.job = this.job.toUpperCase();	
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
				
					this.emplist=[]; // 초기화 처리..
					var url = "${path}/empListAjax.do?ename="+this.ename+"&job="+this.job;
					// this : 현재 Vue 객체를 지정하는데, fetch api를 쓰면 this가 fetch api 객체를 지정하기에 
					// Vue 객체를 지칭하는 변수를 따로 선언.
					// 따로 vm이라는 변수를 선언하여, 하위 메서드에서 이 객체가 가지고 있는
					// 모델 데이터를 접근해서 사용할려는 목적..
					var vm = this;
					fetch(url).then(function(response){
						console.log("#서버에서 온 response#");
						console.log(response);	
						// 서버에서 온 reponse 객체 중에서 json 데이터만 받아서 처리..
						return response.json();
					}).then(function(json){
						console.log("#서버에서 온 json  데이터#");
						console.log(json);
						// 서버에서 온데이터를 모델데이터로 하당.
						vm.empList = json.empList;
						
					}).catch(function(err){
						console.log(err);
					});
				}
			}
		});	
		<%-- 
# vue를 통한 ajax처리.
1. 핵심 프로세스
	0) lib 선언
		<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
		
    0) 모델 데이터 초기 선언 : data:{ename:"",job:"",emplist:[]}
	1) key/click이벤트를 통해서 methods에 있는 특정 기능메서드 호출.
	2) 기능메서드1 : 검색데이터의 유효성  check
		공백이 아닐 때 등..
	3) 기능메서드2 : 유효성 check된 후, ajax 처리.
		- 위 모델 데이터의 초기화 : this.emplist = [];
		- ajax처리될 url선언 : var url = "${path}/empListAjax.do?ename="+this.ename
										+"&job="+this.job;
		- fetch(url).then(함수1).then(함수2).catch(함수3);
			익명 함수1:
				서버에서 온 response값 확인 및 이 중에서 json데이터 return 처리
					return response.json();
			익명 함수2:
				받은 json데이터를 
				현재 model에 있는 데이터에 할당..
			익명 함수3:
				error 내용 처리..
	4) model 데이터 v-for를 이용해서 화면 출력..
							
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >사원정보검색(vue)</h2>

</div>
<%--
			data:{msg:"시작!!(뷰와함께)",ename:"",job:"",emplist:[]},
			methods:{
				search1:function(e){
					if(e.keyCode==13){
						console.log("enter키 입력");
					}
				},
				search2:function(){
					console.log("버튼 클릭");
				},				
				fetchList:function(){
					
				}
			}
 --%>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" @keyup="search1" v-model="ename" placeholder="사원명" />
	    <input class="form-control mr-sm-2" @keyup="search1" v-model="job"   placeholder="직책명" />
	    <button class="btn btn-info" type="button" @click="search2">Search</button>
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
        <th>부서번호</th>
      </tr>
    </thead>	
    <tbody>
    	<tr class="text-center" v-for="emp in empList">
    		<td>{{emp.empno}}</td><td>{{emp.ename}}</td>
    		<td>{{emp.job}}</td><td>{{emp.sal}}</td><td>{{emp.deptno}}</td></tr>
    </tbody>
	</table>
	<!-- 
	EX) a04_deptSearch.jsp로 부서정보를 vue로 출력하세요.
		 http://localhost:7080/springweb/deptAjax.do
	 -->    
    
</div>

</body>
</html>